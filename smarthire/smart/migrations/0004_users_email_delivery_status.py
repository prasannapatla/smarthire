# Generated by Django 3.0.5 on 2021-06-16 10:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('smart', '0003_auto_20200706_1848'),
    ]

    operations = [
        migrations.AddField(
            model_name='users',
            name='email_delivery_status',
            field=models.BooleanField(default=False),
        ),
    ]
