# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Battles',
            fields=[
                ('name', models.CharField(max_length=100, serialize=False, primary_key=True)),
                ('year', models.BigIntegerField()),
                ('battle_number', models.BigIntegerField()),
                ('attacker_king', models.CharField(max_length=100, null=True, blank=True)),
                ('defender_king', models.CharField(max_length=100, null=True, blank=True)),
                ('attacker_1', models.CharField(max_length=100)),
                ('attacker_2', models.CharField(max_length=100, null=True, blank=True)),
                ('attacker_3', models.CharField(max_length=100, null=True, blank=True)),
                ('attacker_4', models.CharField(max_length=100, null=True, blank=True)),
                ('defender_1', models.CharField(max_length=100, null=True, blank=True)),
                ('defender_2', models.CharField(max_length=100, null=True, blank=True)),
                ('defender_3', models.CharField(max_length=100, null=True, blank=True)),
                ('defender_4', models.CharField(max_length=100, null=True, blank=True)),
                ('attacker_outcome', models.CharField(max_length=100, null=True, blank=True)),
                ('battle_type', models.CharField(max_length=100, null=True, blank=True)),
                ('major_death', models.CharField(max_length=100, null=True, blank=True)),
                ('major_capture', models.CharField(max_length=100, null=True, blank=True)),
                ('attacker_size', models.BigIntegerField(null=True, blank=True)),
                ('defender_size', models.BigIntegerField(null=True, blank=True)),
                ('attacker_commander', models.CharField(max_length=100, null=True, blank=True)),
                ('defender_commander', models.CharField(max_length=200, null=True, blank=True)),
                ('summer', models.CharField(max_length=100, null=True, blank=True)),
                ('location', models.CharField(max_length=100, null=True, blank=True)),
                ('region', models.CharField(max_length=100)),
                ('note', models.CharField(max_length=400, null=True, blank=True)),
            ],
            options={
                'db_table': 'battles',
                'managed': True,
            },
        ),
    ]
