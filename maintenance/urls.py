from django.urls import path
from .views import (ActionList, JobList)

urlpatterns = [
    path('actions', ActionList.as_view(), name='actions'),
#    path('actions/create', ActionCreate.as_view(), name='action_create'),
#    path('actions/detail', ActionDetail.as_view(), name='action_detail'),
#    path('actions/update', ActionUpdate.as_view(), name='action_update'),
#    path('jobs', JobList.as_view(), name='maintenance_jobs'),
]

# vim: ai ts=4 sts=4 et sw=4
