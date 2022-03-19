from django.urls import path
from .views import *

urlpatterns = [
    path('', ProcesarPedido.as_view(), name='procesar_pedido'),
]