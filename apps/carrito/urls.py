from django.contrib.auth.decorators import login_required
from django.urls import path
from .views import *



urlpatterns = [
    path('', index, name="carrito"),
    path('micarrito/', micarrito, name="mi_carrito"),

    path('cancelar-pedido/<int:id>', CancelarPedido.as_view(), name='cancelar-pedido'),
    path('pedido/<int:id>',VerPedidoDesdeMiCuenta.as_view(), name='ver_pedido_mi_cuenta'),
    path('ver-pedido/',VerPedido.as_view(), name='ver_pedido'),
    path('recepcion-pedido/',RecepcionarPedido.as_view(), name='recepcionar_pedido'),
    path('validar/token', ValidarToken.as_view(), name='validar_token'),
    path('mis_pedidos/', login_required(pedido_listado.as_view(), login_url='acceder'), name='pedido_listado'),
    path('<int:pk>', login_required(pedido_detalle.as_view(), login_url='acceder'), name='pedido_detalle'),

]
