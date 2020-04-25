from django.db import models
from django.conf import settings

class List(models.Model):
    name = models.CharField('Name', max_length=50, help_text='Name of the list (ex. "Phone Card", "Suppliers" )', )

class Entity(models.Model):
    KIND_GROUP='GR'
    KIND_INDIVIDUAL='IN'
    KIND_CHOICES=(
        (KIND_GROUP, "Group"),
        (KIND_INDIVIDUAL, "Individual")
    )
    kind = models.CharField('Type', max_length=2, choices=KIND_CHOICES, help_text='The kind of entity')
    name = models.CharField('Name', max_length=50, help_text='Name of the entity (ex. "Ben", "TCS", )', )
    part_of = models.ManyToManyField('self', verbose_name='part of', related_name='member',  blank=True, help_text='Entities of which this entity is part');
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, verbose_name='user', related_name='entity', blank=True, null=True, help_text='User associated with this entity')

    class Meta:
        verbose_name='person or group'
        verbose_name_plural='people or groups'

        ordering=['name']

    def __str__(self):
        return self.name

class VoicePhone(models.Model):
    number = models.CharField('Number', max_length=15, help_text='Ten digit phone number')
    is_primary = models.BooleanField('Is Primary', default=False, help_text='Is this primary?')
    extension = models.CharField('Extension', max_length=30, help_text='Extension and extra calling info (ie \'x304\', \'Ask for the Floor Manger\')')
    entity = models.ForeignKey(Entity, on_delete=models.SET_NULL, verbose_name='Entity', null=True, blank=True,  help_text='The phnity who is the contact for this phone number')

    class Meta:
        verbose_name='voice phone'
        ordering=['entity', 'is_primary', 'number']

    def __str__(self):
        return '{} {}'.format(self.entity.name, self.number)

class SMSPhone(models.Model):
    number = models.CharField('Number', max_length=15, help_text='Ten digit phone number')
    is_primary = models.BooleanField('Is Primary', default=False, help_text='Is this primary?')
    entity = models.ForeignKey(Entity, on_delete=models.SET_NULL, verbose_name='Entity', null=True, blank=True,  help_text='The phnity who is the contact for this phone number')

    class Meta:
        verbose_name='SMS phone'
        ordering=['entity', 'is_primary', 'number']

    def __str__(self):
        return '{} {}'.format(self.entity.name, self.number)

class Email(models.Model):
    address = models.EmailField('Address', help_text='Email address')
    is_primary = models.BooleanField('Is Primary', default=False, help_text='Is this primary?')
    entity = models.ForeignKey(Entity, on_delete=models.SET_NULL, verbose_name='Entity', null=True, blank=True,  help_text='The phnity who is the contact for this phone address')

    class Meta:
        verbose_name='email'
        ordering=['entity', 'is_primary', 'address']

    def __str__(self):
        return '{} {}'.format(self.entity.name, self.address)

class ContactList(models.Model):
    name=models.CharField('Name', max_length=50, help_text='The name of the list')

class Membership(models.Model):
    entity=models.ForeignKey(Entity, on_delete=models.CASCADE, help_text='The person or group that is on the list')
    contact_list=models.ForeignKey(ContactList, on_delete=models.CASCADE, help_text='The list that has the person or group as a member')
