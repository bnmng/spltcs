from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('', include('home.urls')),
    path('home/', include('home.urls')),
    path('inventory/', include('inventory.urls')),
    path('entities/', include('entities.urls')),
    path('trouble/', include('trouble.urls')),
    path('maintenance/', include('maintenance.urls')),
    path('accounts/', include('django.contrib.auth.urls')),
    path('login', auth_views.LoginView.as_view(), name='login'),
    path('logout', auth_views.LogoutView.as_view(), name='logout'),
    path('admin/', admin.site.urls, name='admin'),
]

