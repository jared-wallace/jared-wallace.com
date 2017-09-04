from django.conf.urls import url
from my_calendar import views as calendar_views


urlpatterns = [
    url(r'^main/(\d+)/$', calendar_views.main, name="calendar_main"),
    url(r'^main/', calendar_views.main, name="calendar_main"),
    url(r'^month/(\d+)/(\d+)/(prev|next)/$', calendar_views.month, name="calendar_month"),
    url(r'^month/(\d+)/(\d+)/$', calendar_views.month, name="calendar_month"),
    url(r'^month$', calendar_views.month, name="calendar_month"),
    url(r'^day/(\d+)/(\d+)/(\d+)/$', calendar_views.day, name="calendar_day"),
    url(r'^add/(\d+)/(\d+)/(\d+)/$', calendar_views.add, name="calendar_add"),
]
