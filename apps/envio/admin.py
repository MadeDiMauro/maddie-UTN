from django.contrib import admin
from .models import *
# Register your models here.



@admin.register(Envio)
class EnvioAdmin(admin.ModelAdmin):
    list_display = ('id','usuario', 'direccion','celular','provincia','ciudad','estado', 'codigo_seguimiento', 'mpreciofinal', 'transporte')
    readonly_fields = ('usuario','ciudad','provincia','mpreciofinal', 'transporte')
    search_fields = ('id','direccion', 'codigo_seguimiento','transporte__nombre', 'usuario__username')
    exclude = ['precio_envio']
    list_filter = ['estado']

    def mpreciofinal(self,obj):
        if obj.precio_envio == None:
            return 0
        else:
            valor = str(obj.precio_envio)
            primer_indice = valor.find(".0")
            if primer_indice == -1:
                numero = "{:0,.2f}".format(obj.precio_envio)
            else:
                numero = "{:0,.0f}".format(obj.precio_envio)
            valor = '$ ' + str(numero)
            return valor
    mpreciofinal.short_description = 'Precio envio'


@admin.register(Transporte)
class TransporteAdmin(admin.ModelAdmin):
    list_display = ('id', 'nombre', 'tipo', 'direccion', 'telefono', 'email', 'pservicio','provincia', 'ciudad', 'plazo_entrega')
    search_fields = ('nombre','tipo','direccion','plazo_entrega')

    def pservicio(self,obj):
        if obj.precio_servicio == None:
            return 0
        else:
            valor = str(obj.precio_servicio)
            primer_indice = valor.find(".0")
            if primer_indice == -1:
                numero = "{:0,.2f}".format(obj.precio_servicio)
            else:
                numero = "{:0,.0f}".format(obj.precio_servicio)
            valor = '$ ' + str(numero)
            return valor
    pservicio.short_description = 'Precio servicio'
