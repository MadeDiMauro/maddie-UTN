from datetime import date
from datetime import datetime
from django.contrib import messages #Gestionar los mensajes flash
from django.urls import reverse
from django.utils.decorators import method_decorator
from django.views import View
from django.shortcuts import render, redirect #Redirec para redireccionar y render para renderizar una vista
from django.contrib.auth.decorators import login_required #Decorador para obligar el iniciar sesion
from django.views.generic.list import ListView #Permite definir una funcion, que nos va a permitir sacar una info como listado
from django.views.generic import DetailView #Permite crear una pagina de detalle
from .models import Pedido, Token, Detallepedido, Detallepedidogiftcard #Importamos los modelos
from .cart import Cart #Importamos el carrito
from apps.checkout.views import inicializar_variables_session
from apps.productos.models import Producto
from apps.combinacion.models import Combo
from apps.giftcard.models import Giftcard, Detallegiftcard
from .funciones import enviar_email_pedido_cancelado

#Día actual
today = date.today()

#Fecha actual
now = datetime.now()



#Listado de pedidos de un usuario y el detalle correspondiente

@method_decorator(login_required(login_url='acceder'), name="dispatch")
class pedido_listado(ListView):
    model = Pedido
    ordering = ["-id"]
    template_name = "pedidos/listado.html"

    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset.filter(usuario=self.request.user)


@method_decorator(login_required(login_url='acceder'), name="dispatch")
class pedido_detalle(DetailView):
    model = Pedido
    template_name = 'pedidos/detalle.html'

    def get_queryset(self):
        queryset = super().get_queryset()
        query = queryset.filter(usuario=self.request.user)
        print(query)
        return queryset.filter(usuario=self.request.user)


#Vistas del shopping y de mi carrito
def index(request):
    inicializar_variables_session(request)
    return render(request, "carrito/index.html")


def micarrito(request):
    inicializar_variables_session(request)
    cart = Cart(request)
    total = 0.0
    cantidad_items = 0

    for key, value in request.session['cart'].items():
        total = total + (float(value['precio']) * value['cantidad'])
        cantidad_items = cantidad_items + value['cantidad']

    if cantidad_items >= 1:
        request.session['checkout_paso_1'] = True
        request.session['cantidad_items_carrito'] = cantidad_items
    return render(request, 'carrito/micarrito.html')


class ValidarToken(View):
    def dispatch(self, request, *args, **kwargs):
        return super(ValidarToken, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        print('Llegó a obtener link token :)')
        token = request.GET.get('token')
        is_valid = Token.objects.filter(token=token).exists()
        if is_valid:
            token = Token.objects.get(token=token)
            request.session['token_id'] = token.id
            if token.evento == 'recepcion_pedido':
                return redirect(reverse('recepcionar_pedido'))
            if token.evento == 'giftcards_asociados':
                return redirect(reverse('validar_giftcard'))
            if token.evento == 'ver_pedido':
                return redirect(reverse('ver_pedido'))
        else:
            messages.error(request, 'Error en el token', extra_tags='Error')
            return redirect('listado_productos')

class RecepcionarPedido(View):
    def dispatch(self, request, *args, **kwargs):
        return super(RecepcionarPedido, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        token_id = request.session.get('token_id')
        token = Token.objects.get(id=token_id)
        request.session['token_id'] = None
        pedido = Pedido.objects.get(id=token.pedido.id)
        if pedido.recibido == False:
            pedido.recibido = True
            pedido.save()
            messages.success(request, 'Tu pedido fué marcado como recibido, gracias por informarnos. Vuelve pronto!', extra_tags='¡Pedido recibido! :D')
        else:
            messages.info(request, 'Tu pedido ya fué marcado como recibido.',
                             extra_tags='Recepción de pedido ya informada')
        return redirect('listado_productos')


class VerPedido(View):
    def dispatch(self, request, *args, **kwargs):
        token_id = request.session.get('token_id')
        token = Token.objects.filter(id=token_id)
        if token:
            token = Token.objects.get(id=token_id)
            pedido = Pedido.objects.filter(id=token.pedido.id)
        else:
            token = None
            pedido = None

        if token and pedido:
            return super(VerPedido, self).dispatch(request, *args, **kwargs)
        else:
            return redirect('listado_productos')


    def get(self, request, *args, **kwargs):
        token_id = request.session.get('token_id')
        token = Token.objects.get(id=token_id)
        request.session['token_id'] = None
        pedido = Pedido.objects.get(id=token.pedido.id)
        detallepedido = Detallepedido.objects.filter(pedido=pedido)
        request.session['checkout_paso_pago'] = True
        request.session["pedido_id"] = pedido.id
        return render(request, 'pedidos/verpedido/ver_pedido.html', {'pedido':pedido, 'detallepedido':detallepedido})


@method_decorator(login_required(login_url='acceder'), name="dispatch")
class VerPedidoDesdeMiCuenta(View):
    def dispatch(self, request, *args, **kwargs):
        id = kwargs.get('id')
        pedido = Pedido.objects.filter(id=id)
        if pedido:
            return super(VerPedidoDesdeMiCuenta, self).dispatch(request, *args, **kwargs)
        else:
            return redirect('mi_cuenta')

    def get(self, request, *args, **kwargs):
        id = kwargs.get('id')
        pedido = Pedido.objects.get(id=id)
        detallepedido = Detallepedido.objects.filter(pedido=pedido)
        request.session['checkout_paso_pago'] = True
        request.session["pedido_id"] = pedido.id
        return render(request, 'pedidos/verpedido/ver_pedido.html', {'pedido':pedido, 'detallepedido':detallepedido})


@method_decorator(login_required(login_url='acceder'), name="dispatch")
class CancelarPedido(View):
    def dispatch(self, request, *args, **kwargs):
        id = kwargs.get('id')
        pedido = Pedido.objects.filter(id=id)
        if pedido:
            return super(CancelarPedido, self).dispatch(request, *args, **kwargs)
        else:
            return redirect('listado_productos')

    def get(self, request, *args, **kwargs):
        id = kwargs.get('id')
        pedido = Pedido.objects.get(id=id)
        detalle = Detallepedido.objects.filter(pedido=pedido)
        for d in detalle:
            if d.tipo_detalle == 'producto':
                detallep = Detallepedido.objects.get(id=d.id)
                producto = Producto.objects.get(id=detallep.producto.id)
                nstock = producto.stock + detallep.cantidad
                producto.stock = nstock
                producto.save()
            if d.tipo_detalle == 'combo':
                detallep = Detallepedido.objects.get(id=d.id)
                combo = Combo.objects.get(id=detallep.combo.id)
                nstock = combo.stock + detallep.cantidad
                combo.stock = nstock
                combo.save()
            if d.tipo_detalle == 'giftcard':
                detallep = Detallepedido.objects.get(id=d.id)
                giftcard = Giftcard.objects.get(id=detallep.giftcard.id)
                nstock = giftcard.stock + detallep.cantidad
                giftcard.stock = nstock
                giftcard.save()

        detalleg = Detallepedidogiftcard.objects.filter(pedido=pedido)
        for dg in detalleg:
            dgiftcard = Detallegiftcard.objects.get(id=dg.detallegift.id)
            dgiftcard.delete()

        pedido.estado = 'cancelado'
        pedido.pago.estado = 'rechazado'
        pedido.pago.confirmado = False
        pedido.save()

        enviar_email_pedido_cancelado(pedido=pedido)
        messages.success(request, 'Tu pedido fué cancelado lamentablemente, ¡te esperamos en la próxima!. Muchas gracias', extra_tags='Pedido cancelado :(')
        return redirect('listado_productos')