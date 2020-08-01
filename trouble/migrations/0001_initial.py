# Generated by Django 3.0.5 on 2020-07-27 23:36

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('inventory', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Ticket',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.TextField(blank=True, help_text='Any notes for this ticket', verbose_name='description')),
                ('impact', models.IntegerField(choices=[(9, "High: (Computer won't start, Printer output is unusable)"), (5, 'Medium: (Computer is slow, Printer leaving specks on paper)'), (1, 'Low: (Computer is rattling, Printer displays toner message')], default=1, help_text='The impact is this trouble having on operations?', verbose_name='impact')),
                ('date_reported', models.DateField(auto_now_add=True, help_text='The date this ticket was submitted', verbose_name='date')),
                ('item', models.ForeignKey(blank=True, help_text='The item associated with this ticket  You can leave this blank if unknown or N/A', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='ticket', to='inventory.Item')),
                ('submitter', models.ForeignKey(blank=True, help_text='The user who submitted this ticket', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='submitted_ticket', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='UserParameters',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('key', models.CharField(blank=True, help_text='The name of the setting', max_length=130, verbose_name='key')),
                ('value', models.TextField(blank=True, help_text='The value of the setting', verbose_name='value')),
                ('user', models.ForeignKey(blank=True, help_text='The user associated with the setting', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='trouble_parameter', to=settings.AUTH_USER_MODEL, verbose_name='user')),
            ],
        ),
        migrations.CreateModel(
            name='TicketResponse',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField(choices=[(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (10, 10)], default=0, help_text='The status of the ticket as of this update', verbose_name='status')),
                ('notes', models.TextField(blank=True, help_text='Any notes for this update', verbose_name='notes')),
                ('date_updated', models.DateField(default=datetime.date.today, help_text='The date of this update', verbose_name='date')),
                ('ticket', models.ForeignKey(help_text='The ticket for this response', on_delete=django.db.models.deletion.CASCADE, related_name='ticketresponse', to='trouble.Ticket')),
                ('updater', models.ForeignKey(blank=True, help_text='The tech who updated this ticket', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='ticket_update', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='TicketQuery',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('query_name', models.CharField(blank=True, help_text='The name of this query', max_length=50, verbose_name='query name')),
                ('latest_use', models.DateTimeField(auto_now=True, help_text='The most recent use of this query', verbose_name='last used')),
                ('item_use', models.BooleanField(default=False, verbose_name='use item')),
                ('item_operator', models.CharField(choices=[('item__iexact', 'equals'), ('item__icontains', 'contains')], default='item__icontains', max_length=50, verbose_name='item operator')),
                ('submitter_use', models.BooleanField(default=False, verbose_name='use submitter')),
                ('submitter_operator', models.CharField(choices=[('submitter__iexact', 'equals'), ('submitter__icontains', 'contains')], default='submitter__icontains', max_length=50, verbose_name='submitter operator')),
                ('description_value', models.CharField(blank=True, help_text='The description of the trouble', max_length=30, verbose_name='description')),
                ('description_use', models.BooleanField(default=False, verbose_name='use description')),
                ('description_operator', models.CharField(choices=[('description__iexact', 'equals'), ('description__icontains', 'contains')], default='description__icontains', max_length=50, verbose_name='description operator')),
                ('impact_value', models.CharField(blank=True, help_text="The trouble's impact", max_length=30, verbose_name='impact')),
                ('impact_use', models.BooleanField(default=False, verbose_name='use serial number')),
                ('impact_operator', models.CharField(choices=[('impact__iexact', 'equals')], default='impact__iexact', max_length=50, verbose_name='impact operator')),
                ('orderby1', models.CharField(choices=[('submitter', 'Submitter'), ('-submitter', 'Submitter DESC'), ('item', 'Item'), ('-item', 'Item DESC'), ('impact', 'Impact'), ('-impact', 'Impact DESC'), ('date_reported', 'Date'), ('-date_reported', 'Date DESC')], default='-date_reported', max_length=20, verbose_name='order by')),
                ('orderby2', models.CharField(choices=[('submitter', 'Submitter'), ('-submitter', 'Submitter DESC'), ('item', 'Item'), ('-item', 'Item DESC'), ('impact', 'Impact'), ('-impact', 'Impact DESC'), ('date_reported', 'Date'), ('-date_reported', 'Date DESC')], default='impact', max_length=20, verbose_name='order by')),
                ('orderby3', models.CharField(choices=[('submitter', 'Submitter'), ('-submitter', 'Submitter DESC'), ('item', 'Item'), ('-item', 'Item DESC'), ('impact', 'Impact'), ('-impact', 'Impact DESC'), ('date_reported', 'Date'), ('-date_reported', 'Date DESC')], default='item', max_length=20, verbose_name='order by')),
                ('paginate_by', models.IntegerField(default=10, verbose_name='paginate by')),
                ('item_value', models.ForeignKey(blank=True, help_text="The ticket's item", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='ticket_query', to='inventory.Item', verbose_name='item')),
                ('submitter_value', models.ForeignKey(blank=True, help_text="The ticket's submitter", null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='ticket_query', to=settings.AUTH_USER_MODEL, verbose_name='submitter')),
                ('user', models.ForeignKey(blank=True, help_text='The user associated with the setting', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='trouble_query', to=settings.AUTH_USER_MODEL, verbose_name='user')),
            ],
            options={
                'ordering': ['-latest_use'],
                'unique_together': {('query_name', 'user')},
            },
        ),
    ]
