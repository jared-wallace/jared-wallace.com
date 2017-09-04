from django.db import models


class Contact_Information(models.Model):
    class Meta:
        verbose_name = "Contact Information"
        verbose_name_plural = "Contact Information"

    phone = models.CharField(max_length=50, null=True, blank=True)
    office = models.CharField(max_length=100, null=True, blank=True)
    email = models.EmailField(null=True, blank=True)
    github = models.CharField(max_length=50, null=True, blank=True)
    bitbucket = models.CharField(max_length=50, null=True, blank=True)


class Days(models.Model):
    DAY_CHOICES = (
        ('Monday', 'Monday'),
        ('Tuesday', 'Tuesday'),
        ('Wednesday', 'Wednesday'),
        ('Thursday', 'Thursday'),
        ('Friday', 'Friday'),
    )
    days = models.CharField(max_length=10, choices=DAY_CHOICES)
    from_time = models.TimeField()
    to_time = models.TimeField()
    contact = models.ForeignKey(Contact_Information, related_name='days')

