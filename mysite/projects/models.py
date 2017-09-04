from django.db import models
from datetime import datetime

class Project(models.Model):
    title = models.CharField(max_length=200)
    created_date = models.DateTimeField(default=datetime.now)
    shortdescription = models.CharField(max_length=200)
    fulldescription = models.TextField(max_length=5000)
    binaryfile = models.FileField(upload_to='projects', blank=True, null=True)
    sourcefile = models.FileField(upload_to='projects', blank=True, null=True)
    language = models.CharField(max_length=20)
    CLASSIFICATION_CHOICES = (
	('work', 'Work'),
	('personal', 'Personal'),
	('school', 'School'),
    )
    classification = models.CharField(
	max_length=8,
	choices=CLASSIFICATION_CHOICES
    )
    def __unicode__(self):
        return self.title

class Screenshots(models.Model):
    project = models.ForeignKey(Project, related_name='images')
    image = models.ImageField(upload_to='projects')
