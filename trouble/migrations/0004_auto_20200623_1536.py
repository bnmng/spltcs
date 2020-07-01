# Generated by Django 3.0.5 on 2020-06-23 15:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trouble', '0003_auto_20200623_1347'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticketquery',
            name='orderby1',
            field=models.CharField(choices=[('submitter', 'Submitter'), ('-submitter', 'Submitter DESC'), ('item', 'Item'), ('-item', 'Item DESC'), ('impact', 'Impact'), ('-impact', 'Impact DESC'), ('date_reported', 'Date'), ('-date_reported', 'Date DESC')], default='-date_reported', max_length=20, verbose_name='order by'),
        ),
        migrations.AlterField(
            model_name='ticketquery',
            name='orderby2',
            field=models.CharField(choices=[('submitter', 'Submitter'), ('-submitter', 'Submitter DESC'), ('item', 'Item'), ('-item', 'Item DESC'), ('impact', 'Impact'), ('-impact', 'Impact DESC'), ('date_reported', 'Date'), ('-date_reported', 'Date DESC')], default='impact', max_length=20, verbose_name='order by'),
        ),
        migrations.AlterField(
            model_name='ticketquery',
            name='orderby3',
            field=models.CharField(choices=[('submitter', 'Submitter'), ('-submitter', 'Submitter DESC'), ('item', 'Item'), ('-item', 'Item DESC'), ('impact', 'Impact'), ('-impact', 'Impact DESC'), ('date_reported', 'Date'), ('-date_reported', 'Date DESC')], default='item', max_length=20, verbose_name='order by'),
        ),
    ]