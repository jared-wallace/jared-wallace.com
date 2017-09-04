from django.contrib import admin
from labs.models import Class_Section, Section_link, Lab, Quote


class LinkInline(admin.TabularInline):
    model = Section_link
    extra = 3


class SectionAdmin(admin.ModelAdmin):
    list_display = ('name', 'section_number')
    inlines = (LinkInline,)


class LabAdmin(admin.ModelAdmin):
    list_display = ('class_section', 'number', 'title')


class QuoteAdmin(admin.ModelAdmin):
    list_display = ('text', 'author')

admin.site.register(Lab, LabAdmin)
admin.site.register(Class_Section, SectionAdmin)
admin.site.register(Quote, QuoteAdmin)
