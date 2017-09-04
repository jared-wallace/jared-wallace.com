from django.conf.urls import url
from labs import views

urlpatterns = [
    url(r'^home/$', views.lab_home, name='lab_home'),
    url(r'^section/(?P<section_id>\d*)', views.section_home, name='section'),
    url(r'^section_schedule/(?P<section_id>\d*)', views.schedule, name='section_schedule'),
    url(r'^detail/(?P<lab_id>\d*)', views.lab_detail, name='lab_detail'),
]
