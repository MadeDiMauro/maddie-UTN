from datetime import date
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render, redirect
from django.utils.decorators import method_decorator
from django.db.models import Q
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.views.generic import ListView, DetailView, View
from .models import Giftcard, Codigodescuento, Detallegiftcard
from apps.carrito.models import Pedido
from apps.carrito.views import Cart
from apps.carrito.models import Token
from apps.autenticacion.models import Perfilusuario
from .forms import FormularioGiftcardAmigo
from .funciones import enviar_mail_amigo_giftcard



# Create your views here.
class GiftcardListView(ListView):
    queryset = Giftcard.objects.filter(stock__gte=1, preciofinal__isnull=False, disponible=True, preciofinal__gte=1)
    context_object_name = 'giftcards'
    paginate_by = 8
    template_name = 'giftcards/listado.html'

    def get_queryset(self):
        queryset = super(GiftcardListView, self).get_queryset()

        # Filtro de precio desde y precio hasta
        if 'precio1' in self.request.GET and 'precio2' in self.request.GET:
            precio1 = self.request.GET['precio1']
            precio2 = self.request.GET['precio2']
            queryset = queryset.filter(preciofinal__range=[precio1, precio2])

        # Mostrar todos
        if 'todos' in self.request.GET:
            queryset = super(GiftcardListView, self).get_queryset()

        #Filtro de buscar
        if 'buscar' in self.request.GET:
            buscar = self.request.GET['buscar']
            queryset = queryset.filter(
                Q(nombre__icontains=buscar) |
                Q(descripcion__icontains=buscar)
            ).distinct()

        #Mostrar todos
        if 'cancelar' in self.request.GET:
            queryset = super(GiftcardListView, self).get_queryset()

        return queryset

class GiftcardDetailView(DetailView):
    model = Giftcard
    context_object_name = 'giftcard'
    template_name = 'giftcards/detalle_giftcard.html'



@login_required(login_url="acceder")
def add_giftcard(request, giftcard_id):
    cart = Cart(request)
    giftcard = Giftcard.objects.get(id=giftcard_id)
    condicion = cart.addg(giftcard=giftcard)
    if condicion == 'exito':
        messages.success(request, 'El giftcard fué agregado correctamente en el carrito', extra_tags='Gift Card agregado')
    elif condicion == 'error':
        messages.error(request, 'El giftcard no pudo ser agregado por no tener más unidades disponibles', extra_tags='Gift Card no agregado')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

@login_required(login_url="acceder")
def decrement_giftcard(request, giftcard_id):
    cart = Cart(request)
    giftcard = Giftcard.objects.get(id=giftcard_id)
    condicion = cart.decrementg(giftcard=giftcard)
    if condicion == 'exito':
        messages.success(request, 'Se ha decrementado una unidad del giftcard seleccionado',
                         extra_tags='Gift Card decrementado')
    elif condicion == 'delete':
        messages.success(request, 'El giftcard seleccionado fué eliminado del carrito', extra_tags='Gift Card eliminado')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

@login_required(login_url="acceder")
def quitar_giftcard(request, giftcard_id):
    cart = Cart(request)
    giftcard = Giftcard.objects.get(id=giftcard_id)
    condicion = cart.quitarg(giftcard=giftcard)
    if condicion == 'exito':
        messages.success(request, 'El giftcard seleccionado fué quitado del carrito', extra_tags='Gift Card eliminado')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


class ValidarGiftcard(View):
    def dispatch(self, request, *args, **kwargs):
        token_id = request.session.get('token_id')
        if token_id:
            return super(ValidarGiftcard, self).dispatch(request, *args, **kwargs)
        else:
            return redirect('listado_productos')
    def get(self, request, *args, **kwargs):
        token_id = request.session.get('token_id')
        token = Token.objects.get(id=token_id)

        perfil = Perfilusuario.objects.get(usuario=token.usuario)
        detalle_giftcard = Detallegiftcard.objects.filter(usuario=perfil, usado=False, correo_amigo__isnull=True, nombre_amigo__isnull=True)
        print(detalle_giftcard)
        if detalle_giftcard:
            messages.success(request, 'Tienes giftcards sin asociar, se muestran los siguientes giftcards, selecciona el botón enviar a un amigo.', extra_tags='Giftcards sin asociar')
            cantidad_giftcards = Detallegiftcard.objects.filter(usuario=perfil, usado=False, correo_amigo__isnull=True,
                                                              nombre_amigo__isnull=True).count()
            return render(request, 'giftcards/formulario-enviar-amigo.html',{'detalle_giftcard':detalle_giftcard, 'cantidad_giftcards':cantidad_giftcards})
        else:
            request.session['token_id'] = None
            messages.error(request,'No tienes giftcards para asociar',extra_tags='Error')
            return redirect('listado_productos')

class FormularioEnviarAmigo(View):
    def dispatch(self, request, *args, **kwargs):
        enviado = request.session.get('giftcard_enviado')
        detalle_id = request.session.get('detalle_id_gif')
        nro_tarjeta = request.session.get('detalle_nro_tar')

        detalle = Detallegiftcard.objects.filter(id=detalle_id, nro_tarjeta__exact=nro_tarjeta, nombre_amigo__isnull=False, correo_amigo__isnull=False)
        if enviado is True and detalle:
            request.session['detalle_id_gif'] = None
            request.session['detalle_nro_tar'] = None
            return redirect('carrito')
        else:
            return super(FormularioEnviarAmigo, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        id = kwargs.get('giftcard_id')
        detalle = Detallegiftcard.objects.filter(id=id, usado=False, nombre_amigo__isnull=True, correo_amigo__isnull=True)
        if detalle:
            detalle = Detallegiftcard.objects.get(id=id, usado=False, nombre_amigo__isnull=True,
                                                  correo_amigo__isnull=True)
            form = FormularioGiftcardAmigo(instance=detalle)
            request.session['giftcard_enviado'] = False
            return render(request, "giftcards/formulario-enviar-amigo-p2.html", {"form": form, 'detalle':detalle})
        else:
            messages.info(request, F'El giftcard seleccionado ya fué enviado a su amigo.', extra_tags='Giftcard ya enviado')
            return redirect('carrito')

    def post(self, request, *args, **kwargs):
        nro_tarjeta = request.POST.get('nro_tarjeta')
        correo_amigo = request.POST.get('correo_amigo')
        nombre_amigo = request.POST.get('nombre_amigo')
        detalle_id = request.POST.get('id')

        detalle = Detallegiftcard.objects.get(id=detalle_id, nro_tarjeta__exact=nro_tarjeta)
        form = FormularioGiftcardAmigo(request.POST, instance=detalle)
        print(form)

        if form.is_valid():
            print(nro_tarjeta, correo_amigo, nombre_amigo)
            form.save()
            enviar_mail_amigo_giftcard(tarjeta=nro_tarjeta, correo=correo_amigo, nombre=nombre_amigo, detalle_id=detalle_id)
            messages.success(request, F'El giftcard fué enviado correctamente a su amigo.', extra_tags='Excelente')
            request.session['giftcard_enviado'] = True
            request.session['detalle_id_gif'] = detalle.id
            request.session['detalle_nro_tar'] = nro_tarjeta
        return render(request, 'giftcards/giftcard-enviado.html', {'nombre_amigo':nombre_amigo, 'correo_amigo':correo_amigo})