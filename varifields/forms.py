from .models import (VariFieldSpecChoice, VariFieldObject,  VariFieldValue, VariFieldSpec)
from addable.forms import Addable, AddableMultiple
from datetime import date, timedelta
from django import forms
from django.forms import ModelForm, inlineformset_factory
from django.urls import reverse_lazy
from varifields.forms import (VariFieldSpec, VariFieldValue,)
from django.contrib.contenttypes.models import ContentType

class VariFieldValueForm(ModelForm):

    class Meta:
        model = VariFieldValue
        fields=[
            'spec',
            'content',
        ]

    def get_spec_name(self):
        try:
            return VariFieldSpec.objects.get(id=self.initial['spec']).name
        except:
            return None

class VariFieldSpecAdminForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if 'content_type' in self.initial:
            contenttype_class = ContentType.objects.get(pk=self.initial['content_type']).model_class()
            self.fields['vari_field_objects']=forms.models.ModelMultipleChoiceField(contenttype_class.objects, required=False)
            self.fields['vari_field_objects'].queryset=contenttype_class.objects  #k418
            converted_objects=[]
            for initial_object in self.initial['vari_field_objects']:
                converted_objects.append(contenttype_class.objects.get(pk=initial_object.object_id))
            self.initial['vari_field_objects']=converted_objects
            self.fields['content_type'].disabled=True
        else:
            vari_field_spec_choices = VariFieldSpecChoice.objects.all()
            if vari_field_spec_choices.exists():
                allowed_choices = vari_field_spec_choices.values_list('content_type')
                self.fields['content_type'].queryset=ContentType.objects.filter(pk__in=allowed_choices)
            else:
                self.fields['content_type'].queryset=ContentType.objects

            self.fields['vari_field_objects'].disabled=True
            self.fields['vari_field_objects'].help_text='Objects become available after an object type is selected and the form is saved'


    def clean_vari_field_objects(self):
        contenttype_class = ContentType.objects.get(pk=self.cleaned_data['content_type'].id).model_class()
        object_ids=self.cleaned_data['vari_field_objects']
        reconverted_objects=[]
        for object_id in object_ids:
            target=contenttype_class.objects.get(id=object_id.id)
            vari_field_object, created = VariFieldObject.objects.get_or_create(object_id=target.id)
            reconverted_objects.append(vari_field_object.id)

        return reconverted_objects

    class Meta:
        model=VariFieldSpec
        fields = [
            'content_type',
            'name',
            'choices',
            'on_list',
            'on_filter',
            'vari_field_objects',
            'spec_help_text',
        ]


