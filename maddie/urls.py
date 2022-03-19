"""maddie URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
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
""" from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
] """

from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include("apps.carrito.urls")),
    path('autenticacion/', include("apps.autenticacion.urls")),
    path('productos/', include("apps.productos.urls")),
    path('filtrar/', include("apps.categorizacion.urls")),
    path('combos/', include("apps.combinacion.urls")),
    path('deseados/', include("apps.deseadoslove.urls")),
    path('envios/', include("apps.envio.urls")),
    path('pagos/', include("apps.pagos.urls")),
    path('giftcard/', include("apps.giftcard.urls")),
    path('envio/', include("apps.envio.urls")),
    path('como-comprar/', include("apps.comocomprar.urls")),
    path('test-producto/', include("apps.testproducto.urls")),
    path('preguntas-frecuentes/',include("apps.pfrecuentes.urls")),
    path('proximos-pedidos/',include("apps.proxpedidos.urls")),
    path('recomendados/', include("apps.recomendados.urls")),
    path('procesar-pedido/', include("apps.procesarpedido.urls")),
    path('checkout/', include("apps.checkout.urls")),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)