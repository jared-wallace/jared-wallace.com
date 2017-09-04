from django.conf.urls import include, url
from base import views as base_views

urlpatterns = [
    url(r'^about/', base_views.about, name="about"),
]
