from .models import (Category, Item, ItemHistory, ItemQuery, ItemXRole, Location, MakeModel, MakeModelXCategory, Role, UserParameters)
import inspect
from datetime import date, timedelta
from django import forms
from django.forms import ModelForm, inlineformset_factory
from django.contrib.contenttypes.forms import generic_inlineformset_factory
from django.urls import reverse_lazy
from addable.forms import Addable, AddableMultiple
from entities.models import Entity

class ItemQueryForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for visible in self.visible_fields():
            if visible.name[-4:] == '_use':
                if 'class' in visible.field.widget.attrs:
                    visible.field.widget.attrs['class'] = visible.field.widget.attrs['class'] + ' filter_use'
                else:
                    visible.field.widget.attrs['class'] = 'filter_use'
            if visible.name[-6:] == '_value':
                if 'class' in visible.field.widget.attrs:
                    visible.field.widget.attrs['class'] = visible.field.widget.attrs['class'] + ' filter_value'
                else:
                    visible.field.widget.attrs['class'] = 'filter_value'


    do_save = forms.BooleanField(label='save query', required=False)

    class Meta:

        model=ItemQuery
        fields=[
            'user',
            'query_name',

            'familiar_name_value',
            'familiar_name_use',
            'familiar_name_operator',

            'serial_number_value',
            'serial_number_use',
            'serial_number_operator',

            'makemodel_value',
            'makemodel_use',
            'makemodel_operator',

            'makemodel_category_value',
            'makemodel_category_use',
            'makemodel_category_operator',

            'makemodel_brand_value',
            'makemodel_brand_use',
            'makemodel_brand_operator',

            'asset_number_value',
            'asset_number_use',
            'asset_number_operator',

            'barcode_value',
            'barcode_use',
            'barcode_operator',

            'hostname_value',
            'hostname_use',
            'hostname_operator',

            'roles_value',
            'roles_use',
            'roles_operator',

            'home_value',
            'home_use',
            'home_operator',

            'location_value',
            'location_use',
            'location_operator',

            'condition_value',
            'condition_use',
            'condition_operator',

            'inventory_value',
            'inventory_use',
            'inventory_operator',

            'keeper_value',
            'keeper_use',
            'keeper_operator',

            'borrower_value',
            'borrower_use',
            'borrower_operator',

            'lessor_value',
            'lessor_use',
            'lessor_operator',

            'notes_value',
            'notes_use',
            'notes_operator',

            'inventoried_1_value',
            'inventoried_1_use',
            'inventoried_1_operator',

            'inventoried_2_value',
            'inventoried_2_use',
            'inventoried_2_operator',

            'orderby1',
            'orderby2',
            'orderby3',

            'paginate_by',
        ]

class RecallItemQueryForm(forms.Form):

    def __init__(self, *args, **kwargs):
        user=None
        if('user' in kwargs):
            user = kwargs.pop('user')

        super().__init__(*args, **kwargs)

        if user is not None:
            item_query_choices=[('', '--------')]
            item_query_queryset = ItemQuery.objects.filter(user=user, query_name__gt='')
            for item_query in item_query_queryset:
                item_query_choices.append((item_query.pk, item_query.query_name))
            self.fields['recall_item_query'].choices=item_query_choices

    recall_item_query = forms.ChoiceField(label='Recall Query', choices=[])
    delete_item_query = forms.BooleanField(label='Delete', required=False)

class ItemForm(ModelForm):
    duplicate = forms.BooleanField(label="Save and Duplicate", initial=False, required=False)
    class Meta:
        model=Item
        fields = [
            'familiar_name',
            'makemodel',
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
            'inventoried',
        ]
        widgets = {
            'makemodel': Addable(attrs={'data-add_url':reverse_lazy('item_ajax_makemodel'), 'data-iframe':'iframe_makemodel', 'data-primaries':'id_makemodel', 'data-secondaries':''}),
            'location': Addable(attrs={'data-add_url':reverse_lazy('item_ajax_location'), 'data-iframe':'iframe_location', 'data-primaries':'id_location', 'data-secondaries':'id_home'}),
            'home': Addable(attrs={'data-add_url':reverse_lazy('item_ajax_location'), 'data-iframe':'iframe_home', 'data-primaries':'id_home', 'data-secondaries':'id_location'}),
        }


class MakeModelForm(ModelForm):
    duplicate = forms.BooleanField(label="Save and Duplicate", initial=False, required=False)
    class Meta:
        model = MakeModel
        fields = [
            'brand',
            'name',
            'part_number',
            'description',
        ]

class RoleForm(ModelForm):
    class Meta:
        model = Role
        fields = [
            'name',
            'description'
        ]

class CategoryForm(ModelForm):
    class Meta:
        model = Category
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

class Item_ItemXRoleForm(ModelForm):
    class Meta:
        model = ItemXRole
        fields = [
            'role',
        ]
        widgets = {
            'role': Addable(attrs={'data-add_url':reverse_lazy('item_ajax_role'), 'data-secondaries':''}),
        }

class Role_ItemXRoleForm(ModelForm):
    class Meta:
        model = ItemXRole
        fields = [
            'item',
        ]
        widgets = {
            'item': forms.Select(attrs={'class':'role_ItemXRole'})
        }

class MakeModel_MakeModelXCategoryForm(ModelForm):
    class Meta:
        model = MakeModelXCategory
        fields = [
            'category',
        ]
        widgets = {
            'category': forms.Select(attrs={'class':'makemodel_MakeModelXCategory'})
        }

class Category_MakeModelXCategoryForm(ModelForm):
    class Meta:
        model = MakeModelXCategory
        fields = [
            'makemodel',
        ]
        widgets = {
            'makemodel': forms.Select(attrs={'class':'category_MakeModelXCategory'})
        }


Item_ItemXRoleFormset=inlineformset_factory(Item, ItemXRole, form=Item_ItemXRoleForm, extra=1)
Role_ItemXRoleFormset=inlineformset_factory(Role, ItemXRole, form=Role_ItemXRoleForm, extra=1)
MakeModel_MakeModelXCategoryFormset=inlineformset_factory(MakeModel, MakeModelXCategory, form=MakeModel_MakeModelXCategoryForm, extra=1)
Category_MakeModelXCategoryFormset=inlineformset_factory(Category, MakeModelXCategory, form=Category_MakeModelXCategoryForm, extra=5)


# vim ai et ts=4 sts=4 sw=4
