from django.urls import path
from . import views

urlpatterns = [
    path('procesar/', views.procesar_pago, name='procesar_pago'),
    path('cancelado/', views.PagoCancelado.as_view(), name='pago_cancelado'),
    path('pendiente/', views.PagoPendiente.as_view(), name='pago_pendiente'),
    path('exitoso/', views.PagoRecibido.as_view(), name='pago_exitoso'),
    path('mercado-pago/', views.MercadoPagoCheckout.as_view(), name='mercadopago'),
    path('transferencia/', views.Transferencia.as_view(), name="transferencia")
]