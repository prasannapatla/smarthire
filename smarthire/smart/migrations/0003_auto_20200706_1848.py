# Generated by Django 3.0.8 on 2020-07-06 13:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('smart', '0002_email_open_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='users',
            name='coding_score',
            field=models.CharField(default=-1, max_length=255),
        ),
        migrations.AlterField(
            model_name='users',
            name='score',
            field=models.CharField(default=-1, max_length=255),
        ),
    ]
