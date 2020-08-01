from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from .models import SPLTCSUser


class SPLTCSUserCreationForm(UserCreationForm):
    class Meta:
        model = SPLTCSUser
        fields = ("username", "email")


class SPLTCSUserChangeForm(UserChangeForm):
    class Meta:
        model = SPLTCSUser
        fields = ("username", "email")


# vim: ai ts=4 sts=4 et sw=4
