# Generated by Django 3.0.5 on 2020-07-01 18:53

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('inventory', '0008_auto_20200619_1510'),
    ]

    operations = [
        migrations.AddField(
            model_name='item',
            name='inventoried',
            field=models.DateField(blank=True, default=datetime.datetime.now, help_text="When this item's inventory data was last confirmed", null=True, verbose_name='date confirmed'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='inventoried_1_operator',
            field=models.CharField(choices=[('inventoried__gte', 'on or after')], default='inventoried__gte', max_length=50, verbose_name='date confirmed operator'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='inventoried_1_use',
            field=models.BooleanField(default=False, verbose_name='use date confirmed'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='inventoried_1_value',
            field=models.DateField(blank=True, help_text='Date inventory data last confirmed', null=True, verbose_name='date confirmed'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='inventoried_2_operator',
            field=models.CharField(choices=[('inventoried__lte', 'on or before')], default='inventoried__lte', max_length=50, verbose_name='date confirmed operator'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='inventoried_2_use',
            field=models.BooleanField(default=False, verbose_name='use date confirmed'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='inventoried_2_value',
            field=models.DateField(blank=True, help_text='Date inventory data last confirmed', null=True, verbose_name='date confirmed'),
        ),
        migrations.AlterField(
            model_name='itemquery',
            name='orderby1',
            field=models.CharField(choices=[('familiar_name', 'Name'), ('-familiar_name', 'Name DESC'), ('serial_number', 'Serial Number'), ('-serial_number', 'Serial Number DESC'), ('makemodel', 'Model'), ('-makemodel', 'Model DESC'), ('asset_number', 'Asset Number'), ('-asset_number', 'Asset Number DESC'), ('barcode', 'Barcode'), ('-barcode', 'Barcode DESC'), ('hostname', 'Host name'), ('-hostname', 'Host name DESC'), ('roles', 'Roles'), ('-roles', 'Roles DESC'), ('home', 'Home'), ('-home', 'Home DESC'), ('location', 'Current Location'), ('-location', 'Current Location DESC'), ('condition', 'Condition'), ('-condition', 'Condition DESC'), ('inventory', 'Inventory Status'), ('-inventory', 'Inventory Status DESC'), ('keeper', 'Keeper'), ('-keeper', 'Keeper DESC'), ('borrower', 'Borrower'), ('-borrower', 'Borrower DESC'), ('lessor', 'Lessor'), ('-lessor', 'Lessor DESC'), ('inventoried', 'Date Inventoried'), ('-inventoried', 'Date Iventoried DESC')], default='makemodel', max_length=20, verbose_name='order by'),
        ),
        migrations.AlterField(
            model_name='itemquery',
            name='orderby2',
            field=models.CharField(choices=[('familiar_name', 'Name'), ('-familiar_name', 'Name DESC'), ('serial_number', 'Serial Number'), ('-serial_number', 'Serial Number DESC'), ('makemodel', 'Model'), ('-makemodel', 'Model DESC'), ('asset_number', 'Asset Number'), ('-asset_number', 'Asset Number DESC'), ('barcode', 'Barcode'), ('-barcode', 'Barcode DESC'), ('hostname', 'Host name'), ('-hostname', 'Host name DESC'), ('roles', 'Roles'), ('-roles', 'Roles DESC'), ('home', 'Home'), ('-home', 'Home DESC'), ('location', 'Current Location'), ('-location', 'Current Location DESC'), ('condition', 'Condition'), ('-condition', 'Condition DESC'), ('inventory', 'Inventory Status'), ('-inventory', 'Inventory Status DESC'), ('keeper', 'Keeper'), ('-keeper', 'Keeper DESC'), ('borrower', 'Borrower'), ('-borrower', 'Borrower DESC'), ('lessor', 'Lessor'), ('-lessor', 'Lessor DESC'), ('inventoried', 'Date Inventoried'), ('-inventoried', 'Date Iventoried DESC')], default='inventory', max_length=20, verbose_name='order by'),
        ),
        migrations.AlterField(
            model_name='itemquery',
            name='orderby3',
            field=models.CharField(choices=[('familiar_name', 'Name'), ('-familiar_name', 'Name DESC'), ('serial_number', 'Serial Number'), ('-serial_number', 'Serial Number DESC'), ('makemodel', 'Model'), ('-makemodel', 'Model DESC'), ('asset_number', 'Asset Number'), ('-asset_number', 'Asset Number DESC'), ('barcode', 'Barcode'), ('-barcode', 'Barcode DESC'), ('hostname', 'Host name'), ('-hostname', 'Host name DESC'), ('roles', 'Roles'), ('-roles', 'Roles DESC'), ('home', 'Home'), ('-home', 'Home DESC'), ('location', 'Current Location'), ('-location', 'Current Location DESC'), ('condition', 'Condition'), ('-condition', 'Condition DESC'), ('inventory', 'Inventory Status'), ('-inventory', 'Inventory Status DESC'), ('keeper', 'Keeper'), ('-keeper', 'Keeper DESC'), ('borrower', 'Borrower'), ('-borrower', 'Borrower DESC'), ('lessor', 'Lessor'), ('-lessor', 'Lessor DESC'), ('inventoried', 'Date Inventoried'), ('-inventoried', 'Date Iventoried DESC')], default='condition', max_length=20, verbose_name='order by'),
        ),
    ]
