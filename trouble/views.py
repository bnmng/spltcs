from .forms import TicketForm, RecallTicketQueryForm, TicketQueryForm, Ticket_TicketResponseFormset
from .models import Ticket, TicketResponse, TicketQuery
from datetime import date, timedelta
from django.contrib.auth import (get_user, get_user_model,)
from django.contrib.auth.mixins import PermissionRequiredMixin
from django.contrib.contenttypes.models import ContentType
from django.core import serializers
from django.core.mail import send_mail
from django.db import transaction
from django.db.models.query import QuerySet
from django.shortcuts import render
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic import ListView
from django.views.generic.detail import ( DetailView, )
from django.views.generic.edit import (CreateView, DeleteView, UpdateView,)
from django.views.generic.list import ListView
from trouble.models import Ticket
import copy
import inspect
import json
import sys

class TicketList(PermissionRequiredMixin, ListView):
    permission_required = "trouble.view_ticket"
    model = Ticket

    def get_queryset(self, **kwargs):
        queryset = super().get_queryset(**kwargs)

        have_query=False
        filter_parameters={}
        exclude_parameters={}
        raw_filter_parameters={}
        if self.request.GET:
            if 'recall_ticket_query' in self.request.GET:
                recall_ticket_query_form=RecallTicketQueryForm(self.request.GET, user=self.request.user)
                if recall_ticket_query_form.is_valid():
                    ticket_query = TicketQuery.objects.get(pk=int(recall_ticket_query_form.cleaned_data['recall_ticket_query']))
                    for field in ticket_query._meta.get_fields():
                        if 'ManyRelatedManager' == getattr(ticket_query, field.name).__class__.__name__:
                            raw_filter_parameters[field.name]=[]
                            for obj in getattr(ticket_query, field.name).all():
                                raw_filter_parameters[field.name].append(obj)
                        else:
                            raw_filter_parameters[field.name]=getattr(ticket_query, field.name)
                    if 'delete_ticket_query' in self.request.GET:
                        ticket_query.delete()
                    else:
                        # to update the time stamp
                        ticket_query.save()
                    have_query=True
                else:
                    print(inspect.currentframe().f_lineno)
                    print("Form Error")
                    print(recall_load_query_form.errors)
                    
            else:
                ticket_query_form = TicketQueryForm(self.request.GET)
                if ticket_query_form.is_valid():
                    ticket_query=ticket_query_form.save(commit=False)
                    ticket_query.user = self.request.user
                    raw_filter_parameters=ticket_query_form.cleaned_data
                    do_save=False
                    if 'do_save' in raw_filter_parameters:
                        do_save = raw_filter_parameters.pop('do_save')
                    if not do_save:
                        #even if not do_save, the query will be saved but without a name
                        ticket_query.query_name=''

                    ticket_query_queryset = TicketQuery.objects.filter(user=self.request.user, query_name=ticket_query.query_name)

                    if ticket_query_queryset.exists():
                        #if it exists, set the id so the save function updates the query
                        ticket_query.id = ticket_query_queryset[0].id

                    ticket_query_form.save()
                    have_query=True
                else:
                    print(inspect.currentframe().f_lineno)
                    print("Form Error")
                    print(ticket_query_form.errors)


        if not have_query:
            ticket_query_queryset = TicketQuery.objects.all() 
            if ticket_query_queryset.exists():
                ticket_query = ticket_query_queryset[0]
                for field in ticket_query._meta.get_fields():
                    raw_filter_parameters[field.name]=getattr(ticket_query, field.name)

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
                    if raw_filter_parameters[orderby] in TicketQuery.ORDERBY_CHOICES:
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
            ticket_query = TicketQuery.objects.all()[0]

        except Exception as e:

            print(inspect.currentframe().f_lineno)
            print("Exception")
            print(e)
            for i in sys.exc_info():
                print (i)

            ticket_query = TicketQuery.objects.create(user=self.request.user, query_name='')

        context_data['ticket_query_form'] = TicketQueryForm(instance=ticket_query)

        context_data['recall_ticket_query_form'] = RecallTicketQueryForm(initial={'recall_ticket_query':ticket_query}, user=self.request.user)


        return context_data

class TicketCreate(PermissionRequiredMixin, CreateView):
    permission_required = 'trouble.add_ticket'
    model = Ticket
    form_class=TicketForm
    template_name='trouble/ticket_create_form.html'

    def get_context_data(self, **kwargs):
        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            ticketresponses = Ticket_TicketResponseFormset(self.request.POST)
        else:
            ticketresponses = Ticket_TicketResponseFormset()

        context_data['ticketresponses']=ticketresponses

        return context_data

    def form_valid(self, form):
        response = super().form_valid(form)

        ticketresponses=Ticket_TicketResponseFormset(self.request.POST)
        if ticketresponses.is_valid():
            print(inspect.currentframe().f_lineno)
            ticketresponses.instance = self.object
            ticketresponses.save()
        else:
            print(inspect.currentframe().f_lineno)
            print("Form Error")
            print(ticketresponses.errors)

        return response

    def get_success_url(self):
        return reverse_lazy('ticket_detail', kwargs={'pk': self.object.id})

class TicketDetail(PermissionRequiredMixin, DetailView):
    permission_required = 'trouble.view_ticket'
    model = Ticket

class TicketUpdate(PermissionRequiredMixin, UpdateView):
    permission_required = 'trouble.change_ticket'
    model = Ticket
    form_class = TicketForm
    template_name='trouble/ticket_update_form.html'

    def get_context_data(self, **kwargs):

        context_data = super().get_context_data(**kwargs)
        if self.request.POST:
            ticketresponses = Ticket_TicketResponseFormset(self.request.POST, instance=self.object)
        else:
            ticketresponses = Ticket_TicketResponseFormset(instance=self.object)

        context_data['ticketresponses']=ticketresponses

        return context_data

    def form_valid(self, form):

        response = super().form_valid(form)
        
        self.object = form.save()
        ticketresponses=Ticket_TicketResponsesFormset(self.request.POST, instance=self.object)

        if ticketresponses.is_valid():
            ticketreponses.instance = self.object
            ticketresponses.save()
        else:
            print(inspect.currentframe().f_lineno)
            print("Form Error")
            print(ticketresponses.errors)

        return response

    def get_success_url(self):
        return reverse_lazy('ticket_detail', kwargs={'pk': self.object.id})

class TicketDelete(PermissionRequiredMixin, DeleteView):
    permission_required = 'trouble.delete_ticket'
    model = Ticket
    template_name = 'trouble/ticket_delete_confirm.html'
    def get_success_url(self):
        return reverse_lazy('ticket_list')


# vim: ai ts=4 sts=4 et sw=4
    
