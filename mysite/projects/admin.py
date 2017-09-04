from django.contrib import admin
from django.contrib.sites.requests import RequestSite
from django.contrib.sites.models import Site

from projects.models import Project, Screenshots

class ScreenshotInline(admin.TabularInline):
    model = Screenshots
    extra = 3

class ProjectAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'shortdescription', 'created_date')
    inlines = [ ScreenshotInline, ]

admin.site.register(Project, ProjectAdmin)
