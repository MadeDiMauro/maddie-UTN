from django.urls import path
from .views import agregar_producto_love, quitar_producto_love
from .views import LoveListView

urlpatterns = [
    path('agregar_producto_deseado/<int:producto_id>/', agregar_producto_love, name="agregar_producto_love"),
    path('quitar_producto_deseado/<int:producto_id>/', quitar_producto_love, name="quitar_producto_love"),
    path('mi_lovelist/', LoveListView.as_view(), name='ver_lovelist'),
]