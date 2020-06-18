from django.db import models
from django.conf import settings

class Entity(models.Model):
    class EntityType(models.IntegerChoices):
        ORGANIZATION=1
        DEPARTMENT=2
        DIVISION=3
        INDIVIDUAL=10
    entity_type = models.IntegerField('Type', choices=EntityType.choices, null=True,  help_text='The type of entity')
    full_name = models.CharField('Full Name', max_length=75, help_text='Full name, ex: "Benjamin Goldberg", "Technology and Content Strategy"')
    short_name = models.CharField('Short Name', max_length=10, help_text='A familiar name, short name, or abbreviation, ex:"Ben", "TCS"')
    sort_code = models.CharField('Sort Code', default='|', max_length=10, blank=True, help_text='A string to use for sorting in a list. ex: "_", "A", "zzz", "|".  Default sorting will be on type, sort code, then full name ')
    member_of = models.ForeignKey('Entity', on_delete=models.SET_NULL, blank=True, null=True, help_text='The entity of which this entity is a part', related_name='member')
    supervisor = models.ForeignKey('Entity', on_delete=models.SET_NULL, blank=True, null=True, limit_choices_to={'entity_type': EntityType.INDIVIDUAL}, help_text='The person who is this person\'s supervisor', related_name='subordinate')
    job_title = models.CharField('Job Title', max_length=50, blank=True, help_text="The person's job title")
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True, blank=True, help_text='The user associated with this entity', related_name='entity')

    class Meta:
        ordering=['sort_code', 'full_name']

    def __str__(self):
        return self.full_name

class VoicePhone(models.Model):
    number = models.CharField('Number', max_length=15, help_text='Ten digit phone number')
    is_primary = models.BooleanField('Is Primary', default=False, help_text='Is this primary?')
    extension = models.CharField('Extension', max_length=30, help_text='Extension and extra calling info (ie \'x304\', \'Ask for the Floor Manger\')')
    name = models.CharField('Name', blank=True, max_length=15, help_text='Name of phone (ex: "Work", "Home", "Mobile")')
    entity = models.ForeignKey(Entity, on_delete=models.SET_NULL, verbose_name='Entity', null=True, blank=True,  help_text='The entity who has this phone number')

    class Meta:
        verbose_name='voice phone'
        ordering=['entity', 'is_primary', 'number']

    def __str__(self):
        return '{} {}'.format(self.entity.short_name, self.number)

class SMSPhone(models.Model):
    number = models.CharField('Number', max_length=15, help_text='Ten digit phone number')
    is_primary = models.BooleanField('Is Primary', default=False, help_text='Is this primary?')
    name = models.CharField('Name', max_length=15, blank=True, help_text='Name of phone (ex: "Work", "Home", "Mobile")')
    entity = models.ForeignKey(Entity, on_delete=models.SET_NULL, verbose_name='Entity', null=True, blank=True,  help_text='The entity who has this phone number')

    class Meta:
        verbose_name='SMS phone'
        ordering=['entity', 'is_primary', 'number']

    def __str__(self):
        return '{} {}'.format(self.entity.short_name, self.number)

class Email(models.Model):
    address = models.EmailField('Address', help_text='Email address')
    is_primary = models.BooleanField('Is Primary', default=False, help_text='Is this primary?')
    name = models.CharField('Name', max_length=15, blank=True,  help_text='Name of email (ex: "Work", "Home", "Mobile")')
    entity = models.ForeignKey(Entity, on_delete=models.SET_NULL, verbose_name='Entity', null=True, blank=True,  help_text='The entity who has this email address')

    class Meta:
        verbose_name='email'
        ordering=['entity', 'is_primary', 'address']

    def __str__(self):
        return '{} {}'.format(self.entity.short_name, self.address)

class Roll(models.Model):
    name = models.CharField('name', max_length=50, help_text='The name of this roll')
    sort_code = models.CharField('Sort Code', default='|', max_length=10, blank=True, help_text='A string to use for sorting in a list. ex: "_", "A", "zzz", "|".  Default sorting will be on sort code, name ')

    class Meta:
        ordering = ['sort_code', 'name',]

    def __str__(self):
        return self.name;

class EntityXRoll(models.Model):
    entity = models.ForeignKey(Entity, on_delete=models.CASCADE, help_text='The entity that is on this roll', related_name='entityxroll')
    roll = models.ForeignKey(Roll, on_delete=models.CASCADE, help_text='The roll that includes this entity', related_name='entityxroll')

# vim: ai ts=4 sts=4 et sw=4
