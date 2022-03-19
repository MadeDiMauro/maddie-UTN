from django.urls import path
from .views import *

urlpatterns = [
    path('', ProximosPedidosListView.as_view(), name="proximos-pedidos"),
    path('consulta/<int:proxpedido_id>',proximos_pedidos_mensaje, name="consulta-proximos-pedidos"),
]