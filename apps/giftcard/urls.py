
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from .views import *

urlpatterns = [
    path('add_giftcard/<int:giftcard_id>/', add_giftcard , name='add_giftcard'),
    path('decrement_giftcard/<int:giftcard_id>/', decrement_giftcard, name='decrement_giftcard'),
    path('quitar_giftcard/<int:giftcard_id>/', quitar_giftcard, name='quitar_giftcard'),
    path('giftcards/',GiftcardListView.as_view(), name="listado_giftcards"),
    path('detalle/<int:pk>', GiftcardDetailView.as_view(), name="detalle_giftcard"),
    path('validar-giftcard/', ValidarGiftcard.as_view(), name='validar_giftcard'),
    path('enviar-giftcard/<int:giftcard_id>', FormularioEnviarAmigo.as_view(), name='enviar_amigo_giftcard')
]
