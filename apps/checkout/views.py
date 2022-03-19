from datetime import date
from django.db.models import Q
from django.shortcuts import render, redirect, reverse
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.views import View
from apps.carrito.cart import Cart
from .forms import *
from apps.autenticacion.models import Direcciones
from apps.giftcard.models import Codigodescuento, Giftcard, Detallegiftcard
from apps.autenticacion.forms import FormularioDireccion
today = date.today()

def inicializar_variables_session(request):
    request.session['codigo_descuento_id'] = None
    request.session['valor_descuento_codigo'] = None
    request.session['detalle_giftcard_id'] = None
    request.session['detalle_valor_giftcard'] = None
    request.session['direccion_id'] = None
    request.session['envio_id'] = None
    request.session['medio_pago'] = None
    request.session['total_carrito'] = None
    request.session['cantidad_items_carrito'] = 0
    request.session['checkout_paso_1'] = False
    request.session['checkout_paso_2'] = False
    request.session['checkout_paso_3'] = False
    request.session['checkout_paso_pago'] = False
    request.session['token_id'] = None

@login_required(login_url='acceder')
def crear_direccion_checkout(request):
    usuario = request.user

    if request.method == 'POST':
        perfilu = Perfilusuario.objects.get(usuario=usuario)
        form = FormularioDireccion(request.POST)
        if form.is_valid():
            perfil = form.save(commit=False)
            perfil.usuario = perfilu
            perfil.save()
            messages.success(request, F'Los datos fueron enviados correctamente. Debes volver a realizar el proceso de checkout.',
                             extra_tags='Excelente')
        return redirect('mi_carrito')
    else:

        form = FormularioDireccion()
        return render(request, "autenticacion/forms/crear_direccion.html", {"form": form})


@login_required(login_url='acceder')
def cancelar_checkout(request):
    inicializar_variables_session(request)
    messages.info(request, F'El proceso de checkout fué cancelado correctamente.', extra_tags='Checkout cancelado')

    return redirect('listado_productos')



# Create your views here.
@method_decorator(login_required(login_url='acceder'), name="dispatch")
class checkout_paso_1(View):
    template_name = "pedidos/paso-1.html"
    def dispatch(self, request, *args, **kwargs):
        paso_1 = request.session.get('checkout_paso_1')
        paso_2 = request.session.get('checkout_paso_2')
        paso_3 = request.session.get('checkout_paso_3')

        if paso_1 is False and request.session.get('cantidad_items_carrito') == 0:
            return redirect('mi_carrito')

        if paso_1 is False and request.session.get('cantidad_items_carrito') >= 1:
            return super(checkout_paso_1, self).dispatch(request, *args, **kwargs)

        if paso_3 is True and paso_2 is True and paso_1 is True:
            redirect('checkout-paso-tres')

        if paso_2 is True and paso_3 is False:
            redirect('checkout-paso-dos')

        return super(checkout_paso_1, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        inicializar_variables_session(request)

        cart = Cart(request)
        total = 0.0
        cantidad_items = 0

        for key, value in request.session['cart'].items():
            total = total + (float(value['precio']) * value['cantidad'])
            cantidad_items = cantidad_items + value['cantidad']

        if cantidad_items >=1:
            request.session['checkout_paso_1'] = True
            request.session['checkout_paso_2'] = False
            request.session['checkout_paso_3'] = False

        request.session['total_carrito'] = total
        request.session['cantidad_items_carrito'] = cantidad_items

        print('Valor del carrito al inicio: ',request.session.get('total_carrito'))

        ban_cod = False
        ban_gif = False
        form = FormPaso1()
        return render(request, self.template_name, {'form':form, 'ban_cod':ban_cod, 'ban_gif':ban_gif})

    def post(self, request, *args, **kwargs):
        form = FormPaso1(request.POST)
        ban_cod = False
        ban_gif = False
        ban_falso = False

        if form.is_valid():
            codigo = form.cleaned_data['coddescuento']
            giftcard = form.cleaned_data['nrotarjetagiftcard']
            codgiftcard = form.cleaned_data['codseggiftcard']
            print(codigo, giftcard)

            total_carrito = request.session.get('total_carrito')


            if codigo:
                buscar_descuento = Codigodescuento.objects.filter(codigo__exact=codigo)

                if buscar_descuento:
                    codigo_descuento = Codigodescuento.objects.get(codigo=codigo)

                    if today >= codigo_descuento.fecha_inicio and today <= codigo_descuento.fecha_fin:
                        porcentaje = total_carrito * codigo_descuento.valor / 100
                        porc_carrito = porcentaje * 100 / total_carrito
                        if porc_carrito <= 50:
                            messages.success(request, 'El código/cupón es válido, fué aplicado en tu pedido', extra_tags='Cupón válido')
                            ban_cod = True
                            request.session['codigo_descuento_id'] = codigo_descuento.id
                            request.session['valor_descuento_codigo'] = int(porcentaje)
                        else:
                            messages.error(request,
                                           'El código/cupón es válido, pero no fué aplicado en tu pedido, ya que el descuento supera el 50% del monto total del carrito.',
                                           extra_tags='Cupón válido no aplicado')
                            ban_cod = False
                    else:
                        messages.error(request, 'El código/cupón es inválido, no fué aplicado en tu pedido, fuera de fechas',
                                       extra_tags='Cupón inválido')
                        ban_cod = False
                else:
                    messages.error(request, 'El código/cupón es inválido, no fué aplicado en tu pedido',
                                   extra_tags='Cupón inválido')
                    ban_cod = False


            if giftcard and codgiftcard:
                buscar = Detallegiftcard.objects.filter(nro_tarjeta=giftcard, codigo_seguridad=codgiftcard, usado=False)

                if buscar:
                    detalle = Detallegiftcard.objects.get(nro_tarjeta=giftcard, codigo_seguridad=codgiftcard, usado=False)

                    porc_carrito = detalle.giftcard.preciofinal * 100 / total_carrito
                    if porc_carrito <= 50:
                        ban_gif = True
                        messages.success(request, 'El giftcard es válido, fué aplicado en tu pedido',
                                     extra_tags='Giftcard')
                        request.session['detalle_giftcard_id'] = detalle.id
                        request.session['detalle_valor_giftcard'] = int(detalle.giftcard.preciofinal)
                        request.session['detalle_nro_tarjeta'] = detalle.nro_tarjeta
                        request.session['detalle_cod_seg'] = detalle.codigo_seguridad
                    else:
                        messages.error(request,
                                       'El giftcard es inválido, no fué aplicado en tu pedido, verificar nuevamente, el mismo supera el 50% del monto total del carrito.',
                                       extra_tags='Giftcard es inválido')
                        ban_gif = False
                else:
                    messages.error(request, 'El giftcard es inválido, no fué aplicado en tu pedido, verificar nuevamente, el mismo ya fué utilizado o supera el monto del carrito.',
                                   extra_tags='Giftcard es inválido')
                    ban_gif = False

            if ban_cod == False:
                codigo_descuento = {}
                request.session['codigo_descuento_id'] = None
                request.session['valor_descuento_codigo'] = None

            if ban_gif == False:
                detalle = {}
                request.session['detalle_giftcard_id'] = None
                request.session['detalle_valor_giftcard'] = None

            if ban_gif == True and ban_cod == True:
                messages.success(request, 'Los códigos ingresados fueron aplicados en tu pedido',
                                     extra_tags='Excelente: códigos correctos')

            if ban_gif == False and ban_cod == False and codigo == '' and giftcard == '':
                messages.info(request,
                               'No fué aplicado ningun código en tu pedido.',
                               extra_tags='No hay código')


            return render(request, self.template_name, {'form':form, 'ban_cod':ban_cod, 'ban_gif':ban_gif, 'codigo_descuento':codigo_descuento, 'giftcard':detalle})

        else:
            return render(request, self.template_name, {'form':form, 'ban_cod':ban_cod, 'ban_gif':ban_gif})



@method_decorator(login_required(login_url='acceder'), name="dispatch")
class checkout_paso_2(View):
    template_name = "pedidos/paso-2.html"

    def dispatch(self, request, *args, **kwargs):
        paso_1 = request.session.get('checkout_paso_1')
        paso_2 = request.session.get('checkout_paso_2')
        paso_3 = request.session.get('checkout_paso_3')

        if paso_1 is True and paso_2 is False and paso_3 is False:
            return super(checkout_paso_2, self).dispatch(request, *args, **kwargs)

        if paso_1 is False and paso_2 is False and paso_3 is False:
            return redirect('checkout-paso-uno')

        if paso_3 is True and paso_2 is True and paso_3 is True:
            redirect('checkout-paso-tres')

        return super(checkout_paso_2, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        usuario = request.user
        form = FormPaso2()
        ban = False
        direcciones = Direcciones.objects.filter(usuario__usuario=usuario)
        return render(request, self.template_name, {'form':form, 'direcciones':direcciones, 'ban':ban})

    def post(self, request, *args, **kwargs):
        form = FormPaso2(request.POST)
        usuario = request.user
        ban = True
        if form.is_valid():
            codpostal = form.cleaned_data['codpostal']
            transporte = Transporte.objects.filter(
                Q(ciudad__cpostal__codigo__icontains=codpostal) |
                Q(provincia__ciudad__cpostal=codpostal)
            ).distinct()

            if transporte:
                direcciones = Direcciones.objects.filter(usuario__usuario=usuario)
                request.session['checkout_paso_2'] = True
                messages.success(request,
                               F'Excelente, el código postal ingresado es válido.',
                               extra_tags='Código postal encontrado :)')
                return render(request, self.template_name, {'form':form, 'direcciones':direcciones, 'transportes':transporte, 'ban':ban})
            else:
                ban = False
                messages.error(request, F'Lo sentimos, no existen medios de envío para ese código postal, intente con otro código.', extra_tags='Error código postal :(')
                return render(request, self.template_name,
                              {'form': form, 'ban': ban})


@method_decorator(login_required(login_url='acceder'), name="dispatch")
class checkout_paso_3(View):
    template_name = "pedidos/paso-3.html"

    def dispatch(self, request, *args, **kwargs):
        paso_1 = request.session.get('checkout_paso_1')
        paso_2 = request.session.get('checkout_paso_2')
        paso_3 = request.session.get('checkout_paso_3')

        if paso_1 is True and paso_2 is False and paso_3 is False:
            return redirect('checkout-paso-dos')

        if paso_1 is False and paso_2 is False and paso_3 is False:
            return redirect('checkout-paso-uno')

        return super(checkout_paso_3, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        request.session['checkout_paso_3'] = True
        usuario = request.user
        # Total carrito
        carrito = request.session.get('total_carrito')
        ban_cod = False
        ban_gif = False

        # Buscar código de descuento
        cod = request.session.get('codigo_descuento_id')
        if cod == None:
            codigo_descuento = None
        else:
            ban_cod = True
            codigo_descuento = Codigodescuento.objects.get(id=cod)

        # Buscar giftcard
        gif = request.session.get('detalle_giftcard_id')
        if gif == None:
            giftcard = None
        else:
            ban_gif = True
            giftcard = Detallegiftcard.objects.get(id=gif)

        # Buscando el valor del envio
        envio = request.session.get('envio_id')
        if envio == None:
            transporte = None
        else:
            transporte = Transporte.objects.get(id=envio)

        # Buscando dirección
        dir = request.session.get('direccion_id')
        if dir == None:
            direccion = None
        else:
            direccion = Direcciones.objects.get(id=dir)

        # Buscar perfil de usuario
        perfil_creado = Perfilusuario.objects.filter(usuario_id=usuario)

        if perfil_creado:
            perfil = Perfilusuario.objects.get(usuario_id=usuario)
        else:
            perfil = None

        form = FormPaso3(request.POST)
        if form and perfil and carrito and transporte and direccion:
            return render(request, self.template_name, {'form': form,
                                                    'perfil_usuario': perfil,
                                                    'total_carrito': carrito,
                                                    'codigo_descuento': codigo_descuento,
                                                    'detalle_giftcard': giftcard,
                                                    'envio_transporte': transporte,
                                                    'direccion_envio': direccion,
                                                    'ban_cod': ban_cod,
                                                    'ban_gif': ban_gif})
        else:
            return redirect('checkout-paso-dos')



    def post(self, request, *args, **kwargs):
        request.session['checkout_paso_3'] = True
        usuario = request.user
        print('Request.user: ',usuario)
        direccion_envio = request.POST.get('direccion')
        envio_transporte = request.POST.get('transporte')

        request.session['direccion_id'] = direccion_envio
        request.session['envio_id'] = envio_transporte


        #Total carrito
        carrito = request.session.get('total_carrito')
        ban_cod = False
        ban_gif = False

        #Buscar código de descuento
        cod = request.session.get('codigo_descuento_id')
        if cod == None:
            codigo_descuento = None
        else:
            ban_cod = True
            codigo_descuento = Codigodescuento.objects.get(id=cod)

        #Buscar giftcard
        gif = request.session.get('detalle_giftcard_id')
        if gif == None:
            giftcard = None
        else:
            ban_gif = True
            giftcard = Detallegiftcard.objects.get(id=gif)

        #Buscando el valor del envio
        envio = request.session.get('envio_id')
        transporte = Transporte.objects.get(id=envio)

        #Buscando dirección
        dir = request.session.get('direccion_id')
        direccion = Direcciones.objects.get(id=dir)


        #Buscar perfil de usuario
        perfil = Perfilusuario.objects.get(usuario_id=usuario)

        form = FormPaso3(request.POST)
        return render(request, self.template_name, {'form':form,
                                                    'perfil_usuario':perfil,
                                                    'total_carrito':carrito,
                                                    'codigo_descuento':codigo_descuento,
                                                    'detalle_giftcard': giftcard,
                                                    'envio_transporte': transporte,
                                                    'direccion_envio': direccion,
                                                    'ban_cod':ban_cod,
                                                    'ban_gif':ban_gif})