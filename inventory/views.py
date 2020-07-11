from .forms import (  CategoryForm, ItemForm, ItemQueryForm, Item_ItemXRoleFormset, LocationForm, MakeModelForm, MakeModel_MakeModelXCategoryFormset, RecallItemQueryForm, RoleForm, Role_ItemXRoleFormset )
from .models import(ItemQuery, ItemXRole, Category, Item, ItemHistory, Location, MakeModel, Role, UserParameters,)
from datetime import date, timedelta
from django.contrib.auth import (get_user, get_user_model,)
from django.contrib.auth.mixins import PermissionRequiredMixin
from django.contrib.contenttypes.models import ContentType
from django.core import serializers
from django.core.mail import send_mail
from django.db import transaction
from django.db.models.query import QuerySet
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic.detail import ( DetailView, )
from django.views.generic.edit import (CreateView, DeleteView, UpdateView,)
from django.views.generic.list import ListView
from entities.forms import EntityForm
from entities.models import Entity
from varifields.models import(VariFieldObject, VariFieldSpec, VariFieldValue)
import copy
import inspect
import json
import sys

class ItemList(PermissionRequiredMixin, ListView):
    permission_required = "inventory.view_item"
    model = Item

    def get_queryset(self, **kwargs):
        queryset = super().get_queryset(**kwargs)

        have_query=False
        filter_parameters={}
        exclude_parameters={}
        raw_filter_parameters={}
        if self.request.GET:
            if 'recall_item_query' in self.request.GET:
                recall_item_query_form=RecallItemQueryForm(self.request.GET, user=self.request.user)
                if recall_item_query_form.is_valid():
                    item_query = ItemQuery.objects.get(pk=int(recall_item_query_form.cleaned_data['recall_item_query']))
                    for field in item_query._meta.get_fields():
                        if 'ManyRelatedManager' == getattr(item_query, field.name).__class__.__name__:
                            raw_filter_parameters[field.name]=[]
                            for obj in getattr(item_query, field.name).all():
                                raw_filter_parameters[field.name].append(obj)
                        else:
                            raw_filter_parameters[field.name]=getattr(item_query, field.name)
                    if 'delete_item_query' in self.request.GET:
                        item_query.delete()
                    else:
                        # to update the time stamp
                        item_query.save()
                    have_query=True
                else:
                    print(inspect.currentframe().f_lineno)
                    print("Form Error")
                    print(recall_load_query_form.errors)
                    
            else:
                item_query_form = ItemQueryForm(self.request.GET)
                if item_query_form.is_valid():
                    item_query=item_query_form.save(commit=False)
                    item_query.user = self.request.user
                    raw_filter_parameters=item_query_form.cleaned_data
                    do_save=False
                    if 'do_save' in raw_filter_parameters:
                        do_save = raw_filter_parameters.pop('do_save')
                    if not do_save:
                        #even if not do_save, the query will be saved but without a name
                        item_query.query_name=''

                    item_query_queryset = ItemQuery.objects.filter(user=self.request.user, query_name=item_query.query_name)

                    if item_query_queryset.exists():
                        #if it exists, set the id so the save function updates the query
                        item_query.id = item_query_queryset[0].id

                    item_query_form.save()
                    have_query=True
                else:
                    print(inspect.currentframe().f_lineno)
                    print("Form Error")
                    print(item_query_form.errors)


        if not have_query:
            item_query_queryset = ItemQuery.objects.all() 
            if item_query_queryset.exists():
                item_query = item_query_queryset[0]
                for field in item_query._meta.get_fields():
                    raw_filter_parameters[field.name]=getattr(item_query, field.name)

        if 'quick_search_use' in raw_filter_parameters:
            if True == raw_filter_parameters['quick_search_use']:
                quick_search_value = raw_filter_parameters['quick_search_value']
                queryset=queryset.filter(notification_group__name__icontains=quick_search_value) | queryset.filter(job_name__icontains=quick_search_value) | queryset.filter(ponumber__icontains=quick_search_value) | queryset.filter(description__icontains=quick_search_value) | queryset.filter(builder__name__icontains=quick_search_value) | queryset.filter(supplier__name__icontains=quick_search_value) | queryset.filter(sponumber__icontains=quick_search_value)

                del raw_filter_parameters['quick_search_use'] #to keep it from showing up in the following operation

        for paramkey, parameter in raw_filter_parameters.items():
            if '_use' == paramkey[-4:]:
                if True == parameter:
                    barekey = paramkey[:-4:]
                    if 'exclude__' == raw_filter_parameters[barekey+'_operator'][:9]:
                        exclude_parameters[raw_filter_parameters[barekey+'_operator'][9:]]=raw_filter_parameters[barekey+'_value']
                    else:
                        filter_parameters[raw_filter_parameters[barekey+'_operator']]=raw_filter_parameters[barekey+'_value']

        print(inspect.currentframe().f_lineno)
        print("filter_parameters")
        print(filter_parameters)
        try:
            queryset=queryset.filter(**filter_parameters)
        except Exception as e:
            print(inspect.currentframe().f_lineno)
            print("Exception")
            print(e)
            for i in sys.exc_info():
                print (i)

        try:
            for paramkey, parameter in exclude_parameters.items():
                queryset = queryset.exclude(**{paramkey: parameter})
        except Exception as e:
            print(inspect.currentframe().f_lineno)
            print("Exception")
            print(e)
            for i in sys.exc_info():
                print (i)


        orderby_list = []
        for orderby in ['orderby1','orderby2','orderby3']:
            if orderby in raw_filter_parameters:
                if '' < raw_filter_parameters[orderby]:
                    if raw_filter_parameters[orderby] in ItemQuery.ORDERBY_CHOICES:
                        orderby_list.append(raw_filter_parameters[orderby])

        if orderby_list:
            try:
                queryset=queryset.order_by(*orderby_list)
            except Exception as e:
                print(inspect.currentframe().f_lineno)
                print("Exception")
                print(e)
                for i in sys.exc_info():
                    print (i)

        if 'paginate_by' in raw_filter_parameters:
            self.paginate_by = int(raw_filter_parameters['paginate_by'])


        return queryset

    def get_context_data(self, **kwargs):

        context_data = super().get_context_data()
        try:
            item_query = ItemQuery.objects.all()[0]
        except Exception as e:

            print(inspect.currentframe().f_lineno)
            print("Exception")
            print(e)
            for i in sys.exc_info():
                print (i)

            item_query = ItemQuery.objects.create(user=self.request.user, query_name='')

        context_data['item_query_form'] = ItemQueryForm(instance=item_query)

        context_data['recall_item_query_form'] = RecallItemQueryForm(initial={'recall_item_query':item_query}, user=self.request.user)


        return context_data

class ItemCreate(PermissionRequiredMixin, CreateView):
    permission_required = 'inventory.add_item'
    model = Item
    form_class=ItemForm
    template_name='inventory/item_create_form.html'

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            itemxroles = Item_ItemXRoleFormset(self.request.POST)
        else:
            itemxroles = Item_ItemXRoleFormset()

        context_data['itemxroles']=itemxroles

        return context_data

    def form_valid(self, form):
        response = super().form_valid(form)
        self.object = form.save()

        itemxroles=Item_ItemXRoleFormset(self.request.POST)
        if itemxroles.is_valid():
            itemxroles.instance = self.object
            itemxroles.save()
        else:
            print(inspect.currentframe().f_lineno)
            print("Form Error")
            print(itemxroles.errors)

        description = 'Created: '
        firstloop=True
        for fieldname in form.cleaned_data:
            try:
                item_his = ItemHistory.objects.create(item=self.object, description = 'created with {} =  {}'.format(Item._meta.get_field(fieldname).verbose_name, form.cleaned_data[fieldname]))
            except:
                print ("Error creating history, fieldname=" + fieldname)
                print(sys.exc_info()[0])
                print(sys.exc_info()[1])
                print(sys.exc_info()[2].tb_lineno)
                
        item_his = ItemHistory(item=self.object, description=description)
        item_his.save()
    
        if 'duplicate' in form.cleaned_data:
            if True == form.cleaned_data['duplicate']:
                oldpk=self.object.pk
                self.object.pk=None
                self.object.familiar_name = '[copy]' + self.object.familiar_name
                self.object.save()
                
                itemxroles = ItemXRole.objects.filter(item_id=oldpk);
                for itemxrole in itemxroles:
                    print ( inspect.currentframe().f_lineno )
                    itemxrole.pk=None
                    itemxrole.item_id=self.object.pk
                    itemxrole.save()

                return redirect( reverse_lazy('item_detail', kwargs={'pk': self.object.id }))

        
        return response

    def get_success_url(self):
        return reverse_lazy('item_detail', kwargs={'pk': self.object.id})

class ItemDetail(PermissionRequiredMixin, DetailView):
    permission_required = 'inventory.view_item'
    model = Item

class ItemUpdate(PermissionRequiredMixin, UpdateView):
    permission_required = 'inventory.change_item'
    model = Item
    form_class = ItemForm
    template_name='inventory/item_update_form.html'

    def get_context_data(self, **kwargs):

        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            itemxroles = Item_ItemXRoleFormset(self.request.POST, instance=self.object)
        else:
            itemxroles = Item_ItemXRoleFormset(instance=self.object)

        print(inspect.currentframe().f_lineno)
        print(itemxroles)
        print(inspect.currentframe().f_lineno)
        print(itemxroles.empty_form)

        context_data['itemxroles']=itemxroles

        return context_data

    def form_valid(self, form):

        response = super().form_valid(form)
        
        self.object = form.save()
        itemxroles=Item_ItemXRoleFormset(self.request.POST, instance=self.object)

        if itemxroles.is_valid():
            itemxroles.instance = self.object
            itemxroles.save()
        else:
            print(inspect.currentframe().f_lineno)
            print("Form Error")
            print(itemxroles.errors)

        for fieldname in form.changed_data:
            try:
                item_his = ItemHistory.objects.create(item=self.object, description = '{} changed from {} to {}'.format(Item._meta.get_field(fieldname).verbose_name, form.initial[fieldname], form.cleaned_data[fieldname]))
            except:
                print ("Error creating history, fieldname=" + fieldname)
                print(sys.exc_info()[0])
                print(sys.exc_info()[1])
                print(sys.exc_info()[2].tb_lineno)

        if 'duplicate' in form.cleaned_data:
            if True == form.cleaned_data['duplicate']:
                oldpk=self.object.pk
                self.object.pk=None
                self.object.familiar_name = '[copy]' + self.object.familiar_name
                self.object.save()

                itemxroles = ItemXRole.objects.filter(item_id=oldpk);
                for itemxrole in itemxroles:
                    print ( inspect.currentframe().f_lineno )
                    itemxrole.pk=None
                    itemxrole.item_id=self.object.pk
                    itemxrole.save()
                
                return redirect( reverse_lazy('item_detail', kwargs={'pk': self.object.id }))

        return response

    def get_success_url(self):
        return reverse_lazy('item_detail', kwargs={'pk': self.object.id})

class ItemDelete(PermissionRequiredMixin, DeleteView):
    permission_required = 'inventory.delete_item'
    model = Item
    template_name = 'inventory/item_delete_confirm.html'
    def get_success_url(self):
        return reverse_lazy('item_list')


class ItemAjaxMakeModel(PermissionRequiredMixin, CreateView):
    permission_required = "inventory.add_makemodel"
    model = MakeModel
    form_class = MakeModelForm
    template_name = "inventory/item_ajax_makemodel.html"

    def get_success_url(self):
        return reverse_lazy("item_ajaxsuccess_makemodel", kwargs={'pk': self.object.id})

class ItemAjaxSuccessMakeModel(PermissionRequiredMixin, UpdateView):
    permission_required = "inventory.add_makemodel"
    model = MakeModel
    form_class = MakeModelForm
    template_name = "inventory/item_ajax_makemodel.html"

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        context_data['success'] = 'success'
        return context_data

#class ItemAjaxRoles(PermissionRequiredMixin, CreateView):
#    permission_required = "inventory.add_role"
#    model = Role
#    form_class = RoleForm
#    template_name = "inventory/item_ajax_roles.html"
#
#    def get_success_url(self):
#        return reverse_lazy("item_ajaxsuccess_roles", kwargs={'pk': self.object.id})
#
#class ItemAjaxSuccessRoles(PermissionRequiredMixin, UpdateView):
#    permission_required = "inventory.add_role"
#    model = Role
#    form_class = RoleForm
#    template_name = "inventory/item_ajax_roles.html"
#
#    def get_context_data(self, **kwargs):
#        context_data = super().get_context_data(**kwargs)
#        context_data['success'] = 'success'
#        return context_data

class ItemAjaxRole(PermissionRequiredMixin, CreateView):
    permission_required = "inventory.add_role"
    model = Role
    form_class = RoleForm
    template_name = "inventory/item_ajax_role.html"

    def get_success_url(self):
        return reverse_lazy("item_ajaxsuccess_role", kwargs={'pk': self.object.id})

class ItemAjaxSuccessRole(PermissionRequiredMixin, UpdateView):
    permission_required = "inventory.add_role"
    model = Role
    form_class = RoleForm
    template_name = "inventory/item_ajax_role.html"

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        context_data['success'] = 'success'
        return context_data


class ItemAjaxLocation(PermissionRequiredMixin, CreateView):
    permission_required = "inventory.add_location"
    model = Location
    form_class = LocationForm
    template_name = "inventory/item_ajax_location.html"

    def get_success_url(self):
        return reverse_lazy("item_ajaxsuccess_location", kwargs={'pk': self.object.id})

class ItemAjaxSuccessLocation(PermissionRequiredMixin, UpdateView):
    permission_required = "inventory.add_location"
    model = Location
    form_class = LocationForm
    template_name = "inventory/item_ajax_location.html"

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        context_data['success'] = 'success'
        return context_data


class ItemAjaxEntity(PermissionRequiredMixin, CreateView):
    permission_required = "inventory.add_person"
    model = Entity
    form_class = EntityForm
    template_name = "inventory/item_ajax_person.html"

    def get_success_url(self):
        return reverse_lazy("item_ajaxsuccess_person", kwargs={'pk': self.object.id})

class ItemAjaxSuccessEntity(PermissionRequiredMixin, UpdateView):
    permission_required = "inventory.add_person"
    model = Entity
    form_class = EntityForm
    template_name = "inventory/item_ajax_person.html"

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        context_data['success'] = 'success'
        return context_data


class RoleList(PermissionRequiredMixin, ListView):
    permission_required = "inventory.view_role"
    model = Role

class RoleCreate(PermissionRequiredMixin, CreateView):
    permission_required = 'inventory.add_role'
    model = Role
    form_class=RoleForm
    template_name='inventory/role_create_form.html'

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            itemxroles = Role_ItemXRoleFormset(self.request.POST)
        else:
            itemxroles = Role_ItemXRoleFormset()

        context_data['itemxroles']=itemxroles

        return context_data

    def form_valid(self, form):
        response = super().form_valid(form)
        
        self.object = form.save()
        itemxroles=Role_ItemXRoleFormset(self.request.POST)
        if itemxroles.is_valid():
            itemxroles.instance = self.object
            itemxroles.save()
        else:
            print(inspect.currentframe().f_lineno)
            print("Form Error")
            print(itemxroles.errors)
        
        return response

    def get_success_url(self):
        return reverse_lazy('role_detail', kwargs={'pk': self.object.id})

class RoleDetail(PermissionRequiredMixin, DetailView):
    permission_required = 'inventory.view_role'
    model = Role

class RoleUpdate(PermissionRequiredMixin, UpdateView):
    permission_required = 'inventory.change_role'
    model = Role
    form_class = RoleForm
    template_name='inventory/role_update_form.html'

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            itemxroles = Role_ItemXRoleFormset(self.request.POST, instance=self.object)
        else:
            itemxroles = Role_ItemXRoleFormset(instance=self.object)

        context_data['itemxroles']=itemxroles

        return context_data

    def form_valid(self, form):
        response = super().form_valid(form)
        
        self.object = form.save()
        itemxroles=Role_ItemXRoleFormset(self.request.POST, instance=self.object)
        if itemxroles.is_valid():
            itemxroles.instance = self.object
            itemxroles.save()
        else:
            print(inspect.currentframe().f_lineno)
            print("Form Error")
            print(itemxroles.errors)

        return response

    def get_success_url(self):
        return reverse_lazy('role_detail', kwargs={'pk': self.object.id})

class RoleDelete(PermissionRequiredMixin, DeleteView):
    permission_required = 'inventory.delete_role'
    model = Role
    template_name = 'inventory/role_delete_confirm.html'
    def get_success_url(self):
        return reverse_lazy('role_list')

class RoleAjaxItems(PermissionRequiredMixin, CreateView):
    permission_required = "inventory.add_item"
    model = Item
    form_class = ItemForm
    template_name = "inventory/role_ajax_items.html"

    def get_success_url(self):
        return reverse_lazy("role_ajaxsuccess_items", kwargs={'pk': self.object.id})

class RoleAjaxSuccessItems(PermissionRequiredMixin, UpdateView):
    permission_required = "inventory.add_item"
    model = Item
    form_class = ItemForm
    template_name = "inventory/role_ajax_items.html"

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        context_data['success'] = 'success'
        return context_data

class MakeModelList(PermissionRequiredMixin, ListView):
    permission_required = "inventory.view_makemodel"
    model = MakeModel

class MakeModelCreate(PermissionRequiredMixin, CreateView):
    permission_required = 'inventory.add_makemodel'
    model = MakeModel
    form_class=MakeModelForm
    template_name='inventory/makemodel_create_form.html'

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            makemodelxcategories = MakeModel_MakeModelXCategoryFormset(self.request.POST)
        else:
            makemodelxcategories = MakeModel_MakeModelXCategoryFormset()

        context_data['makemodelxcategories']=makemodelxcategories

        return context_data

    def form_valid(self, form):
        response = super().form_valid(form)
        self.object = form.save()

        makemodelxcategories=MakeModel_MakeModelXCategoryFormset(self.request.POST)
        if makemodelxcategories.is_valid():
            makemodelxcategories.instance = self.object
            makemodelxcategories.save()
        else:
            print(inspect.currentframe().f_lineno)
            print("Form Error")
            print(makemodelxcategories.errors)

        description = 'Created: '
        firstloop=True
        for fieldname in form.cleaned_data:
            try:
                makemodel_his = MakeModelHistory.objects.create(makemodel=self.object, description = 'created with {} =  {}'.format(MakeModel._meta.get_field(fieldname).verbose_name, form.cleaned_data[fieldname]))
            except:
                print ("Error creating history, fieldname=" + fieldname)
                print(sys.exc_info()[0])
                print(sys.exc_info()[1])
                print(sys.exc_info()[2].tb_lineno)
                
        makemodel_his = MakeModelHistory(makemodel=self.object, description=description)
        makemodel_his.save()
    
        return response

    def get_success_url(self):
        return reverse_lazy('makemodel_detail', kwargs={'pk': self.object.id})

class MakeModelDetail(PermissionRequiredMixin, DetailView):
    permission_required = 'inventory.view_makemodel'
    model = MakeModel

class MakeModelUpdate(PermissionRequiredMixin, UpdateView):
    permission_required = 'inventory.change_makemodel'
    model = MakeModel
    form_class = MakeModelForm
    template_name='inventory/makemodel_update_form.html'

    def get_context_data(self, **kwargs):

        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            makemodelxcategories = MakeModel_MakeModelXCategoryFormset(self.request.POST, instance=self.object)
        else:
            makemodelxcategories = MakeModel_MakeModelXCategoryFormset(instance=self.object)

        context_data['makemodelxcategories']=makemodelxcategories

        return context_data

    def form_valid(self, form):

        response = super().form_valid(form)
        
        self.object = form.save()
        makemodelxcategories=MakeModel_MakeModelXCategoryFormset(self.request.POST, instance=self.object)

        if makemodelxcategories.is_valid():
            makemodelxcategories.instance = self.object
            makemodelxcategories.save()
        else:
            print(inspect.currentframe().f_lineno)
            print("Form Error")
            print( makemodelxcategories.errors) 

        for fieldname in form.changed_data:
            try:
                makemodel_his = MakeModelHistory.objects.create(makemodel=self.object, description = '{} changed from {} to {}'.format(MakeModel._meta.get_field(fieldname).verbose_name, form.initial[fieldname], form.cleaned_data[fieldname]))
            except:
                print ("Error creating history, fieldname=" + fieldname)
                print(sys.exc_info()[0])
                print(sys.exc_info()[1])
                print(sys.exc_info()[2].tb_lineno)

        return response

    def get_success_url(self):
        return reverse_lazy('makemodel_detail', kwargs={'pk': self.object.id})

class MakeModelDelete(PermissionRequiredMixin, DeleteView):
    permission_required = 'inventory.delete_makemodel'
    model = MakeModel
    template_name = 'inventory/makemodel_delete_confirm.html'
    def get_success_url(self):
        return reverse_lazy('makemodel_list')

class CategoryList(PermissionRequiredMixin, ListView):
    permission_required = "inventory.view_category"
    model = Category

class CategoryCreate(PermissionRequiredMixin, CreateView):
    permission_required = 'inventory.add_category'
    model = Category
    form_class=CategoryForm
    template_name='inventory/category_create_form.html'

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            itemxcategories = Category_ItemXCategoryFormset(self.request.POST)
        else:
            itemxcategories = Category_ItemXCategoryFormset()

        context_data['itemxcategories']=itemxcategories

        return context_data

    def form_valid(self, form):
        response = super().form_valid(form)
        
        self.object = form.save()
        itemxcategories=Category_ItemXCategoryFormset(self.request.POST)
        if itemxcategories.is_valid():
            itemxcategories.instance = self.object
            itemxcategories.save()
        else:
            print(inspect.currentframe().f_lineno)
            print("Form Error")
            print(itemxcategories.errors)

        
        return response

    def get_success_url(self):
        return reverse_lazy('category_detail', kwargs={'pk': self.object.id})

class CategoryDetail(PermissionRequiredMixin, DetailView):
    permission_required = 'inventory.view_category'
    model = Category

class CategoryUpdate(PermissionRequiredMixin, UpdateView):
    permission_required = 'inventory.change_category'
    model = Category
    form_class = CategoryForm
    template_name='inventory/category_update_form.html'

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            itemxcategories = Category_ItemXCategoryFormset(self.request.POST, instance=self.object)
        else:
            itemxcategories = Category_ItemXCategoryFormset(instance=self.object)

        context_data['itemxcategories']=itemxcategories

        return context_data

    def form_valid(self, form):
        response = super().form_valid(form)
        
        self.object = form.save()
        itemxcategories=Category_ItemXCategoryFormset(self.request.POST, instance=self.object)
        if itemxcategories.is_valid():
            itemxcategories.instance = self.object
            itemxcategories.save()
        else:
            print(inspect.currentframe().f_lineno)
            print("Form Error")
            print ( itemxcategories.errors) 

        return response

    def get_success_url(self):
        return reverse_lazy('category_detail', kwargs={'pk': self.object.id})

class CategoryDelete(PermissionRequiredMixin, DeleteView):
    permission_required = 'inventory.delete_category'
    model = Category
    template_name = 'inventory/category_delete_confirm.html'
    def get_success_url(self):
        return reverse_lazy('category_list')

class CategoryAjaxMakeModels(PermissionRequiredMixin, CreateView):
    permission_required = "inventory.add_item"
    model = Item
    form_class = ItemForm
    template_name = "inventory/category_ajax_items.html"

    def get_success_url(self):
        return reverse_lazy("category_ajaxsuccess_items", kwargs={'pk': self.object.id})

class CategoryAjaxSuccessMakeModels(PermissionRequiredMixin, UpdateView):
    permission_required = "inventory.add_item"
    model = Item
    form_class = ItemForm
    template_name = "inventory/category_ajax_items.html"

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        context_data['success'] = 'success'
        return context_data

# vim: ai ts=4 sts=4 et sw=4
