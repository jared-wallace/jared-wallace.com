from django.conf.urls import url, include
from django.contrib.auth import views as auth_views
from django.views.generic.base import TemplateView
from accounts import views

urlpatterns = [
    url(r'^login/', auth_views.login, {'template_name': 'accounts/login.html'}, name='login'),
    url(r'^logout/', auth_views.logout, {'next_page': '/'}, name='logout'),
]
