from django.urls import path
from inventory.views import (ItemCreate, ItemDelete, ItemDetail, ItemAjaxEntity, ItemAjaxSuccessEntity, ItemList, ItemAjaxLocation, ItemAjaxSuccessLocation, ItemAjaxMakeModel, ItemAjaxSuccessMakeModel, ItemAjaxRoles, ItemAjaxSuccessRoles, ItemUpdate, )

urlpatterns = [
    path('', ItemList.as_view(), name='inventory'),
    path('create', ItemCreate.as_view(), name='item-create'),
    path('<int:pk>', ItemDetail.as_view(), name='item-detail'),
    path('<int:pk>/update', ItemUpdate.as_view(), name='item-update'),
    path('<int:pk>/delete', ItemDelete.as_view(), name='item-delete'),
    path('item_ajax_location', ItemAjaxLocation.as_view(), name='item-ajax-location'),
    path('item_ajax_location/<int:pk>', ItemAjaxSuccessLocation.as_view(), name='item-ajaxsuccess-location'),
    path('item_ajax_makemodel', ItemAjaxMakeModel.as_view(), name='item-ajax-makemodel'),
    path('item_ajax_makemodel/<int:pk>', ItemAjaxSuccessMakeModel.as_view(), name='item-ajaxsuccess-makemodel'),
    path('item_ajax_roles', ItemAjaxRoles.as_view(), name='item-ajax-roles'),
    path('item_ajax_roles/<int:pk>', ItemAjaxSuccessRoles.as_view(), name='item-ajaxsuccess-roles'),
    path('item_ajax_entity', ItemAjaxEntity.as_view(), name='item-ajax-entity'),
    path('item_ajax_entity/<int:pk>', ItemAjaxSuccessEntity.as_view(), name='item-ajaxsuccess-entity'),
]

# vim: ai ts=4 sts=4 et sw=4
