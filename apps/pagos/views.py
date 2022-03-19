from django.http import HttpResponseRedirect
from django.shortcuts import render
# Create your views here.
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from maddie.settings import BASE_URL
from django.views import View
from django.utils.decorators import method_decorator
from datetime import datetime
from django.urls import reverse
from django.shortcuts import render, redirect, get_object_or_404
from django.conf import settings
from django.contrib import messages
from apps.carrito.models import Pedido, Pago, Detallepedido, Detallepedidogiftcard
from mercadopago import MP, mercadopago
from django.contrib.auth.decorators import login_required
from apps.carrito.models import Token
from .funciones import *


#Fecha actual


@login_required(login_url="acceder")
def procesar_pago(request):
    pedido_id = request.session.get('pedido_id')
    medio_pago = request.session.get('medio_pago')
    pedido = get_object_or_404(Pedido, id=pedido_id)
    request.session["total_carrito"] = pedido.montofinal

    if medio_pago == 'mercadopago':
        request.session['checkout_paso_pago'] = True
        return redirect(reverse('mercadopago'))
    else:
        request.session['checkout_paso_pago'] = True
        return redirect(reverse('transferencia'))



@method_decorator(login_required(login_url='acceder'), name="dispatch")
class PagoRecibido(View):
    def dispatch(self, request, *args, **kwargs):
        paso_pago = request.session.get('checkout_paso_pago')

        if paso_pago is False:
            return redirect('carrito')

        if paso_pago is True:
            return super(PagoRecibido, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        pedido = Pedido.objects.get(id=request.session["pedido_id"])
        now = datetime.now()
        estado = request.GET['status']
        if estado == 'approved':
            estado = 'aprobado'
        else:
            estado = 'pendiente'
        tipo_pago = request.GET['payment_type']
        id_pago = request.GET['payment_id']
        url = request.session.get('url_mp')

        print(estado)
        print(tipo_pago)
        pago = Pago.objects.create(formapago='mercadopago', tipopago=tipo_pago,id_pagomp=id_pago, url_mp=url, fechapago=now, confirmado=True, estado=estado)
        request.session['url_mp'] = None
        pedido.pago = pago
        pedido.estado = 'pendiente'
        pedido.save()

        #Cuando se concreta el pago se envian los giftcards al usuario asociado
        detalle = Detallepedidogiftcard.objects.filter(pedido=pedido)
        if detalle:
            token_generator = PasswordResetTokenGenerator()
            token = token_generator.make_token(pedido.usuario)
            url = BASE_URL + '/validar/token?token=' + str(token)
            Token.objects.create(usuario=pedido.usuario, token=token, pedido=pedido, evento='giftcards_asociados')

            enviar_email_giftcards(user=pedido.usuario,
                                   pedido=pedido,
                                   token=url)

        #Generación de token para mostrar pedido en email
        token_generator = PasswordResetTokenGenerator()
        token = token_generator.make_token(pedido.usuario)
        url = BASE_URL + '/validar/token?token=' + str(token)
        Token.objects.create(usuario=pedido.usuario, token=token, pedido=pedido, evento='ver_pedido')
        enviar_email_pago_recibido(pedido=pedido, token=url)

        messages.success(request, F'Excelente, tu pedido fue creado y el pago fué recibido, gracias por tu compra, te enviamos un email con el detalle de tu pedido.', extra_tags='¡Excelente pago recibido!')
        request.session['checkout_paso_pago'] = False

        return render(request, 'pagos/recibido.html', {'pedido':pedido})



@method_decorator(login_required(login_url='acceder'), name="dispatch")
class PagoPendiente(View):
    def dispatch(self, request, *args, **kwargs):
        paso_pago = request.session.get('checkout_paso_pago')

        if paso_pago is False:
            return redirect('carrito')

        if paso_pago is True:
            return super(PagoPendiente, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        pedido = Pedido.objects.get(id=request.session["pedido_id"])
        now = datetime.now()
        estado = request.GET['status']
        if estado == 'in_process' or estado == 'pending':
            estado = 'pendiente'
        tipo_pago = request.GET['payment_type']
        id_pago = request.GET['payment_id']
        if id_pago == None:
            id_pago = None

        url = request.session.get('url_mp')
        print(estado)
        print(tipo_pago)
        pago = Pago.objects.create(formapago='mercadopago', tipopago=tipo_pago, id_pagomp=id_pago, url_mp=url,fechapago=now,
                                   confirmado=False, estado=estado)
        request.session['url_mp'] = None
        pedido.pago = pago
        pedido.estado = 'pendiente'
        pedido.envio.estado = False
        pedido.save()
        messages.info(request,
                         F'Tu pedido fue creado y el pago tiene estado pendiente, debes esperar hasta que acredite el mismo, te enviamos un email con el detalle de tu pedido.',
                         extra_tags='Tu pedido está pendiente de pago')
        request.session['checkout_paso_pago'] = False
        return render(request, 'pagos/pendiente.html', {'pedido': pedido})



@method_decorator(login_required(login_url='acceder'), name="dispatch")
class PagoCancelado(View):
    def dispatch(self, request, *args, **kwargs):
        paso_pago = request.session.get('checkout_paso_pago')

        if paso_pago is False:
            return redirect('carrito')

        if paso_pago is True:
            return super(PagoCancelado, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        pedido = Pedido.objects.get(id=request.session["pedido_id"])
        now = datetime.now()
        estado = request.GET['status']
        if estado == None:
            estado = 'pendiente'
        else:
            estado = 'pendiente'
        tipo_pago = request.GET['payment_type']
        id_pago = request.GET['payment_id']
        if id_pago == None:
            id_pago = None

        url = request.session.get('url_mp')
        print(estado)
        print(tipo_pago)
        pago = Pago.objects.create(formapago='mercadopago', tipopago=tipo_pago, id_pagomp=id_pago, url_mp=url,fechapago=now,
                                   confirmado=False, estado=estado)
        request.session['url_mp'] = None
        pedido.pago = pago
        pedido.estado = 'pendiente'
        pedido.envio.estado = False
        pedido.save()
        messages.error(request,
                      F'Tu pago fué cancelado y tu pedido está pendiente de pago.',
                      extra_tags='Pedido pendiente de pago')
        request.session['checkout_paso_pago'] = False
        return render(request, 'pagos/cancelado.html', {'pedido': pedido})



@method_decorator(login_required(login_url='acceder'), name="dispatch")
class MercadoPagoCheckout(View):
    def dispatch(self, request, *args, **kwargs):
        paso_pago = request.session.get('checkout_paso_pago')

        if paso_pago is False:
            return redirect('carrito')

        if paso_pago is True:
            return super(MercadoPagoCheckout, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        user = request.user
        pedido = Pedido.objects.get(id=request.session["pedido_id"])

        preference = {
            "items": [
                {
                    "title": "Pedido de Maddie N°"+str(pedido.id),
                    "quantity": 1,
                    "currency_id": "ARS",
                    "unit_price": pedido.montofinal,
                }
            ],
            "external_reference": str(pedido.id),
            "payer": {
                "name": str(pedido.usuario.first_name),
                "surname": str(pedido.usuario.last_name),
                "email": 'test_user_97855138@testuser.com',
            },
            'back_urls':{
                'success': "http://127.0.0.1:8000/pagos/exitoso",
                'failure': "http://127.0.0.1:8000/pagos/cancelado",
                'pending': "http://127.0.0.1:8000/pagos/pendiente",
            },
            'auto_return':"approved",
        }

        #mp = mercadopago.MP("8618466623375421", "d0pMC6wbH7KonhNINa0tSgswuWWqYnqB")
        #mp = mercadopago.MP("APP_USR-8618466623375421-120123-46e8edfe5d7fe4ed34f8fcf7da063ff1-508682700")

        #Credenciales de usuario de prueba vendedor
        mp = mercadopago.MP("3882908324053954", "cbwYi6oSHPlKsJF2FDYUO9MtrOMazTng")
        mp.sandbox_mode(enable=False)
        preferenceResult = mp.create_preference(preference)
        print(preferenceResult)
        url = preferenceResult["response"]["init_point"]
        request.session['url_mp'] = url
        request.session['checkout_paso_pago'] = True
        return redirect(url)
        #return render(request,"pagos/mercado-pago/mercado-pago.html",{"url":url})




@method_decorator(login_required(login_url='acceder'), name="dispatch")
class  Transferencia(View):
    def dispatch(self, request, *args, **kwargs):
        paso_pago = request.session.get('checkout_paso_pago')

        if paso_pago is False:
            return redirect('carrito')

        if paso_pago is True:
            return super(Transferencia, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        pedido = Pedido.objects.get(id=request.session["pedido_id"])
        now = datetime.now()
        pago = Pago.objects.create(formapago='transferencia', tipopago='cbu', id_pagomp=None, url_mp=None,
                               fechapago=now,
                               confirmado=False, estado='pendiente')
        pedido.pago = pago
        pedido.estado = 'pendiente'
        pedido.envio.estado = False
        pedido.save()
        messages.success(request,
                   F'Tu pedido ha sido creado correctamente, queda pendiente de pago por transferencia cbu',
                   extra_tags='Tu pedido fué creado')
        request.session['checkout_paso_pago'] = False
        enviar_email_transferencia(
            pedido=pedido,
            usuario_nombre=request.user.username,
            usuario_email=request.user.email,
        )
        return render(request, "pagos/transferencia/datos-transferencia.html", {'pedido':pedido})


