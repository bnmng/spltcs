from .models import (Entity, EntityXRoll, Roll, VoicePhone, SMSPhone, Email, Roll, EntityXRoll )
import inspect
from datetime import date, timedelta
from django import forms
from django.forms import ModelForm, inlineformset_factory
from django.contrib.contenttypes.forms import generic_inlineformset_factory
from django.urls import reverse_lazy
from addable.forms import Addable, AddableMultiple
from entities.models import Entity

class EntityForm(ModelForm):
    class Meta:
        model=Entity
        fields = [
            'entity_type',
            'full_name',
            'short_name',
            'sort_code',
            'member_of',
            'supervisor',
            'job_title',
            'user',
        ]

class Entity_VoicePhoneForm(ModelForm):
    class Meta:
        model = VoicePhone
        fields = [
            'name',
            'number',
            'is_primary',
            'extension',
        ]

class Entity_SMSPhoneForm(ModelForm):
    class Meta:
        model = SMSPhone
        fields = [
            'name',
            'number',
            'is_primary',
        ]

class Entity_EmailForm(ModelForm):
    class Meta:
        model = Email
        fields = [
            'name',
            'address',
            'is_primary',
        ]

class RollForm(ModelForm):
    class Meta:
        model = Roll
        fields = [
            'name',
            'sort_code',
        ]
class Entity_EntityXRollForm(ModelForm):
    class Meta:
        model = EntityXRoll
        fields = [
            'roll',
        ]
        widgets = {
            'roll': Addable(attrs={'data-add_url':reverse_lazy('entity_ajax_roll'), 'data-secondaries':''}),
        }

class Roll_EntityXRollForm(ModelForm):
    class Meta:
        model = EntityXRoll
        fields = [
            'entity',
        ]

Entity_VoicePhoneFormset=inlineformset_factory(Entity, VoicePhone, form=Entity_VoicePhoneForm, extra=1)
Entity_SMSPhoneFormset=inlineformset_factory(Entity, SMSPhone, form=Entity_SMSPhoneForm, extra=1)
Entity_EmailFormset=inlineformset_factory(Entity, Email, form=Entity_EmailForm, extra=1)
Entity_EntityXRollFormset=inlineformset_factory(Entity, EntityXRoll, form=Entity_EntityXRollForm, extra=1)
Roll_EntityXRollFormset=inlineformset_factory(Roll, EntityXRoll, form=Roll_EntityXRollForm, extra=1)
# vim ai et ts=4 sts=4 sw=4
