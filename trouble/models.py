from django.db import models
from inventory.models import Item
from django.conf import settings
from datetime import date

class Ticket(models.Model):
    IMPACT_HIGH = 9
    IMPACT_MEDIUM = 5
    IMPACT_LOW = 1
    IMPACT_CHOICES = (
        (IMPACT_HIGH, 'High: (Computer won\'t start, Printer output is unusable)'),
        (IMPACT_MEDIUM, 'Medium: (Computer is slow, Printer leaving specks on paper)'),
        (IMPACT_LOW, 'Low: (Computer is rattling, Printer displays toner message'),
    )


    item = models.ForeignKey(Item, on_delete=models.SET_NULL, null=True, blank=True, help_text='The item associated with this ticket  You can leave this blank if unknown or N/A', related_name='ticket')
    submitter = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True, blank=True, help_text='The user who submitted this ticket', related_name='submitted_ticket')
    description = models.TextField('description', help_text='Any notes for this ticket', blank=True)
    impact = models.IntegerField('impact', choices=IMPACT_CHOICES, default=1, help_text='The impact is this trouble having on operations?')
    date_reported = models.DateField('date', auto_now_add=True, help_text='The date this ticket was submitted')

    def status(self):
        status=0
        check_status=self.ticketresponse.all().latest('date_updated')
        if(check_status).exists():
            status=check_status.latest('date_updated').status

class TicketResponse(models.Model):
    STATUS_OPEN = 0
    STATUS_SEEN = 1
    STATUS_PROGRESSING = 2
    STATUS_DELAYED = 3
    STATUS_HELD = 4
    STATUS_CLOSED = 10
    STATUS_CHOICES = (
        (STATUS_OPEN, 0),
        (STATUS_SEEN, 1),
        (STATUS_PROGRESSING, 2),
        (STATUS_DELAYED, 3),
        (STATUS_HELD, 4),
        (STATUS_CLOSED, 10),
    )
    ticket = models.ForeignKey(Ticket, related_name='ticketresponse', on_delete=models.CASCADE, help_text='The ticket for this response')
    updater = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True, blank=True, help_text='The tech who updated this ticket', related_name='ticket_update')
    status = models.IntegerField('status', choices=STATUS_CHOICES, default=0, help_text='The status of the ticket as of this update')
    notes = models.TextField('notes', help_text='Any notes for this update', blank=True)
    date_updated = models.DateField('date', default=date.today, help_text='The date of this update')


class TicketQuery(models.Model):

    user = models.ForeignKey( settings.AUTH_USER_MODEL, verbose_name='user', on_delete=models.SET_NULL, help_text='The user associated with the setting', null=True, blank=True, related_name='trouble_query', ) 
    query_name = models.CharField( 'query name', max_length=50,  blank=True, help_text='The name of this query')
    latest_use = models.DateTimeField('last used', auto_now=True, help_text='The most recent use of this query')

    item_value = models.ForeignKey( Item, verbose_name='item', on_delete=models.SET_NULL, help_text="The ticket's item", null=True, blank=True, related_name='ticket_query', )
    item_use = models.BooleanField( 'use item', default=False )
    item_operator = models.CharField('item operator', max_length=50, default='item__icontains', choices=(('item__iexact', 'equals'),('item__icontains', 'contains')) )

    submitter_value = models.ForeignKey( settings.AUTH_USER_MODEL, verbose_name='submitter', on_delete=models.SET_NULL, help_text="The ticket's submitter", null=True, blank=True, related_name='ticket_query', )
    submitter_use = models.BooleanField( 'use submitter', default=False )
    submitter_operator = models.CharField('submitter operator', max_length=50, default='submitter__icontains', choices=(('submitter__iexact', 'equals'),('submitter__icontains', 'contains')) )

    description_value = models.CharField( 'description', max_length=30, blank=True, help_text="The description of the trouble", )
    description_use = models.BooleanField('use description', default=False)
    description_operator = models.CharField('description operator', max_length=50, default='description__icontains', choices=(('description__iexact', 'equals'),('description__icontains', 'contains')) )

    impact_value = models.CharField( 'impact', max_length=30, help_text="The trouble's impact", blank=True )
    impact_use = models.BooleanField( 'use serial number', default=False)
    impact_operator = models.CharField('impact operator', max_length=50, default='impact__iexact', choices=(('impact__iexact', 'equals'),) )

    ORDERBY_CHOICES = [
        ('submitter', 'Submitter'),
        ('-submitter', 'Submitter DESC'),
        ('item', 'Item'),
        ('-item', 'Item DESC'),
        ('impact', 'Impact'),
        ('-impact', 'Impact DESC'),
        ('date_reported', 'Date'),
        ('-date_reported', 'Date DESC'),
    ]
    orderby1 = models.CharField('order by',  max_length=20, choices=ORDERBY_CHOICES, default='-date_reported')
    orderby2 = models.CharField('order by',  max_length=20, choices=ORDERBY_CHOICES, default='impact')
    orderby3 = models.CharField('order by',  max_length=20, choices=ORDERBY_CHOICES, default='item')

    paginate_by = models.IntegerField('paginate by', default=10)

    class Meta:
        unique_together=[['query_name', 'user']]
        ordering = ['-latest_use']

class UserParameters(models.Model):
    user = models.ForeignKey( settings.AUTH_USER_MODEL, verbose_name='user', on_delete=models.SET_NULL, help_text='The user associated with the setting', null=True, blank=True, related_name='trouble_parameter', ) 
    key = models.CharField( 'key', max_length=130, help_text='The name of the setting', blank=True ) 
    value = models.TextField('value', help_text='The value of the setting', blank=True)

