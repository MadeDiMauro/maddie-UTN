from .models import Perfilusuario, Direcciones
from apps.deseadoslove.models import Loveproducto, Lovelist
from apps.carrito.models import Pedido
from django.contrib.auth.models import User
from django.db.models import Count
from apps.ubicacion.models import Provincia, Ciudad
from .models import Consulta, Respuesta
def resumen_cuenta(request):
    usuario = request.user

    if usuario.is_authenticated:
        perfil = Perfilusuario.objects.filter(usuario=usuario)
        consultas = Consulta.objects.filter(usuario=usuario)
        if perfil:
            return {"perfiles": perfil, "usuario":usuario, 'consultas':consultas}
        else:
            perfil = {}
            return {"perfiles": perfil, "usuario":usuario, "consultas":consultas}
    else:
        return {}


def respuestas_de_consultas(request):
    usuario = request.user
    if usuario.is_authenticated:
        cantidad_respuestas = Respuesta.objects.filter(consulta__usuario=usuario, visto_mensaje=False).count()
        respuestas = Respuesta.objects.filter(consulta__usuario=usuario, consulta__respondida=True)
        return {'cantidar':cantidad_respuestas, 'respuestas':respuestas}
    else:
        return {}

def lovelist_cuenta(request):
    usuario = request.user
    if usuario.is_authenticated:
        loveproducto = Loveproducto.objects.filter(lovelist__usuario=usuario)
        print(loveproducto)
        if loveproducto:
            lovelist = Lovelist.objects.get(usuario=usuario)
            print(lovelist)
            return {'lovelist': lovelist, 'loveproductos': loveproducto}
        else:
            loveproducto = {}
            lovelist = {}
            return {'lovelist': lovelist, 'loveproductos': loveproducto, 'vacio':True}
    else:
        return {}

#Pedidos de la cuenta de usuario
def pedidos_cuenta(request):
    usuario = request.user

    if usuario.is_authenticated:
        pedido = Pedido.objects.filter(usuario=usuario)
        if pedido and usuario.is_authenticated:
            return {'PEDIDOS': pedido}
        else:
            pedido = {}
            return {'PEDIDOS': pedido}
    else:
        return {}


def direcciones(request):
    usuario = request.user
    if usuario.is_authenticated:
        buscar = Perfilusuario.objects.filter(usuario=usuario)
        if buscar:
            perfil = Perfilusuario.objects.get(usuario=usuario)
            direccion = Direcciones.objects.filter(usuario=perfil)
            if direccion is not None:
                return {"DIRECCIONES":direccion}
            else:
                direccion = {}
                return {"DIRECCIONES":direccion}
        else: 
            return {}
    else:
        return {}

