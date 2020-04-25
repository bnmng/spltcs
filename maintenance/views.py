from django.db import transaction
from .forms import ()
from .models import(Category, Item, ItemHistory, Location, MakeModel, Role, UserParameters,)
from varifields.models import(VariFieldObject, VariFieldSpec, VariFieldValue)
from datetime import date, timedelta
from django.contrib.auth.mixins import PermissionRequiredMixin
from django.core.mail import send_mail
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic.detail import ( DetailView, )
from django.views.generic.edit import (CreateView, DeleteView, UpdateView,)
from django.views.generic.list import ListView
from entities.forms import EntityForm
from entities.models import Entity
import copy
import json
import sys

class ItemList(PermissionRequiredMixin, ListView):
    permission_required = "inventory.view_item"
    model = Item

    filter_parameter_specs = {
        'familiar_name_': {
            'label': "Familiar Name",
            'operators': {
                'familiar_name__icontains': {'label': 'contains',},
            },
        },
        'serial_number_': {
            'label': "Serial Number",
            'operators': {
                'serial_number__icontains': {'label': 'contains',},
            },
        },
        'makemodel_': {
            'label': 'MakeModel',
            'operators': {
                'makemodel__in': {'label': 'is',},
            },
            'input': {
                'type': 'select',
                'multiple': 'multiple',
                'option_type': 'model',
                'options': MakeModel.objects.all(),
            },
        },
        'asset_number_': {
            'label': "Asset Number",
            'operators': {
                'asset_number__iexact': {'label': 'Equals',},
            },
        },
        'barcode_': {
            'label': "Barcode",
            'operators': {
                'barcode__iexact': {'label': 'Equals',},
            },
        },
        'hostname_': {
            'label': "Host Name",
            'operators': {
                'hostname__iexact': {'label': 'Equals',},
                'hostname__icontains': {'label': 'Contains',},
            },
        },
        'roles_': {
            'label': 'Roles',
            'operators': {
                'roles__in': {'label': 'are',},
            },
            'input': {
                'type': 'select',
                'multiple': 'multiple',
                'option_type': 'model',
                'options': Role.objects.all(),
            },
        },
        'home_': {
            'label': 'Home',
            'operators': {
                'home__in': {'label': 'is',},
            },
            'input': {
                'type': 'select',
                'option_type': 'model',
                'options': Location.objects.all(),
            },
        },
        'location_': {
            'label': 'Location',
            'operators': {
                'location__in': {'label': 'is',},
            },
            'input': {
                'type': 'select',
                'option_type': 'model',
                'options': Location.objects.all(),
            },
        },
        'condition_': {
            'label': 'Conditions',
            'operators': {
                'condition__in': {'label': 'is',},
            },
            'input': {
                'type': 'select',
                'multiple': 'multiple',
                'option_type': 'choices',
                'options': Item.CONDITION_CHOICES,
            },
        },
        'inventory_': {
            'label': 'Inventory Status',
            'operators': {
                'inventory__in': {'label': 'is',},
            },
            'input': {
                'type': 'select',
                'multiple': 'multiple',
                'option_type': 'choices',
                'options': Item.INVENTORY_CHOICES,
            },
        },
        'keeper_': {
            'label': 'Keeper',
            'operators': {
                'keeper_in': {'label': 'is', },
            },
            'input': {
                'multiple': 'multiple',
                'option_type': 'model',
                'options': Entity.objects.all(),
            }
        },
        'lessor_': {
            'label': 'Lessor',
            'operators': {
                'lessor_in': {'label': 'is', },
            },
            'input': {
                'multiple': 'multiple',
                'option_type': 'model',
                'options': Entity.objects.all(),
            }
        },
    }

    orderby_parameter_specs = {
        'notification_group': {'label': "Notification Group",},
        'mod_date': {'label': "Mod Date",},
        'ponumber': {'label': "PO Number",},
    }

    def get_queryset(self, **kwargs):
        queryset = super().get_queryset(**kwargs)
        user_parameters, created = UserParameters.objects.get_or_create(user=self.request.user, key='previous_query')
        user_parameters.save()
        constructed_query_data = {}
        if self.request.GET:

            # convert the GET querydict into a regular dictionary

            get_list = self.request.GET.lists()
            get_dict = {}
            for key in get_list:
                get_dict[key[0]] = key[1]

            for filterkey in self.filter_parameter_specs:
                if "filter[" + filterkey + "][use]" in get_dict:
                    if 'on' == get_dict["filter[" + filterkey + "][use]"][0]:
                        if not 'filter' in constructed_query_data:
                            constructed_query_data['filter'] = {}
                        if not filterkey in constructed_query_data['filter']:
                            constructed_query_data['filter'][filterkey] = {}
                        constructed_query_data['filter'][filterkey]['use'] = 'on'
                if "filter[" + filterkey + "][value]" in get_dict:
                    if not 'filter' in constructed_query_data:
                        constructed_query_data['filter'] = {}
                    if not filterkey in constructed_query_data['filter']:
                        constructed_query_data['filter'][filterkey] = {}
                    as_multi = False
                    if 'input' in self.filter_parameter_specs[filterkey]:
                        if ('multiple' in self.filter_parameter_specs[filterkey]['input']):
                            if ('multiple' == self.filter_parameter_specs[filterkey]['input']['multiple']):
                                constructed_query_data['filter'][filterkey]['value'] = get_dict["filter[" + filterkey + "][value]"]
                                as_multi = True
                    if not as_multi:
                        constructed_query_data['filter'][filterkey]['value'] = get_dict["filter[" + filterkey + "][value]"][0]
                if "filter[" + filterkey + "][operators]" in get_dict:
                    for optkey in self.filter_parameter_specs[filterkey]['operators']:
                        if (optkey == get_dict["filter[" + filterkey + "][operators]"][0]):
                            if not 'filter' in constructed_query_data:
                                constructed_query_data['filter'] = {}
                            if not filterkey in constructed_query_data['filter']:
                                constructed_query_data['filter'][filterkey] = {}
                            if (not 'operators' in constructed_query_data['filter'][filterkey]):
                                constructed_query_data['filter'][filterkey]['operators'] = {}
                            if (not optkey in constructed_query_data['filter'][filterkey]['operators']):
                                constructed_query_data['filter'][filterkey]['operators'][optkey] = {}
                            constructed_query_data['filter'][filterkey]['operators'][optkey]['use'] = 'on'


            for r in range(1, 4):
                if "orderby[" + str(r) + "]" in get_dict:
                    if not 'orderby' in constructed_query_data:
                        constructed_query_data['orderby'] = []
                    constructed_query_data['orderby'].append(
                        get_dict["orderby[" + str(r) + "]"][0]
                    )

            # save the query in the UserParameters object
            constructed_query_json = json.dumps(constructed_query_data)
            user_parameters.value = constructed_query_json
            user_parameters.save()


        else:  # if no GET, look for the recent query from the UserParameters
            try:
                constructed_query_data = json.inventory(user_parameters.value)
            except:
                constructed_query_data = {}

        try:  # filter the record
            if 'filter' in constructed_query_data:
                for filterkey in self.filter_parameter_specs:
                    if filterkey in constructed_query_data['filter']:
                        if 'use' in constructed_query_data['filter'][filterkey]:
                            if ('on' == constructed_query_data['filter'][filterkey]['use']):
                                for optkey in self.filter_parameter_specs[filterkey]['operators']:
                                    if (optkey in constructed_query_data['filter'][filterkey]['operators']):
                                        if ('use' in constructed_query_data['filter'][filterkey]['operators'][optkey]):
                                            if ('on' == constructed_query_data['filter'][filterkey]['operators'][optkey]['use']):
                                                if ('value' in constructed_query_data['filter'][filterkey]):
                                                    try:
                                                        queryset = queryset.filter(**{optkey: constructed_query_data['filter'][filterkey]['value']})
                                                    except ValueError:
                                                        print("ValueError in query construction")
                                                        print(sys.exc_info()[0])
                                                        print(sys.exc_info()[1])
                                                        print(sys.exc_info()[2].tb_lineno)
                                                        try:
                                                            constructed_query_data['filter'][filterkey]['operators'][optkey]['use'] = ''
                                                        except:
                                                            print('Error turning off ' + optkey )
                                                            print(sys.exc_info()[0])
                                                            print(sys.exc_info()[1])
                                                            print(sys.exc_info()[2].tb_lineno)

                                                    # todo: refactor this so it filters in one step

#            if 'orderby' in constructed_query_data:
#                queryset = queryset.order_by(*constructed_query_data['orderby'])
        except Exception as e:
            print('sys.exc_info()[0]:')
            print(sys.exc_info()[0])
            print('sys.exc_info()[1]:')
            print(sys.exc_info()[1])
            print('sys.exc_info()[2].tb_lineno:')
            print(sys.exc_info()[2].tb_lineno)
            user_search_data = {}

        print(queryset)

        return queryset

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data()

        user_parameters, created = UserParameters.objects.get_or_create(user=self.request.user, key='previous_query')
        try:
            user_query_data = json.inventory(user_parameters.value)
        except:
            user_query_data = {}

        context_data['filter_parameters'] = copy.deepcopy(self.filter_parameter_specs)
        if 'filter' in user_query_data:
            for filterkey in self.filter_parameter_specs:
                try:
                    if filterkey in user_query_data['filter']:
                        if 'use' in user_query_data['filter'][filterkey]:
                            if 'on' == user_query_data['filter'][filterkey]['use']:
                                context_data['filter_parameters'][filterkey]['use'] = 'on'
                        if 'value' in user_query_data['filter'][filterkey]:
                            input_handled = False
                            if 'input' in self.filter_parameter_specs[filterkey]:
                                if ('option_type' in self.filter_parameter_specs[filterkey]['input']):
                                    if ('model' == self.filter_parameter_specs[filterkey]['input']['option_type']):
                                        multiple=''
                                        if ('multiple' in self.filter_parameter_specs[filterkey]['input']):
                                            if ('multiple' == self.filter_parameter_specs[filterkey]['input']['multiple']):
                                                multiple='multiple'
                                        if( 'multiple' == multiple ):
                                            values=[]
                                            for option in user_query_data['filter'][filterkey]['value']:
                                                if(option.isdigit()):
                                                    values.append(int(option))
                                            context_data['filter_parameters'][filterkey]['value']=values
                                            input_handled = True
                                        else:
                                            if(user_query_data['filter'][filterkey]['value'].isdigit()):
                                                context_data['filter_parameters'][filterkey]['value'] = user_query_data['filter'][filterkey]['value']
                                                input_handled = True

                            if not input_handled:
                                context_data['filter_parameters'][filterkey]['value'] = user_query_data['filter'][filterkey]['value']
                        if 'operators' in user_query_data['filter'][filterkey]:
                            for optkey in user_query_data['filter'][filterkey]['operators']:
                                if ('use' in user_query_data['filter'][filterkey]['operators'][optkey]):
                                    if ('on' == user_query_data['filter'][filterkey]['operators'][optkey]['use']):
                                        context_data['filter_parameters'][filterkey]['operators'][optkey]['use'] = 'on'

                                        if 'use' in user_query_data['filter'][filterkey]:
                                            if 'on' == user_query_data['filter'][filterkey]['use']:
                                                if 'filter_display' in context_data:
                                                    context_data['filter_display'] = context_data['filter_display'] + ' AND '
                                                else:
                                                    context_data['filter_display'] = ''
                                                context_data['filter_display'] = context_data['filter_display'] + self.filter_parameter_specs[filterkey]['label']
                                                context_data['filter_display'] = context_data['filter_display'] + ' ' +  self.filter_parameter_specs[filterkey]['operators'][optkey]['label'] 
                                                input_handled = False
                                                if 'input' in self.filter_parameter_specs[filterkey]:
                                                    if ('option_type' in self.filter_parameter_specs[filterkey]['input']):
                                                        if('model' == self.filter_parameter_specs[filterkey]['input']['option_type']):
                                                            multiple=''
                                                            if('multiple' in self.filter_parameter_specs[filterkey]['input']):
                                                                if('multiple' == self.filter_parameter_specs[filterkey]['input']['multiple']):
                                                                    display_values=[]
                                                                    for value in user_query_data['filter'][filterkey]['value']:
                                                                        display_values.append( self.filter_parameter_specs[filterkey]['input']['options'].filter(pk=value).get().__str__())
                                                                    context_data['filter_display'] = context_data['filter_display'] + ' ' +  ', '.join(display_values)
                                                                    input_handled=True
                                                                else:
                                                                    diplay_values = display_values + self.filter_parameter_specs[filterkey]['input']['options'].filter(pk=user_query_data['filter'][filterkey]['value'])[0]
                                                                    input_handled=True
                                                if not input_handled:
                                                    context_data['filter_display'] = context_data['filter_display'] + ' ' + str(user_query_data['filter'][filterkey]['value'])
                                                

                except Exception as e:
                    print('sys.exc_info()[0]:')
                    print(sys.exc_info()[0])
                    print('sys.exc_info()[1]:')
                    print(sys.exc_info()[1])
                    print('sys.exc_info()[2].tb_lineno')
                    print(sys.exc_info()[2].tb_lineno)
                    context_data['filter_parameters'][filterkey]['use'] = ""

#        context_data['orderby_parameters'] = copy.deepcopy(self.orderby_parameter_specs)
#        if 'orderby' in user_query_data:
#            for orderbykey in self.orderby_parameter_specs:
#                for r in range(0, 3):
#                    if r < len(user_query_data['orderby']):
#                        if orderbykey == user_query_data['orderby'][r]:
#                            if not orderbykey in context_data['orderby_parameters']:
#                                context_data['orderby_parameters'][orderbykey] = {}
#                            context_data['orderby_parameters'][orderbykey]['use'] = (r + 1)


        return context_data

class ItemCreate(PermissionRequiredMixin, CreateView):
    permission_required = 'inventory.add_item'
    model = Item
    form_class=ItemCreateForm
    template_name='inventory/item_createform.html'

    def form_valid(self, form):
        response = super().form_valid(form)

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
        
        return response

    def get_success_url(self):
        return reverse_lazy('item-update', kwargs={'pk': self.object.id})

class ItemDetail(PermissionRequiredMixin, DetailView):
    permission_required = 'inventory.view_item'
    model = Item

class ItemUpdate(PermissionRequiredMixin, UpdateView):
    permission_required = 'inventory.change_item'
    model = Item
    form_class = ItemForm
    template_name='inventory/item_form.html'

    def get_context_data(self, **kwargs):
        data = super().get_context_data(**kwargs)
        item_type = ContentType.objects.get(app_label='inventory', model='item')
        roles = self.object.roles.all();
        role_type = ContentType.objects.get(app_label='inventory', model='role')
        categories = self.object.makemodel.categories.all();
        category_type = ContentType.objects.get(app_label='inventory', model='category')
        required_info_specs = VariFieldSpec.objects.filter(content_type=role_type, vari_field_objects__in=VariFieldObject.objects.filter(object_id__in=roles)) | VariFieldSpec.objects.filter(content_type=category_type, vari_field_objects__in=VariFieldObject.objects.filter(object_id__in=categories))
        print('required_info_specs')
        print(required_info_specs)
        for requirement in required_info_specs:
            obj, created = VariFieldValue.objects.get_or_create(object_id=self.object.pk, content_type=item_type, spec=requirement)

        data['vari_field_values'] = VariFieldValueFormset(instance=self.object)

        return data

    def form_valid(self, form):
        response = super().form_valid(form)

        vari_field_values = VariFieldValueFormset(self.request.POST, instance=self.object)
        with transaction.atomic():
            self.object = form.save()
            if vari_field_values.is_valid():
                print("vari_field_values.isvalid")
                vari_field_values.save()
                for vari_form in vari_field_values.forms:
                    for fieldname in vari_form.changed_data:
                        try:
                            item_his = ItemHistory.objects.create(item=self.object, description = '{} changed from {} to {}'.format(VariFieldValue._meta.get_field(fieldname).verbose_name, vari_form.initial[fieldname], vari_form.cleaned_data[fieldname]))
                        except:
                            print ("Error creating history in vari_form, fieldname=" + fieldname)
                            print(sys.exc_info()[0])
                            print(sys.exc_info()[1])
                            print(sys.exc_info()[2].tb_lineno)
            else:
                print("vari_field_values is not valid")
                for r in vari_field_values.forms:
                    print (r.cleaned_data)
                for e in vari_field_values.errors:
                    print(e)
                    for r in vari_field_values.forms:
                        for f in r.fields:
                            print( f)

        for fieldname in form.changed_data:
            try:
                item_his = ItemHistory.objects.create(item=self.object, description = '{} changed from {} to {}'.format(Item._meta.get_field(fieldname).verbose_name, form.initial[fieldname], form.cleaned_data[fieldname]))
            except:
                print ("Error creating history, fieldname=" + fieldname)
                print(sys.exc_info()[0])
                print(sys.exc_info()[1])
                print(sys.exc_info()[2].tb_lineno)

        return response

    def get_success_url(self):
        return reverse_lazy('item-detail', kwargs={'pk': self.object.id})

class ItemDelete(PermissionRequiredMixin, DeleteView):
    permission_required = 'inventory.delete_item'
    model = Item
    template_name = 'inventory/item_delete.html'
    def get_success_url(self):
        return reverse_lazy('inventory')


class ItemAjaxMakeModel(PermissionRequiredMixin, CreateView):
    permission_required = "inventory.add_makemodel"
    model = MakeModel
    form_class = MakeModelForm
    template_name = "inventory/item_ajax_makemodel.html"

    def get_success_url(self):
        return reverse_lazy("item-ajaxsuccess-makemodel", kwargs={'pk': self.object.id})

class ItemAjaxSuccessMakeModel(PermissionRequiredMixin, UpdateView):
    permission_required = "inventory.add_makemodel"
    model = MakeModel
    form_class = MakeModelForm
    template_name = "inventory/item_ajax_makemodel.html"

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        context_data['success'] = 'success'
        return context_data

class ItemAjaxRoles(PermissionRequiredMixin, CreateView):
    permission_required = "inventory.add_role"
    model = Role
    form_class = RoleForm
    template_name = "inventory/item_ajax_roles.html"

    def get_success_url(self):
        return reverse_lazy("item-ajaxsuccess-roles", kwargs={'pk': self.object.id})

class ItemAjaxSuccessRoles(PermissionRequiredMixin, UpdateView):
    permission_required = "inventory.add_role"
    model = Role
    form_class = RoleForm
    template_name = "inventory/item_ajax_roles.html"

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
        return reverse_lazy("item-ajaxsuccess-location", kwargs={'pk': self.object.id})

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
    permission_required = "inventory.add_entity"
    model = Entity
    form_class = EntityForm
    template_name = "inventory/item_ajax_entity.html"

    def get_success_url(self):
        return reverse_lazy("item-ajaxsuccess-entity", kwargs={'pk': self.object.id})

class ItemAjaxSuccessEntity(PermissionRequiredMixin, UpdateView):
    permission_required = "inventory.add_entity"
    model = Entity
    form_class = EntityForm
    template_name = "inventory/item_ajax_entity.html"

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        context_data['success'] = 'success'
        return context_data



# vim: ai ts=4 sts=4 et sw=4
