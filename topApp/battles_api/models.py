from __future__ import unicode_literals
from django.db import models


# Create your models here.
class Battles(models.Model):
    name = models.CharField(primary_key=True, max_length=100)
    year = models.BigIntegerField()
    battle_number = models.BigIntegerField()
    attacker_king = models.CharField(max_length=100, blank=True, null=True)
    defender_king = models.CharField(max_length=100, blank=True, null=True)
    attacker_1 = models.CharField(max_length=100)
    attacker_2 = models.CharField(max_length=100, blank=True, null=True)
    attacker_3 = models.CharField(max_length=100, blank=True, null=True)
    attacker_4 = models.CharField(max_length=100, blank=True, null=True)
    defender_1 = models.CharField(max_length=100, blank=True, null=True)
    defender_2 = models.CharField(max_length=100, blank=True, null=True)
    defender_3 = models.CharField(max_length=100, blank=True, null=True)
    defender_4 = models.CharField(max_length=100, blank=True, null=True)
    attacker_outcome = models.CharField(max_length=100, blank=True, null=True)
    battle_type = models.CharField(max_length=100, blank=True, null=True)
    major_death = models.CharField(max_length=100, blank=True, null=True)
    major_capture = models.CharField(max_length=100, blank=True, null=True)
    attacker_size = models.BigIntegerField(blank=True, null=True)
    defender_size = models.BigIntegerField(blank=True, null=True)
    attacker_commander = models.CharField(max_length=100,
                                          blank=True, null=True)
    defender_commander = models.CharField(max_length=200,
                                          blank=True, null=True)
    summer = models.CharField(max_length=100,
                              blank=True, null=True)
    location = models.CharField(max_length=100, blank=True, null=True)
    region = models.CharField(max_length=100)
    note = models.CharField(max_length=400, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'battles'

    def __unicode__(self):
        return self.name

    def __str__(self):
        return self.name
