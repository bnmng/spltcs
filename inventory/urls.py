from django.urls import path
from inventory.views import (CategoryAjaxMakeModels, CategoryAjaxSuccessMakeModels, CategoryCreate, CategoryDelete, CategoryDetail, CategoryList, CategoryUpdate, ItemAjaxEntity, ItemAjaxLocation, ItemAjaxMakeModel, ItemAjaxRole, ItemAjaxSuccessEntity, ItemAjaxSuccessLocation, ItemAjaxSuccessMakeModel, ItemAjaxSuccessRole, ItemCreate, ItemDelete, ItemDetail, ItemList, ItemUpdate, MakeModelCreate, MakeModelDelete, MakeModelDetail, MakeModelList, MakeModelUpdate, RoleAjaxItems, RoleAjaxSuccessItems, RoleCreate, RoleDelete, RoleDetail, RoleList, RoleUpdate)

urlpatterns = [
    path('', ItemList.as_view(), name='inventory'),
    path('items', ItemList.as_view(), name='item_list'),
    path('create', ItemCreate.as_view(), name='item_create'),
    path('<int:pk>', ItemDetail.as_view(), name='item_detail'),
    path('<int:pk>/update', ItemUpdate.as_view(), name='item_update'),
    path('<int:pk>/delete', ItemDelete.as_view(), name='item_delete'),
    path('item_ajax_location', ItemAjaxLocation.as_view(), name='item_ajax_location'),
    path('item_ajax_location/<int:pk>', ItemAjaxSuccessLocation.as_view(), name='item_ajaxsuccess_location'),
    path('item_ajax_makemodel', ItemAjaxMakeModel.as_view(), name='item_ajax_makemodel'),
    path('item_ajax_makemodel/<int:pk>', ItemAjaxSuccessMakeModel.as_view(), name='item_ajaxsuccess_makemodel'),
    path('item_ajax_role', ItemAjaxRole.as_view(), name='item_ajax_role'),
    path('item_ajax_role/<int:pk>', ItemAjaxSuccessRole.as_view(), name='item_ajaxsuccess_role'),
    path('item_ajax_entity', ItemAjaxEntity.as_view(), name='item_ajax_entity'),
    path('item_ajax_entity/<int:pk>', ItemAjaxSuccessEntity.as_view(), name='item_ajaxsuccess_entity'),

    path('categories', CategoryList.as_view(), name='category_list'),
    path('category/create', CategoryCreate.as_view(), name='category_create'),
    path('category/<int:pk>', CategoryDetail.as_view(), name='category_detail'),
    path('category/<int:pk>/update', CategoryUpdate.as_view(), name='category_update'),
    path('category/<int:pk>/delete', CategoryDelete.as_view(), name='category_delete'),
    path('category_ajax_makemodels', CategoryAjaxMakeModels.as_view(), name='category_ajax_makemodels'),
    path('category_ajax_makemodels/<int:pk>', CategoryAjaxSuccessMakeModels.as_view(), name='category_ajaxsuccess_makemodels'),

    path('roles', RoleList.as_view(), name='role_list'),
    path('role/create', RoleCreate.as_view(), name='role_create'),
    path('role/<int:pk>', RoleDetail.as_view(), name='role_detail'),
    path('role/<int:pk>/update', RoleUpdate.as_view(), name='role_update'),
    path('role/<int:pk>/delete', RoleDelete.as_view(), name='role_delete'),
    path('role_ajax_items', RoleAjaxItems.as_view(), name='role_ajax_items'),
    path('role_ajax_items/<int:pk>', RoleAjaxSuccessItems.as_view(), name='role_ajaxsuccess_items'),

    path('makemodels', MakeModelList.as_view(), name='makemodel_list'),
    path('makemodel/create', MakeModelCreate.as_view(), name='makemodel_create'),
    path('makemodel/<int:pk>', MakeModelDetail.as_view(), name='makemodel_detail'),
    path('makemodel/<int:pk>/update', MakeModelUpdate.as_view(), name='makemodel_update'),
    path('makemodel/<int:pk>/delete', MakeModelDelete.as_view(), name='makemodel_delete'),
]

# vim: ai ts=4 sts=4 et sw=4
