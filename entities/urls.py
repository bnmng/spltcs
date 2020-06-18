from django.urls import path
from .views import (EntityList, EntityCreate, EntityUpdate, EntityDelete, EntityDetail, EntityAjaxRoll, EntityAjaxSuccessRoll, RollList, RollCreate, RollUpdate, RollDelete, RollDetail,)

urlpatterns = [
    path('', EntityList.as_view(), name='entities'),
    path('entities', EntityList.as_view(), name='entity_list'),
    path('entity/create', EntityCreate.as_view(), name='entity_create'),
    path('entity/<int:pk>', EntityDetail.as_view(), name='entity_detail'),
    path('entity/<int:pk>/update', EntityUpdate.as_view(), name='entity_update'),
    path('entity/<int:pk>/delete', EntityDelete.as_view(), name='entity_delete'),
    path('entity_ajax_roll', EntityAjaxRoll.as_view(), name='entity_ajax_roll'),
    path('entity_ajax_roll/<int:pk>', EntityAjaxSuccessRoll.as_view(), name='entity_ajaxsuccess_roll'),

    path('rolls', RollList.as_view(), name='roll_list'),
    path('roll/create', RollCreate.as_view(), name='roll_create'),
    path('roll/<int:pk>', RollDetail.as_view(), name='roll_detail'),
    path('roll/<int:pk>/update', RollUpdate.as_view(), name='roll_update'),
    path('roll/<int:pk>/delete', RollDelete.as_view(), name='roll_delete'),

]

# vim: ai ts=4 sts=4 et sw=4
