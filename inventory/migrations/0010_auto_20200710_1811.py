# Generated by Django 3.0.5 on 2020-07-10 18:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('inventory', '0009_auto_20200701_1853'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='itemquery',
            name='makemodel_operator',
        ),
        migrations.RemoveField(
            model_name='itemquery',
            name='makemodel_use',
        ),
        migrations.RemoveField(
            model_name='itemquery',
            name='makemodel_value',
        ),
        migrations.AddField(
            model_name='itemquery',
            name='makemodel_brand_operator',
            field=models.CharField(choices=[('makemodel__brand__iexact', 'equals'), ('makemodel__brand__icontains', 'contains')], default='makemodel__brand__icontains', max_length=50, verbose_name='makemodel operator'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='makemodel_brand_use',
            field=models.BooleanField(default=False, verbose_name='use brand'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='makemodel_brand_value',
            field=models.CharField(blank=True, help_text="The item's brand", max_length=50, null=True, verbose_name='brand'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='makemodel_category_operator',
            field=models.CharField(choices=[('makemodel__category__in', 'equals')], default='makemodel__category__in', max_length=50, verbose_name='category operator'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='makemodel_category_use',
            field=models.BooleanField(default=False, verbose_name='use category'),
        ),
        migrations.AddField(
            model_name='itemquery',
            name='makemodel_category_value',
            field=models.ForeignKey(blank=True, help_text="The item's model's category", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='item_query_category', to='inventory.Category', verbose_name='category'),
        ),
    ]