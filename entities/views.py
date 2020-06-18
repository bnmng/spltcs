from .forms import (  EntityForm, Entity_VoicePhoneFormset, Entity_SMSPhoneFormset, Entity_EmailFormset, RollForm, Entity_EntityXRollFormset, Roll_EntityXRollFormset)
from .models import( Entity, VoicePhone, SMSPhone, Email, Roll )
from datetime import date, timedelta
from django.contrib.auth import (get_user, get_user_model,)
from django.contrib.auth.mixins import PermissionRequiredMixin
from django.db import transaction
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

class EntityList(PermissionRequiredMixin, ListView):
    permission_required = "entities.view_entity"
    model = Entity

class EntityCreate(PermissionRequiredMixin, CreateView):
    permission_required = 'entities.add_entity'
    model = Entity
    form_class=EntityForm
    template_name='entities/entity_create_form.html'

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            entityxrolls = Entity_EntityXRollFormset(self.request.POST)
        else:
            entityxrolls = Entity_EntityXRollFormset()

        context_data['entityxrolls']=entityxrolls

        return context_data

    def form_valid(self, form):
        response = super().form_valid(form)
        self.object = form.save()

        entityxrolls=Roll_EntityXRollFormset(self.request.POST)
        if entityxrolls.is_valid():
            entityxrolls.instance = self.object
            entityxrolls.save()

        return response

    def get_success_url(self):
        print(inspect.currentframe().f_lineno)
        print("pk=")
        print(self.object.pk)
        return reverse_lazy('entity_update', kwargs={'pk': self.object.id})

class EntityDetail(PermissionRequiredMixin, DetailView):
    permission_required = 'entities.view_entity'
    model = Entity

class EntityUpdate(PermissionRequiredMixin, UpdateView):
    permission_required = 'entities.change_entity'
    model = Entity
    form_class = EntityForm
    template_name='entities/entity_update_form.html'

    def get_context_data(self, **kwargs):

        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            entityxrolls = Entity_EntityXRollFormset(self.request.POST, instance=self.object)
        else:
            entityxrolls = Entity_EntityXRollFormset(instance=self.object)

        print(inspect.currentframe().f_lineno)
        print(entityxrolls)
        print(inspect.currentframe().f_lineno)
        print(entityxrolls.empty_form)

        context_data['entityxrolls']=entityxrolls

        return context_data

    def form_valid(self, form):

        response = super().form_valid(form)
        
        self.object = form.save()
        entityxrolls=Entity_EntityXRollFormset(self.request.POST, instance=self.object)

        if entityxrolls.is_valid():
            entityxrolls.instance = self.object
            entityxrolls.save()
        else:
            print (inspect.currentframe().f_lineno)
            print ( entityxrolls.errors) 

        return response

    def get_success_url(self):
        return reverse_lazy('entity_detail', kwargs={'pk': self.object.id})

class EntityDelete(PermissionRequiredMixin, DeleteView):
    permission_required = 'entities.delete_entity'
    model = Entity
    template_name = 'entities/entity_delete_confirm.html'
    def get_success_url(self):
        return reverse_lazy('entity_list')

class EntityAjaxRoll(PermissionRequiredMixin, CreateView):
    permission_required = "entities.add_roll"
    model = Roll
    form_class = RollForm
    template_name = "entities/entity_ajax_roll.html"

    def get_success_url(self):
        return reverse_lazy("entity_ajaxsuccess_roll", kwargs={'pk': self.object.id})

class EntityAjaxSuccessRoll(PermissionRequiredMixin, UpdateView):
    permission_required = "entities.add_roll"
    model = Roll
    form_class = RollForm
    template_name = "entities/entity_ajax_roll.html"

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        context_data['success'] = 'success'
        return context_data

class RollList(PermissionRequiredMixin, ListView):
    permission_required = "entities.view_roll"
    model = Roll

class RollCreate(PermissionRequiredMixin, CreateView):
    permission_required = 'entities.add_roll'
    model = Roll
    form_class=RollForm
    template_name='entities/roll_create_form.html'

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            entityxrolls = Roll_EntityXRollFormset(self.request.POST)
        else:
            entityxrolls = Roll_EntityXRollFormset()

        context_data['entityxrolls']=entityxrolls

        return context_data

    def form_valid(self, form):
        response = super().form_valid(form)
        
        self.object = form.save()
        entityxrolls=Roll_EntityXRollFormset(self.request.POST)
        if entityxrolls.is_valid():
            entityxrolls.instance = self.object
            entityxrolls.save()
        
        return response

    def get_success_url(self):
        return reverse_lazy('roll_update', kwargs={'pk': self.object.id})

class RollDetail(PermissionRequiredMixin, DetailView):
    permission_required = 'entities.view_roll'
    model = Roll

class RollUpdate(PermissionRequiredMixin, UpdateView):
    permission_required = 'entities.change_roll'
    model = Roll
    form_class = RollForm
    template_name='entities/roll_update_form.html'

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            entityxrolls = Roll_EntityXRollFormset(self.request.POST, instance=self.object)
        else:
            entityxrolls = Roll_EntityXRollFormset(instance=self.object)

        context_data['entityxrolls']=entityxrolls

        return context_data

    def form_valid(self, form):
        response = super().form_valid(form)
        
        self.object = form.save()
        entityxrolls=Roll_EntityXRollFormset(self.request.POST, instance=self.object)
        if entityxrolls.is_valid():
            entityxrolls.instance = self.object
            entityxrolls.save()
        else:
            print (inspect.currentframe().f_lineno)
            print ( entityxrolls.errors) 

        return response

    def get_success_url(self):
        return reverse_lazy('roll_detail', kwargs={'pk': self.object.id})

class RollDelete(PermissionRequiredMixin, DeleteView):
    permission_required = 'entities.delete_roll'
    model = Roll
    template_name = 'entities/roll_delete_confirm.html'
    def get_success_url(self):
        return reverse_lazy('roll_list')

class RollAjaxEntity(PermissionRequiredMixin, CreateView):
    permission_required = "entities.add_entity"
    model = Entity
    form_class = EntityForm
    template_name = "entities/roll_ajax_entities.html"

    def get_success_url(self):
        return reverse_lazy("roll_ajaxsuccess_entities", kwargs={'pk': self.object.id})

class RollAjaxSuccessEntity(PermissionRequiredMixin, UpdateView):
    permission_required = "entities.add_entity"
    model = Entity
    form_class = EntityForm
    template_name = "entities/roll_ajax_entities.html"

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        context_data['success'] = 'success'
        return context_data


# vim: ai ts=4 sts=4 et sw=4
