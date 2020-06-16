# Generated by Django 3.0.5 on 2020-05-08 14:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ContactList',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(help_text='The name of the list', max_length=50, verbose_name='Name')),
            ],
        ),
        migrations.CreateModel(
            name='Email',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('address', models.EmailField(help_text='Email address', max_length=254, verbose_name='Address')),
                ('is_primary', models.BooleanField(default=False, help_text='Is this primary?', verbose_name='Is Primary')),
            ],
            options={
                'verbose_name': 'email',
                'ordering': ['entity', 'is_primary', 'address'],
            },
        ),
        migrations.CreateModel(
            name='Entity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('kind', models.CharField(choices=[('GR', 'Group'), ('IN', 'Individual')], help_text='The kind of entity', max_length=2, verbose_name='Type')),
                ('name', models.CharField(help_text='Name of the entity (ex. "Ben", "TCS", )', max_length=50, verbose_name='Name')),
                ('part_of', models.ManyToManyField(blank=True, help_text='Entities of which this entity is part', related_name='_entity_part_of_+', to='entities.Entity', verbose_name='part of')),
            ],
            options={
                'verbose_name': 'person or group',
                'verbose_name_plural': 'people or groups',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='List',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(help_text='Name of the list (ex. "Phone Card", "Suppliers" )', max_length=50, verbose_name='Name')),
            ],
        ),
        migrations.CreateModel(
            name='VoicePhone',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.CharField(help_text='Ten digit phone number', max_length=15, verbose_name='Number')),
                ('is_primary', models.BooleanField(default=False, help_text='Is this primary?', verbose_name='Is Primary')),
                ('extension', models.CharField(help_text="Extension and extra calling info (ie 'x304', 'Ask for the Floor Manger')", max_length=30, verbose_name='Extension')),
                ('entity', models.ForeignKey(blank=True, help_text='The phnity who is the contact for this phone number', null=True, on_delete=django.db.models.deletion.SET_NULL, to='entities.Entity', verbose_name='Entity')),
            ],
            options={
                'verbose_name': 'voice phone',
                'ordering': ['entity', 'is_primary', 'number'],
            },
        ),
        migrations.CreateModel(
            name='SMSPhone',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.CharField(help_text='Ten digit phone number', max_length=15, verbose_name='Number')),
                ('is_primary', models.BooleanField(default=False, help_text='Is this primary?', verbose_name='Is Primary')),
                ('entity', models.ForeignKey(blank=True, help_text='The phnity who is the contact for this phone number', null=True, on_delete=django.db.models.deletion.SET_NULL, to='entities.Entity', verbose_name='Entity')),
            ],
            options={
                'verbose_name': 'SMS phone',
                'ordering': ['entity', 'is_primary', 'number'],
            },
        ),
        migrations.CreateModel(
            name='Membership',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('contact_list', models.ForeignKey(help_text='The list that has the person or group as a member', on_delete=django.db.models.deletion.CASCADE, to='entities.ContactList')),
                ('entity', models.ForeignKey(help_text='The person or group that is on the list', on_delete=django.db.models.deletion.CASCADE, to='entities.Entity')),
            ],
        ),
    ]