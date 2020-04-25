from .models import (Category, Item, ItemHistory, Location, MakeModel, Role, UserParameters,)
from datetime import date, timedelta
from django import forms
from django.forms import ModelForm, inlineformset_factory
from django.contrib.contenttypes.forms import generic_inlineformset_factory
from django.urls import reverse_lazy
from addable.forms import Addable, AddableMultiple
from varifields.models import (VariFieldSpec, VariFieldValue,)
from varifields.forms import (VariFieldValueForm)

class ItemCreateForm(ModelForm):
    
    class Meta:
        model=Item
        fields = [
            'familiar_name',
            'makemodel',
            'roles',
        ]
        widgets = {
            'makemodel': Addable(attrs={'data-add_url':reverse_lazy('item-ajax-makemodel'), 'data-iframe':'iframe_makemodel', 'data-primaries':'id_makemodel', 'data-secondaries':''}),
            'roles': AddableMultiple(attrs={'data-add_url':reverse_lazy('item-ajax-roles'), 'data-iframe':'iframe_roles', 'data-primaries':'id_roles', 'data-secondaries':''}),
        }

class ItemForm(ModelForm):

    class Meta:
        model=Item
        fields = [
            'familiar_name',
            'makemodel',
            'roles',
            'hostname',
            'serial_number',
            'asset_number',
            'barcode',
            'home',
            'location',
            'condition',
            'inventory',
            'keeper',
            'borrower',
            'lessor',
            'notes',
        ]
        widgets = {
            'makemodel': Addable(attrs={'data-add_url':reverse_lazy('item-ajax-makemodel'), 'data-iframe':'iframe_makemodel', 'data-primaries':'id_makemodel', 'data-secondaries':''}),
            'roles': AddableMultiple(attrs={'data-add_url':reverse_lazy('item-ajax-roles'), 'data-iframe':'iframe_roles', 'data-primaries':'id_roles', 'data-secondaries':''}),
            'location': Addable(attrs={'data-add_url':reverse_lazy('item-ajax-location'), 'data-iframe':'iframe_location', 'data-primaries':'id_location', 'data-secondaries':'id_home'}),
            'home': Addable(attrs={'data-add_url':reverse_lazy('item-ajax-location'), 'data-iframe':'iframe_home', 'data-primaries':'id_home', 'data-secondaries':'id_location'}),
            'keeper': Addable(attrs={'data-add_url':reverse_lazy('item-ajax-entity'), 'data-iframe':'iframe_keeper', 'data-primaries':'id_keeper', 'data-secondaries':'id_lessor, id_borrower'}),
            'borrower': Addable(attrs={'data-add_url':reverse_lazy('item-ajax-entity'), 'data-iframe':'iframe_borrower', 'data-primaries':'id_borrower', 'data-secondaries':'id_lessor, id_keeper'}),
            'lessor': Addable(attrs={'data-add_url':reverse_lazy('item-ajax-entity'), 'data-iframe':'iframe_lessor', 'data-primaries':'id_lessor', 'data-secondaries':'id_borrower, id_keeper'}),
        }


class MakeModelForm(ModelForm):
    class Meta:
        model = MakeModel
        fields = [
            'brand',
            'name',
            'part_number',
            'description',
            'categories',
        ]

class RoleForm(ModelForm):
    class Meta:
        model = Role
        fields = [
            'name',
            'description'
        ]

class LocationForm(ModelForm):
    class Meta:
        model = Location
        fields = [
            'name',
            'abbreviation',
            'priority',
        ]

VariFieldValueFormset=generic_inlineformset_factory(VariFieldValue, form=VariFieldValueForm, extra=0)

# vim ai et ts=4 sts=4 sw=4
