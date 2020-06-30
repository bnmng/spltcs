from django.urls import path
from .views import (TicketCreate, TicketDelete, TicketDetail, TicketList, TicketUpdate)

urlpatterns = [
    path('', TicketList.as_view(), name='trouble'),
    path('tickets', TicketList.as_view(), name='ticket_list'),
    path('create', TicketCreate.as_view(), name='ticket_create'),
    path('<int:pk>', TicketDetail.as_view(), name='ticket_detail'),
    path('<int:pk>/update', TicketUpdate.as_view(), name='ticket_update'),
    path('<int:pk>/delete', TicketDelete.as_view(), name='ticket_delete'),

]

# vim: ai ts=4 sts=4 et sw=4
