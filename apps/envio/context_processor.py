from django.db.models import Q

from apps.envio.models import Transporte
from apps.ubicacion.models import Ciudad

def buscar_cp(request):
    querysetcp = request.GET.get('buscarcp')

    if querysetcp:
        transporte = Transporte.objects.filter(
        Q(ciudad__cpostal__codigo__icontains=querysetcp) |
        Q(provincia__ciudad__cpostal=querysetcp)
    ).distinct()
        if transporte:
            return {
             "transportes":transporte, "opcion":'1',
            }
        else:
            return {
            "opcion": '2',
        }
    else:
        return {"opcion":'0'}

