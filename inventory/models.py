from datetime import date, datetime
from django.conf import settings
from django.db import models
from django.urls import reverse
from django.utils import timezone
from entities.models import Entity

class Role(models.Model):
    name = models.CharField('Name', max_length=50, help_text='Name of the role (ex. "Staff", "Lendable" )', )
    description = models.CharField('Description', max_length=100, help_text='Description of the role (ex. "Items Apporoved for the Domain", "Lendable Items" )', blank=True, )

    class Meta:
        ordering = ['name']

    def __str__(self):
        return self.name

class Category(models.Model):
    name = models.CharField( 'Name', max_length=50, help_text='Name of the category (ex. "Desktop", "Tablet" )', )
    description = models.CharField( 'Description', max_length=100, help_text='Description of the category (ex. "Desk", "Lendable Items" )', blank=True, )

    class Meta:
        verbose_name = 'category'
        verbose_name_plural = 'categories'

        ordering = ['name']

    def __str__(self):
        return self.name

class Location(models.Model):
    name = models.CharField( 'Name', max_length=30, help_text="The name of the building, vehicle, campus, etc.. ")
    abbreviation = models.CharField( 'Abbreviation', max_length=30, help_text='An abbreviation for the location')
    priority = models.IntegerField( 'Priority', default=5, help_text="A number for sorting (in default order, low numbers are first)", )

    class Meta:
        ordering = ['priority', 'name']

    def __str__(self):
        return self.name

class MakeModel(models.Model):
    brand = models.CharField( 'Brand', max_length=30, help_text='The models brand', blank=True )
    name = models.CharField( 'Model Name', max_length=30, help_text='The model name', blank=True )
    part_number = models.CharField( 'Part Number', max_length=30, help_text='The part number or designation other than the marketed model name', blank=True)
    description = models.CharField( 'Description', max_length=100, help_text="The description (ex 'Laptop Computer', 'Tablet', 'Printer'", blank=True)
    categories = models.ManyToManyField( Category, verbose_name='categories', help_text='The categories to which the model belongs', blank=True)

    def __str__(self):
        return "{} {}".format(self.brand, self.name)

    class Meta:
        ordering = ['brand', 'name']
        unique_together = [['brand', 'name']]

        verbose_name = "Make/Model"
        verbose_name_plural = "Makes/Models"

class Item(models.Model):
    UNUSABLE_CONDITION = 12
    DISFUNCTIONAL_CONDITION = 9
    DEGRADED_CONDITION = 6
    WORN_CONDITION = 3
    GOOD_CONDITION = 0

    CONDITION_CHOICES = [
        (UNUSABLE_CONDITION, 'U Unusable'),
        (DISFUNCTIONAL_CONDITION, 'F Disfunctional'),
        (DEGRADED_CONDITION, 'D Degraded'),
        (WORN_CONDITION, 'W Worn but fully operational'),
        (GOOD_CONDITION, 'N New or like new'),
    ]
    INVENTORY_CHOICES = [
        (0, 'N Not yet in use'),
        (3, 'I In use'),
        (6, 'S Stored'),
        (9, 'P Pending Removal'),
        (12, 'R Removed from Inventory'),
    ]
    familiar_name = models.CharField( 'familiar name', max_length=30, help_text="The identifying name for this item (ex Joe's laptop)", )
    serial_number = models.CharField( 'serial number', max_length=30, help_text="The item's serial number", blank=True )
    makemodel = models.ForeignKey( MakeModel, verbose_name='model', on_delete=models.SET_NULL, help_text="The item's model", null=True, blank=True, related_name='item', )
    asset_number = models.CharField( 'asset number', max_length=30, help_text="The item's asset number", blank=True )
    barcode = models.CharField( 'barcode', max_length=50, help_text="The item's barcode", blank=True )
    hostname = models.CharField( 'host name', max_length=50, help_text="The item's network name or hostname", blank=True, )
    roles = models.ManyToManyField( Role, verbose_name='roles', help_text='The roles that are assigned to this item', blank=True, )
    home = models.ForeignKey( Location, verbose_name='home', on_delete=models.SET_NULL, help_text="The item's home location", null=True, blank=True, related_name='item_housed', )
    location = models.ForeignKey( Location, verbose_name='current location', on_delete=models.SET_NULL, help_text="The item's current location", null=True, blank=True, related_name='item_located', )
    condition = models.IntegerField( 'condition', help_text='The condition of the item', null=True, blank=True, choices=CONDITION_CHOICES, )
    inventory = models.IntegerField( 'inventory status', help_text='The inventory status of the item', null=True, blank=True, choices=INVENTORY_CHOICES, )
    keeper = models.ForeignKey( Entity, verbose_name='keeper', on_delete=models.SET_NULL, help_text='The person or organization who normally uses or is responsible for the item', null=True, blank=True, related_name='held_item', )
    borrower = models.ForeignKey( Entity, verbose_name='borrower', on_delete=models.SET_NULL, help_text='The person or organization who is currently using or taken responsible for the item', null=True, blank=True, related_name='borrowed_item', )
    lessor = models.ForeignKey( Entity, verbose_name='lessor', on_delete=models.SET_NULL, help_text='The owner or organization from which this item is leased or borrowed', null=True, blank=True, related_name='posession', )
    notes = models.TextField('notes', help_text='Any notes for this item', blank=True)

    def __str__(self):
        return "{} {}".format(self.familiar_name, self.makemodel)

    class Meta:
        ordering = ['makemodel', 'inventory']

class ItemHistory(models.Model):
    item = models.ForeignKey(Item, verbose_name='item', on_delete=models.SET_NULL, help_text="This history record's item", null=True, blank=True, related_name='history', )
    date = models.DateTimeField('date', auto_now_add=True, help_text='The date this record was created')
    description = models.TextField('description', blank=True, help_text='The description of what happened')

    def __str__(self):
        return "{:%Y%B%d} - {} - {}".format(self.date, self.item, self.description)

    class Meta:
        ordering = ['item', '-date']

class UserParameters(models.Model):
    user = models.ForeignKey( settings.AUTH_USER_MODEL, verbose_name='user', on_delete=models.SET_NULL, help_text='The user associated with the setting', null=True, blank=True, related_name='inventory_parameter', ) 
    key = models.CharField( 'key', max_length=130, help_text='The name of the setting', blank=True ) 
    value = models.TextField('value', help_text='The value of the setting', blank=True)

# vim: ai ts=4 sts=4 et sw=4

