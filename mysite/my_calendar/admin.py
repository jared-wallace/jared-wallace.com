from django.contrib import admin
from django.contrib.sites.requests import RequestSite
from django.contrib.sites.models import Site

from my_calendar.models import Entry

class EntryAdmin(admin.ModelAdmin):
    list_display = ('title', 'snippet', 'date')

admin.site.register(Entry, EntryAdmin)
