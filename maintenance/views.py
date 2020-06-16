from django.db import transaction
from .models import(Action,Job,)
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

class ActionList(ListView):
    model=Action

class ActionCreate(CreateView):
    model=Action

class ActionDetail(DetailView):
    model=Action

class ActionUpdate(UpdateView):
    model=Action

class ActionDelete(DeleteView):
    model=Action

class JobList(ListView):
    model=Job


class JobCreate(CreateView):
    model=Job

class JobDetail(DetailView):
    model=Job

class JobUpdate(UpdateView):
    model=Job

class JobDelete(DeleteView):
    model=Job

