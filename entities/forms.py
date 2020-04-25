from .models import Entity
from addable.forms import Addable, AddableMultiple
from django import forms
from django.forms import ModelForm

class EntityForm(ModelForm):

    class Meta:
        model = Entity
        fields = [
            'name',
            'part_of',
            'user'
        ]
