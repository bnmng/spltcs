from django.db import models

class Software(models.Model):
    name = models.CharField('name', max_length=100, help_text='The name of the software(include company where applicable and major versions variations)')
    notes = models.TextField('notes', null=True, blank=True, help_text='Notes about this software product')

    class Meta:
        verbose_name = 'software'
        ordering = ['name']
    
class Installation(models.Model):
    item = models.ForeignKey(Item, related_name='software_installation', on_delete=models.SET_NULL, null=True, blank=True, help_text='The item on which this software is insalled')
    software = models.ForeignKey(Product, related_name='installation', on_delete=models.SET_NULL, null=True, blank=True, help_text='The software installed on this item')
    name = models.CharField('name', max_length=100, help_text='The name of the software(include company where applicable and major versions variations)')

class Account(models.Model):
    pass

# vim: ai ts=4 sts=4 et sw=4
