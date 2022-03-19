from apps.productos.models import Producto
from .models import Recomendados
from django.db.models import Avg, Max, Min, Sum, Count
import datetime
# Create your models here.
#today = date.today()
#Verano (21 de diciembre a 20 de marzo).
#Otoño (21 de marzo a 20 de junio).
#Invierno (21 de junio a 20 de septiembre).
#Primavera (21 de septiembre a 20 de diciembre).

#Fecha actual


def recomendados(request):
    now = datetime.datetime.now()
    now_year = int(now.year)
    print(now_year)
    fecha_verano_inicio = datetime.datetime(now_year-1, 12, 21)
    fecha_verano_fin = datetime.datetime(now_year, 3, 20)

    fecha_otoño_inicio = datetime.datetime(now.year, 3, 21)
    fecha_otoño_fin = datetime.datetime(now.year, 6, 20)

    fecha_invierno_inicio = datetime.datetime(now.year, 6, 21)
    fecha_invierno_fin = datetime.datetime(now.year, 9, 20)

    fecha_primavera_inicio = datetime.datetime(now.year, 9, 21)
    fecha_primavera_fin = datetime.datetime(now.year, 12, 20)

    fecha_inicio = None
    fecha_final = None

    if now >= fecha_verano_inicio and now <= fecha_verano_fin:
        fecha_inicio = fecha_verano_inicio
        fecha_final = fecha_verano_fin
        temporada = 'verano'
        print(temporada)

    if now >= fecha_otoño_inicio and now <= fecha_otoño_fin:
        fecha_inicio = fecha_verano_inicio
        fecha_final = fecha_verano_fin
        temporada = 'otoño'
        print(temporada)

    if now >= fecha_invierno_inicio and now <= fecha_invierno_fin:
        fecha_inicio = fecha_verano_inicio
        fecha_final = fecha_verano_fin
        temporada = 'invierno'
        print(temporada)


    if now >= fecha_primavera_inicio and now <= fecha_primavera_fin:
        fecha_inicio = fecha_verano_inicio
        fecha_final = fecha_verano_fin
        temporada = 'primavera'
        print(temporada)


    productos_recomendados = Recomendados.objects.all().annotate(cant=Count('cantidad')).order_by('-cant')[:4]
    #productos_temporada = Recomendados.objects.filter(fecha__gte=fecha_inicio, fecha__lte=fecha_final, producto__stock__gte=1).annotate(cant=Count('cantidad')).order_by('-cant')[:4]
    productos_temporada = Recomendados.objects.filter(fecha__gte=fecha_inicio, fecha__lte=fecha_final,
                                                      producto__stock__gte=1).annotate(Max('cantidad')).order_by('-cantidad')[:4]
    print(productos_temporada)
    return {'productos_recomendados':productos_recomendados, 'productos_temporada': productos_temporada, 'temporada':temporada}
