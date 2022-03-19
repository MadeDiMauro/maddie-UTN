from django.urls import path
from .views import *

urlpatterns = [
    path('paso-uno/', checkout_paso_1.as_view(), name='checkout-paso-uno'),
    path('paso-dos/', checkout_paso_2.as_view(), name='checkout-paso-dos'),
    path('paso-tres/', checkout_paso_3.as_view(), name='checkout-paso-tres'),
    path('', cancelar_checkout, name='cancelar_checkout'),
    path('nueva-direccion/',crear_direccion_checkout, name='nueva_direccion_checkout'),
]