from django.db import models

from datetime import date, datetime
from django.conf import settings
from django.db import models
from django.urls import reverse
from django.utils import timezone
from entities.models import Entity

class Template(models.Model):
    title = models.CharField('title', max_length=80, help_text='Title of the work done or to be done (ex. "Dusted Computers", "Ran updates" )', )
    description = models.TextField('description', max_length=80, help_text='Description of the work done or to be done', )a
    repeat_qty = models.IntegerField('repeat quantity', help_text='The minimum amount of time that should pass before repeating (qty of units)')
    repeat_unit = models.CharField('repeat units', help_text='The minimum amount of time tha should pass before repeating (units)')
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, help_text='The type of object(the model) to which this maintenance will apply.  Note: The choices are limted by Vari Field Spec Choices')

class ApplicableSet(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, help_text='The type of object(the model) to which this field will apply.  Note: The choices are limted by Vari Field Spec Choices')
    object_id = models.PositiveIntegerField(null=True, blank=True) #k418

class Action(models.Model):
    template = models.CharField('template', on_delete=models.CASCADE, help_text='The work that was done')
    when = models.DateField('date', default=datetime.datetime.now, help_text'When this work was done')
