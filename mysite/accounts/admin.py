from django.contrib import admin
from accounts.models import Contact_Information, Days


class ContactInline(admin.TabularInline):
    model = Days
    extra = 3


class ContactAdmin(admin.ModelAdmin):
    list_display = ('phone', 'office', 'email', 'github', 'bitbucket')
    inlines = (ContactInline,)


admin.site.register(Contact_Information, ContactAdmin)
