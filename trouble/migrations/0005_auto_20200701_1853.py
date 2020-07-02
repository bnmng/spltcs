# Generated by Django 3.0.5 on 2020-07-01 18:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trouble', '0004_auto_20200623_1536'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='description',
            field=models.TextField(blank=True, help_text='Any notes for this ticket', verbose_name='description'),
        ),
        migrations.AlterField(
            model_name='ticketresponse',
            name='notes',
            field=models.TextField(blank=True, help_text='Any notes for this update', verbose_name='notes'),
        ),
    ]