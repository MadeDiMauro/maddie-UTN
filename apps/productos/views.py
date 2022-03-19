from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.contrib import messages #Gestionar los mensajes flash
from django.core.paginator import Paginator
from django.http import HttpResponse, HttpResponseRedirect
from django.views.generic import ListView, DetailView
from .models import Producto
from apps.autenticacion.models import Perfilusuario
from apps.carrito.cart import Cart
from apps.checkout.views import inicializar_variables_session


#@login_required(login_url='/autenticacion/acceder/')

class ProductosListView(ListView):
    queryset = Producto.objects.filter(stock__gte=1, disponible=True, preciofinal__isnull=False, preciofinal__gte=1)
    context_object_name = 'productos'
    paginate_by = 8
    template_name = 'productos/listado.html'

    def get(self, request, *args, **kwargs):
        usuario = request.user
        inicializar_variables_session(request)

        return super(ProductosListView, self).get(request, *args, **kwargs)

    def get_queryset(self):
        queryset = super(ProductosListView, self).get_queryset()
        #Filtro de buscar
        if 'buscar' in self.request.GET:
            buscar = self.request.GET['buscar']
            queryset = queryset.filter(
                Q(nombre__icontains=buscar) |
                Q(descripcion__icontains=buscar) |
                Q(resumen__icontains=buscar) |
                Q(marca__nombre__icontains=buscar) |
                Q(categoria__nombre__icontains=buscar) |
                Q(modelo__nombre__icontains=buscar) |
                Q(calidad__nivel__icontains=buscar)
            ).distinct()

        #Filtro de categoria
        if 'categoria' in self.request.GET:
            categoria = self.request.GET['categoria']
            queryset = queryset.filter(categoria=categoria)

        #Filtro de marca
        if 'marca' in self.request.GET:
            marca = self.request.GET['marca']
            queryset = queryset.filter(marca=marca)

        # Filtro de precio desde y precio hasta
        if 'precio1' in self.request.GET and 'precio2' in self.request.GET:
            precio1 = self.request.GET['precio1']
            precio2 = self.request.GET['precio2']
            queryset = queryset.filter(preciofinal__range=[precio1, precio2])

        #Mostrar todos
        if 'todos' in self.request.GET:
            queryset = super(ProductosListView, self).get_queryset()

        return queryset

class ProductoDetailView(DetailView):
    model = Producto
    context_object_name = 'producto'
    template_name = 'productos/detalle_producto.html'

@login_required(login_url="acceder")
def add_producto(request, producto_id):
    cart = Cart(request)
    producto = Producto.objects.get(id=producto_id)
    condicion = cart.addp(producto=producto)
    if condicion == 'exito':
        messages.success(request, 'El producto fué agregado correctamente en el carrito', extra_tags='Producto agregado')
    elif condicion == 'error':
        messages.error(request, 'El producto no pudo ser agregado por no tener más unidades disponibles', extra_tags='Producto no agregado')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


@login_required(login_url="acceder")
def decrement_producto(request, producto_id):
    cart = Cart(request)
    producto = Producto.objects.get(id=producto_id)
    condicion = cart.decrementp(producto=producto)
    if condicion == 'exito':
        messages.success(request, 'Se ha decrementado una unidad del producto seleccionado', extra_tags='Producto decrementado')
    elif condicion == 'delete':
        messages.success(request, 'El producto seleccionado fué eliminado del carrito', extra_tags='Producto eliminado')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

@login_required(login_url="acceder")
def quitar_producto(request, producto_id):
    cart = Cart(request)
    producto = Producto.objects.get(id=producto_id)
    condicion = cart.quitarp(producto=producto)
    if condicion == 'exito':
        messages.success(request, 'El producto seleccionado fué quitado del carrito', extra_tags='Producto eliminado')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

@login_required(login_url="acceder")
def clear_cart(request):
    cart = Cart(request)
    cart.clear()
    messages.success(request, 'Tu carrito fué limpiado correctamente', 'Carrito limpio')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))