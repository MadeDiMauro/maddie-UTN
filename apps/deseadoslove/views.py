from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

from .models import Lovelist, Loveproducto
from django.shortcuts import render, redirect
from django.views.generic import ListView, TemplateView, View
from django.contrib import messages
from apps.productos.models import Producto
from django.http import HttpResponseRedirect
# Create your views here.

@login_required(login_url="/autenticacion/acceder")

def agregar_producto_love(request, producto_id):
    usuario = request.user
    lovelist = Lovelist.objects.filter(usuario=usuario)
    producto = Loveproducto.objects.filter(producto_id=producto_id, lovelist__usuario=usuario)

    if producto:
        messages.info(request, 'El producto ya existe en Mi Lovelist ❤','Producto existente')
    else:
        if lovelist:
            lovelist = Lovelist.objects.get(usuario=usuario)
        else:
            lovelist = Lovelist.objects.create(usuario=usuario)
            lovelist.save()

        producto = Loveproducto.objects.create(lovelist=lovelist, producto_id=producto_id)
        producto.save()
        messages.success(request, 'El producto fué agregado a Mi Lovelist ❤', 'Producto agregado')

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def quitar_producto_love(request, producto_id):
    usuario = request.user
    producto = Loveproducto.objects.filter(producto_id=producto_id, lovelist__usuario=usuario)
    if producto:
        lovelist = Lovelist.objects.get(usuario=usuario)
        eliminar_producto = Loveproducto.objects.get(lovelist=lovelist, producto_id=producto_id)
        eliminar_producto.delete()
        messages.success(request, 'El producto fué eliminado correctamente de Mi Lovelist ❤', 'Producto eliminado')

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))



@method_decorator(login_required(login_url='/autenticacion/acceder'), name="dispatch")
class LoveListView(View):
    template_name = 'lovelist/listado.html'

    def get(self, request, *args, **kwargs):
        usuario = request.user
        lovelist = Lovelist.objects.filter(usuario=usuario)
        if lovelist:
            lovelist = Lovelist.objects.get(usuario=usuario)
            loveproducto = Loveproducto.objects.filter(lovelist=lovelist)
        else:
            lovelist = {}
            loveproducto = {}
        return render(request, self.template_name, {'productos': loveproducto, 'listado': lovelist})



