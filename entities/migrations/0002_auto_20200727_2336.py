# Generated by Django 3.0.5 on 2020-07-27 23:36

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('entities', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='entity',
            name='user',
            field=models.ForeignKey(blank=True, help_text='The user associated with this entity', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='entity', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='email',
            name='entity',
            field=models.ForeignKey(blank=True, help_text='The entity who has this email address', null=True, on_delete=django.db.models.deletion.SET_NULL, to='entities.Entity', verbose_name='Entity'),
        ),
    ]
