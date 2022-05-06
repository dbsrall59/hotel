<<<<<<< HEAD
"""config URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
=======
>>>>>>> bcb163ffdf3e5ab0e48f38d426227d1108b397b7
from django.urls import path
from . import views

urlpatterns = [
<<<<<<< HEAD
    path('buyer/', views.buyer),
    path('prod/', views.prod),
    path('event/', views.event),
    path('plot/', views.plot),
    path('board_done/', views.board_done),
    path('board_write/', views.board_write),
    path('board/', views.board),
    path('bussiness/', views.bussiness),
    path('deluxe/', views.deluxe),
    path('suite/', views.suite),
    path('twin/', views.twin),
    path('index/', views.index),
    path('hotel_info/', views.hotel_info),
    path('room/', views.room),
    path('reserve/', views.reserve),
    path('reserve_info/', views.reserve_info),
    path('login/', views.login),
    path('join/', views.join),
    path('join_suc/', views.join_suc),
    path('update/', views.update),
    path('update_suc/', views.update_suc),
    path('ad_mem/', views.ad_mem),
    path('ad_room/', views.ad_room),
    path('ad_reserve/', views.ad_reserve),
    
=======
    path('event/',views.event),
    path('prod/',views.prod),
    path('buyer/',views.buyer),
    path('plot/',views.plot),
    path('update_suc/',views.update_suc),
    path('update/',views.update),
    path('board_done/',views.board_done),
    path('board_write/',views.board_write),
    path('join_suc/',views.join_suc),
    path('join/',views.join),
    path('bussiness/',views.bussiness),
    path('deluxe/',views.deluxe),
    path('suite/',views.suite),
    path('twin/',views.twin),
    path('board/',views.board),
    path('reserve/',views.reserve),
    path('reserve_info/',views.reserve_info),
    path('ad_room/',views.ad_room),
    path('board/',views.board),
    path('ad_reserve/',views.ad_reserve),
    path('ad_mem/',views.ad_mem),
    path('login/',views.login),
    path('hotel_info/',views.hotel_info),
    path('room/',views.room),
    path('index/',views.index),
>>>>>>> bcb163ffdf3e5ab0e48f38d426227d1108b397b7
]
