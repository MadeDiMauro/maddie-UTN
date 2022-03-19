from django.urls import path
from .views import *

urlpatterns = [
    path('', ProductosListView.as_view(), name="listado_productos"),
    path('detalle/<int:pk>', ProductoDetailView.as_view(), name="detalle_producto"),
    path('add_producto/<int:producto_id>/', add_producto, name='add_producto'),
    path('decrement_producto/<int:producto_id>/', decrement_producto, name='decrement_producto'),
    path('quitar_producto/<int:producto_id>/', quitar_producto, name='quitar_producto'),
    path('clear/', clear_cart, name='clear_carrito'),
]