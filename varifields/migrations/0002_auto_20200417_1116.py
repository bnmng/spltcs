# Generated by Django 3.0.5 on 2020-04-17 11:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('varifields', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ObjectId',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('object_id', models.PositiveIntegerField(help_text='The Id of an object')),
            ],
        ),
        migrations.RemoveField(
            model_name='varifieldspec',
            name='object_id',
        ),
        migrations.AddField(
            model_name='varifieldspec',
            name='object_ids',
            field=models.ManyToManyField(blank=True, help_text='The Ids of the objects to which this spec applies', to='varifields.ObjectId'),
        ),
    ]
