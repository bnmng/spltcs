# Generated by Django 3.0.5 on 2020-07-27 23:36

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('inventory', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('entities', '0002_auto_20200727_2336'),
    ]

    operations = [
        migrations.AddField(
            model_name='userparameters',
            name='user',
            field=models.ForeignKey(blank=True, help_text='The user associated with the setting', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='inventory_parameter', to=settings.AUTH_USER_MODEL, verbose_name='user'),
        ),
        migrations.AddField(
            model_name='makemodelxcategory',
            name='category',
            field=models.ForeignKey(blank=True, help_text="This makemodel's category", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='makemodelxcategory', to='inventory.Category', verbose_name='category'),
        ),
        migrations.AddField(
            model_name='makemodelxcategory',
            name='makemodel',
            field=models.ForeignKey(blank=True, help_text="This category's makemodel", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='makemodelxcategory', to='inventory.MakeModel', verbose_name='makemodel'),
        ),
        migrations.AlterUniqueTogether(
            name='makemodel',
            unique_together={('brand', 'name')},
        ),
        migrations.AddField(
            model_name='itemxrole',
            name='item',
            field=models.ForeignKey(blank=True, help_text="This role's item", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='itemxrole', to='inventory.Item', verbose_name='item'),
        ),
        migrations.AddField(
            model_name='itemxrole',
            name='role',
            field=models.ForeignKey(blank=True, help_text="This item's role", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='itemxrole', to='inventory.Role', verbose_name='role'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='borrower_value',
            field=models.ForeignKey(blank=True, help_text='The person or organization who is currently using or taken responsible for the item', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='item_query_borrowed_item', to='entities.Entity', verbose_name='borrower'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='home_value',
            field=models.ForeignKey(blank=True, help_text="The item's home location", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='item_query_housed', to='inventory.Location', verbose_name='home'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='keeper_value',
            field=models.ForeignKey(blank=True, help_text='The person or organization who normally uses or is responsible for the item', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='item_query_held_item', to='entities.Entity', verbose_name='keeper'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='lessor_value',
            field=models.ForeignKey(blank=True, help_text='The owner or organization from which this item is leased or borrowed', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='item_query_posession', to='entities.Entity', verbose_name='lessor'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='location_value',
            field=models.ForeignKey(blank=True, help_text="The item's current location", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='item_query_located', to='inventory.Location', verbose_name='current location'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='makemodel_category_value',
            field=models.ManyToManyField(blank=True, help_text="The item's model's category", related_name='item_query_category', to='inventory.Category', verbose_name='categories'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='makemodel_value',
            field=models.ForeignKey(blank=True, help_text="The item's model", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='item_query', to='inventory.MakeModel', verbose_name='model'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='roles_value',
            field=models.ManyToManyField(blank=True, help_text='The roles that are assigned to this item', to='inventory.Role', verbose_name='roles'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='user',
            field=models.ForeignKey(blank=True, help_text='The user associated with the setting', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='inventory_query', to=settings.AUTH_USER_MODEL, verbose_name='user'),
        ),
        migrations.AddField(
            model_name='itemhistory',
            name='item',
            field=models.ForeignKey(blank=True, help_text="This history record's item", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='history', to='inventory.Item', verbose_name='item'),
        ),
        migrations.AddField(
            model_name='item',
            name='borrower',
            field=models.ForeignKey(blank=True, help_text='The person or organization who is currently using or taken responsible for the item', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='borrowed_item', to='entities.Entity', verbose_name='borrower'),
        ),
        migrations.AddField(
            model_name='item',
            name='home',
            field=models.ForeignKey(blank=True, help_text="The item's home location", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='item_housed', to='inventory.Location', verbose_name='home'),
        ),
        migrations.AddField(
            model_name='item',
            name='keeper',
            field=models.ForeignKey(blank=True, help_text='The person or organization who normally uses or is responsible for the item', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='held_item', to='entities.Entity', verbose_name='keeper'),
        ),
        migrations.AddField(
            model_name='item',
            name='lessor',
            field=models.ForeignKey(blank=True, help_text='The owner or organization from which this item is leased or borrowed', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='posession', to='entities.Entity', verbose_name='lessor'),
        ),
        migrations.AddField(
            model_name='item',
            name='location',
            field=models.ForeignKey(blank=True, help_text="The item's current location", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='item_located', to='inventory.Location', verbose_name='current location'),
        ),
        migrations.AddField(
            model_name='item',
            name='makemodel',
            field=models.ForeignKey(blank=True, help_text="The item's model", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='item', to='inventory.MakeModel', verbose_name='model'),
        ),
        migrations.AlterUniqueTogether(
            name='itemquery',
            unique_together={('query_name', 'user')},
        ),
    ]