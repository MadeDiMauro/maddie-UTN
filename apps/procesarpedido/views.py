from django.db.models import Q
from django.contrib import messages #Gestionar los mensajes flash
from django.urls import reverse
from django.utils.decorators import method_decorator
from django.views import View
from django.shortcuts import render, redirect #Redirec para redireccionar y render para renderizar una vista
from django.contrib.auth.decorators import login_required #Decorador para obligar el iniciar sesion
from apps.carrito.cart import Cart #Importamos el carrito
from .funciones import *
# Create your views here.

today = date.today()

#Fecha actual
now = datetime.now()


#Acciones para realizar el pedido

@method_decorator(login_required(login_url='acceder'), name="dispatch")
class ProcesarPedido(View):
    template_name = "pedidos/procesar/procesar-pedido.html"

    def dispatch(self, request, *args, **kwargs):
        paso1 = request.session.get('checkout_paso_1')
        paso2 = request.session.get('checkout_paso_2')
        paso3 = request.session.get('checkout_paso_3')
        items = request.session.get('cantidad_items_carrito')

        if paso1 is True and paso2 is True and paso3 is True and items >= 1:
            return super(ProcesarPedido, self).dispatch(request, *args, **kwargs)
        else:
            return redirect('mi_carrito')

    def get(self, request):
        return redirect('mi_carrito')

    def post(self, request, *args, **kwargs):
        usuario = request.user

        request.session['checkout_paso_1'] = False
        request.session['checkout_paso_2'] = False
        request.session['checkout_paso_3'] = False
        request.session['cantidad_items_carrito'] = False

        #Codigo de descuento
        codigo_descuento = request.session.get('codigo_descuento_id')
        descuento_codigo = request.session.get('valor_descuento_codigo')

        #Giftcard
        detalle_giftcard = request.session.get('detalle_giftcard_id')
        giftcard_valor = request.session.get('detalle_valor_giftcard')
        detalle_nro_tarjeta = request.session.get('detalle_nro_tarjeta')
        detalle_cod_seg = request.session.get('detalle_cod_seg')

        #Variables del pedido
        direccion = request.session.get('direccion_id')
        envio = request.session.get('envio_id')

        #Variables de medio de pago y total carrito
        medio_pago = request.POST.get('mediopago')
        request.session['medio_pago'] = medio_pago
        total_carrito = request.session.get('total_carrito')

        perfil = Perfilusuario.objects.get(usuario_id=usuario)

        print("Codigo de descuento id:",codigo_descuento,' valor de descuento: ',descuento_codigo)
        print("Giftcard id:", detalle_giftcard,' Valor a descontar: ',giftcard_valor)
        print('Dirección id: ', direccion)
        print('Envio id: ', envio)
        print('Medio de pago: ',medio_pago)
        print('Total del carrito normal: ',total_carrito)

        #Hasta aquí terminado, falta seguir verificando el código

        #Código de descuento (Si tiene)
        valor_descuento = existe_codigo_descuento(codigo_descuento)
        if valor_descuento != 0:
            descuento = total_carrito*valor_descuento/100
            total_carrito = total_carrito - (total_carrito*valor_descuento/100)
            codigo_des = Codigodescuento.objects.get(id=codigo_descuento)
        else:
            descuento = 0
            codigo_des = None

        #Giftcard (Si tiene)
        giftcard_descuento = existe_giftcard(detalle_giftcard, detalle_nro_tarjeta, detalle_cod_seg)
        if giftcard_descuento != 0:
            giftcard_des = Detallegiftcard.objects.get(id=detalle_giftcard)
            total_carrito = total_carrito - giftcard_descuento
        else:
            giftcard_des = None

        #Calcular el envio y sumar al carrito
        envio = crear_envio(envio,direccion,perfil.id)
        total_carrito = total_carrito + envio.precio_envio

        request.session['total_carrito'] = total_carrito

        pedido = crear_pedido(perfil, total_carrito,envio,codigo_des, descuento, giftcard_des)

        cart = Cart(request)
        detallepedidos = crear_detalle_pedido(pedido, cart, perfil)

        # enviar correo al cliente
        enviar_email_pedido(
            pedido=pedido,
            detallepedidos=detallepedidos,
            usuario_nombre=request.user.username,
            usuario_email=request.user.email,
        )

        cart.clear()
        # set the order in the session
        request.session['pedido_id'] = pedido.id
        # redirect for payment
        messages.success(request, F'Su pedido fué creado correctamente, verificar su casilla de correo, donde recibirá un mail con el detalle del pedido.', extra_tags='¡Excelente!')
        return redirect('procesar_pago')






