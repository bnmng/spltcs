# Generated by Django 3.0.5 on 2020-05-08 14:46

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('inventory', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ApplicabilityItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('categories', models.ManyToManyField(help_text='The categories to which this maintenance should apply.  The item must be a member of all categories and all categories selected', to='inventory.Category')),
                ('roles', models.ManyToManyField(help_text='The roles to which this maintenance should apply.  The item must be a member of all roles and all categories selected', to='inventory.Role')),
            ],
        ),
        migrations.CreateModel(
            name='Job',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(help_text='Title of the work done or to be done (ex. "Dusted Computers", "Ran updates" )', max_length=80, verbose_name='title')),
                ('description', models.TextField(help_text='Description of the work done or to be done', max_length=80, verbose_name='description')),
                ('repeat_qty', models.IntegerField(help_text='The minimum amount of time that should pass before repeating (qty of units)', verbose_name='repeat quantity')),
                ('repeat_unit', models.CharField(choices=[('DA', 'days'), ('WK', 'weeks'), ('MO', 'months'), ('YE', 'years')], help_text='The minimum amount of time tha should pass before repeating (units)', max_length=2, verbose_name='repeat units')),
                ('applicability_items', models.ManyToManyField(help_text='The set of roles and categories to which this template applies', to='maintenance.ApplicabilityItem')),
            ],
        ),
        migrations.CreateModel(
            name='Action',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('when', models.DateField(default=datetime.datetime.now, help_text='When this work was done', verbose_name='date')),
                ('job', models.ForeignKey(help_text='The job that was performed by this action', on_delete=django.db.models.deletion.CASCADE, to='maintenance.Job')),
            ],
        ),
    ]