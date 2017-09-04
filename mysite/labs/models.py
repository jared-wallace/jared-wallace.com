from django.db import models
from random import randint
from django.db.models import Count


class Class_Section(models.Model):
    class Meta:
        verbose_name = "Course section"
        verbose_name_plural = "Sections"
    DAY_CHOICES = (
        ('Monday', 'Monday'),
        ('Tuesday', 'Tuesday'),
        ('Wednesday', 'Wednesday'),
        ('Thursday', 'Thursday'),
        ('Friday', 'Friday'),
        )
    day = models.CharField(max_length=10, choices=DAY_CHOICES)
    time = models.TimeField()
    name = models.CharField(max_length=50)
    description = models.TextField()
    section_number = models.IntegerField()
    room = models.CharField(max_length=20, null=True, blank=True)
    syllabus = models.FileField(upload_to='labfiles', blank=True, null=True)
    style = models.FileField(upload_to='labfiles', blank=True, null=True)

    def __unicode__(self):
        return self.name

class Section_link(models.Model):
    class Meta:
        verbose_name = "Link"
        verbose_name_plural = "Links"
    url = models.CharField(max_length=300,null=True, blank=True)
    title = models.CharField(max_length=50,null=True, blank=True)
    section = models.ForeignKey(Class_Section, null=True, related_name="link")

    def __unicode__(self):
        return self.title


class Lab(models.Model):
    number = models.IntegerField()
    title = models.TextField()
    description = models.TextField()
    labfile = models.FileField(upload_to='labfiles', blank=True, null=True)
    adminfile = models.FileField(upload_to='labfiles', blank=True, null=True)
    class_section = models.ForeignKey(Class_Section, related_name='section')
    date = models.DateField(blank=True, null=True)
    visible = models.BooleanField()
    solution_visible = models.BooleanField(default=False)

    def __unicode__(self):
        return self.title


class QuoteManager(models.Manager):
    def random(self):
        count = self.aggregate(count=Count('id'))['count']
        random_index = randint(0, count - 1)
        return self.all()[random_index]


class Quote(models.Model):
    class Meta:
        verbose_name = "Quote"
        verbose_name_plural = "Quotes"
    text = models.TextField(null=True, blank=True)
    author = models.CharField(max_length=100, blank=True, null=True)
    objects = QuoteManager()

    def __unicode__(self):
        return self.author
