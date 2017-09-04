from django.conf.urls import url
from projects import views as projects_views

urlpatterns = [
    url(r'^list/(?P<type>(?:(?:\bpersonal\b)|(?:\bwork\b)|(?:\bschool\b)))/$', projects_views.list, name="list"),
    url(r'^detail/(?P<id>\d*)/', projects_views.detail, name="detail"),
    url(r'^index/', projects_views.index, name="projects_index"),
]
