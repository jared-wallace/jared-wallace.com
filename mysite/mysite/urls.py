from django.conf.urls import include, url
from django.contrib import admin
from accounts import views as accounts_views
from base import views as base_views

urlpatterns = [
    url(r'^accounts/', include('accounts.urls')),
    url(r'^contact/', accounts_views.contact, name="contact"),
    url(r'^grappelli/', include('grappelli.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^about/', base_views.about, name="about"),
    url(r'^projects/', include('projects.urls')),
    url(r'^calendar/', include('my_calendar.urls')),
    url(r'^labs/', include('labs.urls')),
    url(r'^', include('password_reset.urls')),
    url(r'^ks/', base_views.ks, name="ks"),
    url(r'^noemi/', base_views.noemi, name="noemi"),
    url(r'^$', base_views.index, name="index"),
]
