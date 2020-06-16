from django.db import models
from inventory.models import Role, Category
from datetime import date, datetime
from django.conf import settings
from django.db import models
from django.urls import reverse
from django.utils import timezone
from entities.models import Entity

class ApplicabilityItem(models.Model):
    roles = models.ManyToManyField(Role, help_text='The roles to which this maintenance should apply.  The item must be a member of all roles and all categories selected')
    categories = models.ManyToManyField(Category, help_text='The categories to which this maintenance should apply.  The item must be a member of all categories and all categories selected')

class Job(models.Model):
    DAY_UNIT='DA'
    WEEK_UNIT='WK'
    MONTH_UNIT='MO'
    YEAR_UNIT='YE'
    REPEAT_UNIT_CHOICES = [
        (DAY_UNIT, 'days'),
        (WEEK_UNIT, 'weeks'),
        (MONTH_UNIT, 'months'),
        (YEAR_UNIT, 'years'),
    ]
    
    title = models.CharField('title', max_length=80, help_text='Title of the work done or to be done (ex. "Dusted Computers", "Ran updates" )', )
    description = models.TextField('description', max_length=80, help_text='Description of the work done or to be done', )
    repeat_qty = models.IntegerField('repeat quantity', help_text='The minimum amount of time that should pass before repeating (qty of units)')
    repeat_unit = models.CharField('repeat units', max_length=2, choices=REPEAT_UNIT_CHOICES, help_text='The minimum amount of time tha should pass before repeating (units)')
    applicability_items = models.ManyToManyField(ApplicabilityItem, help_text='The set of roles and categories to which this template applies')

class Action(models.Model):
    job = models.ForeignKey(Job, on_delete=models.CASCADE, help_text='The job that was performed by this action')
    when = models.DateField('date', default=datetime.now, help_text='When this work was done')


