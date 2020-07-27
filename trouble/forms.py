from .models import ( Ticket, TicketResponse, TicketQuery, )
import inspect
from datetime import date, timedelta
from django import forms
from django.forms import ModelForm, inlineformset_factory
from django.contrib.contenttypes.forms import generic_inlineformset_factory
from django.urls import reverse_lazy
from addable.forms import Addable, AddableMultiple
from entities.models import Entity

class TicketQueryForm(ModelForm):
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

        model=TicketQuery
        fields=[
            'user',
            'query_name',

            'item_value',
            'item_use',
            'item_operator',

            'submitter_value',
            'submitter_use',
            'submitter_operator',

            'description_value',
            'description_use',
            'description_operator',

            'impact_value',
            'impact_use',
            'impact_operator',

            'orderby1',
            'orderby2',
            'orderby3',

            'paginate_by',
        ]

class RecallTicketQueryForm(forms.Form):

    def __init__(self, *args, **kwargs):
        user=None
        if('user' in kwargs):
            user = kwargs.pop('user')

        super().__init__(*args, **kwargs)

        if user is not None:
            ticket_query_choices=[('', '--------')]
            ticket_query_queryset = TicketQuery.objects.filter(user=user, query_name__gt='')
            for ticket_query in ticket_query_queryset:
                ticket_query_choices.append((ticket_query.pk, ticket_query.query_name))
            self.fields['recall_ticket_query'].choices=ticket_query_choices

    recall_ticket_query = forms.ChoiceField(label='Recall Query', choices=[])
    delete_ticket_query = forms.BooleanField(label='Delete', required=False)

class TicketForm(ModelForm):
    duplicate = forms.BooleanField(label="Save and Duplicate", initial=False, required=False)
    class Meta:
        model=Ticket
        fields = [
            'item',
            'description',
            'impact',
        ]

class Ticket_TicketResponseForm(ModelForm):
    class Meta:
        model = TicketResponse
        fields = [
            'ticket',
            'updater',
            'status',
            'notes',
            'date_updated',
        ]


Ticket_TicketResponseFormset=inlineformset_factory(Ticket, TicketResponse, form=Ticket_TicketResponseForm, extra=1)


# vim ai et ts=4 sts=4 sw=4
