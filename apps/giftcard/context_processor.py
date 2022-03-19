from .models import Codigodescuento, Giftcard
from datetime import datetime

def mostrar_codigos_descuento(request):
    hoy = datetime.now()
    codigos = Codigodescuento.objects.filter(fecha_inicio__gte=hoy, fecha_fin__gte=hoy)
    return {'mostrar_codigos':codigos}