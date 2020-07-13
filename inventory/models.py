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

    def items(self):
        item_list = []
        for item_id in self.itemxrole.values_list('item__id', flat=True):
            item=Item.objects.get(pk=item_id)
            item_list.append(item)
            
        return item_list

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

    def categories(self):
        return self.makemodelxcategory.all().values_list('category__name', flat=True)

    def __str__(self):
        return "{} {}".format(self.brand, self.name)

    class Meta:
        ordering = ['brand', 'name']
        unique_together = [['brand', 'name']]

        verbose_name = "Make/Model"
        verbose_name_plural = "Makes/Models"

class MakeModelXCategory(models.Model):
    makemodel = models.ForeignKey(MakeModel, verbose_name='makemodel', on_delete=models.SET_NULL, help_text="This category's makemodel", null=True, blank=True, related_name='makemodelxcategory', )
    category = models.ForeignKey(Category, verbose_name='category', on_delete=models.SET_NULL, help_text="This makemodel's category", null=True, blank=True, related_name='makemodelxcategory', )

    def __str__(self):
        return "{} x {}".format(self.makemodel, self.category)


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
    home = models.ForeignKey( Location, verbose_name='home', on_delete=models.SET_NULL, help_text="The item's home location", null=True, blank=True, related_name='item_housed', )
    location = models.ForeignKey( Location, verbose_name='current location', on_delete=models.SET_NULL, help_text="The item's current location", null=True, blank=True, related_name='item_located', )
    condition = models.IntegerField( 'condition', help_text='The condition of the item', null=True, blank=True, choices=CONDITION_CHOICES, )
    inventory = models.IntegerField( 'inventory status', help_text='The inventory status of the item', null=True, blank=True, choices=INVENTORY_CHOICES, )
    keeper = models.ForeignKey( Entity, verbose_name='keeper', on_delete=models.SET_NULL, help_text='The person or organization who normally uses or is responsible for the item', null=True, blank=True, related_name='held_item', )
    borrower = models.ForeignKey( Entity, verbose_name='borrower', on_delete=models.SET_NULL, help_text='The person or organization who is currently using or taken responsible for the item', null=True, blank=True, related_name='borrowed_item', )
    lessor = models.ForeignKey( Entity, verbose_name='lessor', on_delete=models.SET_NULL, help_text='The owner or organization from which this item is leased or borrowed', null=True, blank=True, related_name='posession', )
    notes = models.TextField('notes', help_text='Any notes for this item', blank=True)
    inventoried = models.DateField('date confirmed', default=datetime.now, null=True, blank=True, help_text='When this item\'s inventory data was last confirmed');

    def roles(self):
        return self.itemxrole.all().values_list('role__name', flat=True)

    def __str__(self):
        return "{} {} SN:{}".format(self.familiar_name, self.makemodel, self.serial_number)

    class Meta:
        ordering = ['familiar_name', 'makemodel', 'inventory']

class ItemXRole(models.Model):
    item = models.ForeignKey(Item, verbose_name='item', on_delete=models.SET_NULL, help_text="This role's item", null=True, blank=True, related_name='itemxrole', )
    role = models.ForeignKey(Role, verbose_name='role', on_delete=models.SET_NULL, help_text="This item's role", null=True, blank=True, related_name='itemxrole', )

    def __str__(self):
        return "{} x {}".format(self.item, self.role)

class ItemHistory(models.Model):
    item = models.ForeignKey(Item, verbose_name='item', on_delete=models.SET_NULL, help_text="This history record's item", null=True, blank=True, related_name='history', )
    date = models.DateTimeField('date', auto_now_add=True, help_text='The date this record was created')
    description = models.TextField('description', blank=True, help_text='The description of what happened')

    def __str__(self):
        return "{:%Y%B%d} - {} - {}".format(self.date, self.item, self.description)

    class Meta:
        ordering = ['item', '-date']

class ItemQuery(models.Model):

    user = models.ForeignKey( settings.AUTH_USER_MODEL, verbose_name='user', on_delete=models.SET_NULL, help_text='The user associated with the setting', null=True, blank=True, related_name='inventory_query', ) 
    query_name = models.CharField( 'query name', max_length=50,  blank=True, help_text='The name of this query')
    latest_use = models.DateTimeField('last used', auto_now=True, help_text='The most recent use of this query')

    familiar_name_value = models.CharField( 'familiar name', max_length=30, blank=True, help_text="The identifying name for this item (ex Joe's laptop)", )
    familiar_name_use = models.BooleanField('use familiar name', default=False)
    familiar_name_operator = models.CharField('familiar_name operator', max_length=50, default='familiar_name__icontains', choices=(('familiar_name__iexact', 'equals'),('familiar_name__icontains', 'contains')) )

    serial_number_value = models.CharField( 'serial number', max_length=30, help_text="The item's serial number", blank=True )
    serial_number_use = models.BooleanField( 'use serial number', default=False)
    serial_number_operator = models.CharField('serial_number operator', max_length=50, default='serial_number__icontains', choices=(('serial_number__iexact', 'equals'),('serial_number__icontains', 'contains')) )

    makemodel_category_value = models.ForeignKey( Category, verbose_name='category', on_delete=models.SET_NULL, help_text="The item's model's category", null=True, blank=True, related_name='item_query_category', )
    makemodel_category_use = models.BooleanField( 'use category', default=False )
    makemodel_category_operator = models.CharField('category operator', max_length=50, default='makemodel__makemodelxcategory__category__exact', choices=(('makemodel__makemodelxcategory__category__exact', 'equals'),) )

    makemodel_brand_value = models.CharField('brand', max_length=50,  help_text="The item's brand", null=True, blank=True )
    makemodel_brand_use = models.BooleanField( 'use brand', default=False )
    makemodel_brand_operator = models.CharField('makemodel operator', max_length=50, default='makemodel__brand__icontains', choices=(('makemodel__brand__iexact', 'equals'),('makemodel__brand__icontains', 'contains')) )

    makemodel_value = models.ForeignKey( MakeModel, verbose_name='model', on_delete=models.SET_NULL, help_text="The item's model", null=True, blank=True, related_name='item_query', )
    makemodel_use = models.BooleanField( 'use model', default=False )
    makemodel_operator = models.CharField('model operator', max_length=50, default='makemodel__exact', choices=(('makemodel__exact', 'equals'),) )


    asset_number_value = models.CharField( 'asset number', max_length=30, help_text="The item's asset number", blank=True )
    asset_number_use = models.BooleanField('use asset number', default=False)
    asset_number_operator = models.CharField('asset_number operator', max_length=50, default='asset_number__icontains', choices=(('asset_number__iexact', 'equals'),('asset_number__icontains', 'contains')) )

    barcode_value = models.CharField( 'barcode', max_length=50, help_text="The item's barcode", blank=True )
    barcode_use = models.BooleanField('use barcode', default=False)
    barcode_operator = models.CharField('barcode operator', max_length=50, default='barcode__icontains', choices=(('barcode__iexact', 'equals'),('barcode__icontains', 'contains')) )

    hostname_value = models.CharField( 'host name', max_length=50, help_text="The item's network name or hostname", blank=True, )
    hostname_use = models.BooleanField('use hostname', default=False)
    hostname_operator = models.CharField('hostname operator', max_length=50, default='hostname__icontains', choices=(('hostname__iexact', 'equals'),('hostname__icontains', 'contains')) )

    roles_value = models.ManyToManyField( Role, verbose_name='roles', help_text='The roles that are assigned to this item', blank=True, )
    roles_use = models.BooleanField('use roles', default=False)
    roles_operator = models.CharField('roles operator', max_length=50, default='itemxrole__role__in', choices=(('itemxrole__role__in', 'are in'),) )

    home_value = models.ForeignKey( Location, verbose_name='home', on_delete=models.SET_NULL, help_text="The item's home location", null=True, blank=True, related_name='item_query_housed', )
    home_use = models.BooleanField('use home', default=False)
    home_operator = models.CharField('home operator', max_length=50, default='home__exact', choices=(('home__exact', 'equals'),) )

    location_value = models.ForeignKey( Location, verbose_name='current location', on_delete=models.SET_NULL, help_text="The item's current location", null=True, blank=True, related_name='item_query_located', )
    location_use = models.BooleanField('use location', default=False)
    location_operator = models.CharField('location operator', max_length=50, default='location__icontains', choices=(('location__iexact', 'equals'),('location__icontains', 'contains'),) )

    condition_value = models.IntegerField( 'condition', help_text='The condition of the item', null=True, blank=True, choices=Item.CONDITION_CHOICES, )
    condition_use = models.BooleanField('use condition', default=False)
    condition_operator = models.CharField('condition operator', max_length=50, default='condition__icontains', choices=(('condition__iexact', 'equals'),('condition__icontains', 'contains')) )

    inventory_value = models.IntegerField( 'inventory status', help_text='The inventory status of the item', null=True, blank=True, choices=Item.INVENTORY_CHOICES, )
    inventory_use = models.BooleanField('use inventory status', default=False)
    inventory_operator = models.CharField('inventory operator', max_length=50, default='inventory__icontains', choices=(('inventory__iexact', 'equals'),('inventory__icontains', 'contains')) )

    keeper_value = models.ForeignKey( Entity, verbose_name='keeper', on_delete=models.SET_NULL, help_text='The person or organization who normally uses or is responsible for the item', null=True, blank=True, related_name='item_query_held_item', )
    keeper_use = models.BooleanField('use keeper', default=False)
    keeper_operator = models.CharField('keeper operator', max_length=50, default='keeper__icontains', choices=(('keeper__iexact', 'equals'),('keeper__icontains', 'contains')) )

    borrower_value = models.ForeignKey( Entity, verbose_name='borrower', on_delete=models.SET_NULL, help_text='The person or organization who is currently using or taken responsible for the item', null=True, blank=True, related_name='item_query_borrowed_item', )
    borrower_use = models.BooleanField('use borrower', default=False)
    borrower_operator = models.CharField('borrower operator', max_length=50, default='borrower__icontains', choices=(('borrower__iexact', 'equals'),('borrower__icontains', 'contains')) )

    lessor_value = models.ForeignKey( Entity, verbose_name='lessor', on_delete=models.SET_NULL, help_text='The owner or organization from which this item is leased or borrowed', null=True, blank=True, related_name='item_query_posession', )
    lessor_use = models.BooleanField('use lessor', default=False)
    lessor_operator = models.CharField('lessor operator', max_length=50, default='lessor__icontains', choices=(('lessor__iexact', 'equals'),('lessor__icontains', 'contains')) )

    inventoried_1_value = models.DateField('date confirmed', help_text='Date inventory data last confirmed', null=True, blank=True)
    inventoried_1_use = models.BooleanField('use date confirmed', default=False)
    inventoried_1_operator = models.CharField('date confirmed operator', max_length=50, default='inventoried__gte', choices=(('inventoried__gte', 'on or after'),) )

    inventoried_2_value = models.DateField('date confirmed', help_text='Date inventory data last confirmed', null=True, blank=True)
    inventoried_2_use = models.BooleanField('use date confirmed', default=False)
    inventoried_2_operator = models.CharField('date confirmed operator', max_length=50, default='inventoried__lte', choices=(('inventoried__lte', 'on or before'),) )

    notes_value = models.CharField('notes', max_length=100, help_text='Any notes for this item', blank=True)
    notes_use = models.BooleanField('use notes', default=False)
    notes_operator = models.CharField('notes operator', max_length=50, default='notes__icontains', choices=(('notes__iexact', 'equals'),('notes__icontains', 'contains')) )

    ORDERBY_CHOICES = [
        ('familiar_name', 'Name'),
        ('-familiar_name', 'Name DESC'),
        ('serial_number', 'Serial Number'),
        ('-serial_number', 'Serial Number DESC'),
        ('makemodel', 'Model'),
        ('-makemodel', 'Model DESC'),
        ('asset_number', 'Asset Number'),
        ('-asset_number', 'Asset Number DESC'),
        ('barcode', 'Barcode'),
        ('-barcode', 'Barcode DESC'),
        ('hostname', 'Host name'),
        ('-hostname', 'Host name DESC'),
        ('roles', 'Roles'),
        ('-roles', 'Roles DESC'),
        ('home', 'Home'),
        ('-home', 'Home DESC'),
        ('location', 'Current Location'),
        ('-location', 'Current Location DESC'),
        ('condition', 'Condition'),
        ('-condition', 'Condition DESC'),
        ('inventory', 'Inventory Status'),
        ('-inventory', 'Inventory Status DESC'),
        ('keeper', 'Keeper'),
        ('-keeper', 'Keeper DESC'),
        ('borrower', 'Borrower'),
        ('-borrower', 'Borrower DESC'),
        ('lessor', 'Lessor'),
        ('-lessor', 'Lessor DESC'),
        ('inventoried', 'Date Inventoried'),
        ('-inventoried', 'Date Iventoried DESC'),
    ]
    orderby1 = models.CharField('order by',  max_length=20, choices=ORDERBY_CHOICES, default='makemodel')
    orderby2 = models.CharField('order by',  max_length=20, choices=ORDERBY_CHOICES, default='inventory')
    orderby3 = models.CharField('order by',  max_length=20, choices=ORDERBY_CHOICES, default='condition')

    paginate_by = models.IntegerField('paginate by', default=10)

    class Meta:
        unique_together=[['query_name', 'user']]
        ordering = ['-latest_use']

class UserParameters(models.Model):
    user = models.ForeignKey( settings.AUTH_USER_MODEL, verbose_name='user', on_delete=models.SET_NULL, help_text='The user associated with the setting', null=True, blank=True, related_name='inventory_parameter', ) 
    key = models.CharField( 'key', max_length=130, help_text='The name of the setting', blank=True ) 
    value = models.TextField('value', help_text='The value of the setting', blank=True)

# vim: ai ts=4 sts=4 et sw=4

