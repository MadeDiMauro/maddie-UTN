from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from apps.productos.models import Producto
from django.contrib import messages
from .models import Combo, Comboproducto
from apps.carrito.views import Cart
from django.views.generic import ListView, DetailView
# Create your views here.

class CombosListView(ListView):
    queryset = Combo.objects.filter(preciofinal__isnull=False, stock__gte=1, disponible=True, preciofinal__gte=1)
    context_object_name = 'combos'
    paginate_by = 8
    template_name = 'combos/listado.html'

    def get_queryset(self):
        queryset = super(CombosListView, self).get_queryset()

        # Filtro de precio desde y precio hasta
        if 'precio1' in self.request.GET and 'precio2' in self.request.GET:
            precio1 = self.request.GET['precio1']
            precio2 = self.request.GET['precio2']
            queryset = queryset.filter(preciofinal__range=[precio1, precio2])

        # Mostrar todos
        if 'todos' in self.request.GET:
            queryset = super(CombosListView, self).get_queryset()

        #Filtro de buscar
        if 'buscar' in self.request.GET:
            buscar = self.request.GET['buscar']
            queryset = queryset.filter(
                Q(nombre__icontains=buscar) |
                Q(descripcion__icontains=buscar)
            ).distinct()


        #Mostrar todos
        if 'cancelar' in self.request.GET:
            queryset = super(CombosListView, self).get_queryset()

        return queryset

class ComboDetailView(DetailView):
    model = Combo
    context_object_name = 'combo'
    template_name = 'combos/detalle_combo.html'



@login_required(login_url="/autenticacion/acceder")
def add_combo(request, combo_id):
    cart = Cart(request)
    combo = Combo.objects.get(id=combo_id)
    comproducto = Comboproducto.objects.filter(combo=combo)
    condicion = cart.addc(combo=combo, comboproducto=comproducto)
    if condicion == 'exito':
        messages.success(request, 'El combo fué agregado correctamente en el carrito', extra_tags='Box Gift agregado')
    elif condicion == 'error':
        messages.error(request, 'El combo no pudo ser agregado por no tener más unidades disponibles', extra_tags='Box Gift no agregado')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

@login_required(login_url="/autenticacion/acceder")
def decrement_combo(request, combo_id):
    cart = Cart(request)
    combo = Combo.objects.get(id=combo_id)
    condicion = cart.decrementc(combo=combo)
    if condicion == 'exito':
        messages.success(request, 'Se ha decrementado una unidad del combo seleccionado',
                         extra_tags='Box Gift decrementado')
    elif condicion == 'delete':
        messages.success(request, 'El combo seleccionado fué eliminado del carrito', extra_tags='Box Gift eliminado')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

@login_required(login_url="/autenticacion/acceder")
def quitar_combo(request, combo_id):
    cart = Cart(request)
    combo = Combo.objects.get(id=combo_id)
    condicion = cart.quitarc(combo=combo)
    if condicion == 'exito':
        messages.success(request, 'El combo seleccionado fué quitado del carrito', extra_tags='Box Gift eliminado')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

