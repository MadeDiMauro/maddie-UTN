from django.contrib import admin
# Register your models here.
from django.db.models import Sum

from .models import *


@admin.register(Comboproducto)
class ListadoComboAdmin(admin.ModelAdmin):
    list_display = ('id','combo','producto', 'unidades', 'fsubtotal')
    list_filter = ('combo__nombre', 'producto__categoria__nombre')
    readonly_fields = ['unidades']

    def combo(self, obj):
        return obj.combo.nombre

    combo.short_description = 'Combo asociado'

    def fsubtotal(self, obj):
        valor = str(obj.subtotal)
        primer_indice = valor.find(".0")
        if primer_indice == -1:
            numero = "{:0,.2f}".format(obj.subtotal)
        else:
            numero = "{:0,.0f}".format(obj.subtotal)
        valor = '$ ' + str(numero)
        return valor

    fsubtotal.short_description = 'Subtotal'




@admin.register(Combo)
class ComboAdmin(admin.ModelAdmin):
    list_display = ('id','nombre', 'descripcion', 'stock', 'disponible','fpganancia', 'fpreciofinal')
    search_fields = ('nombre', 'descripcion', 'pganancia')
    actions = ['actualizar_preciofinal_combo']
    list_editable = ['stock']
    list_filter = ['disponible']
    readonly_fields = ['mpreciofinal']
    exclude = ['preciofinal']

    def fpganancia(self, obj):
        valor = str(obj.pganancia)+' %'
        return valor

    fpganancia.short_description = 'Ganancia'

    def mpreciofinal(self,obj):
        if obj.preciofinal == None:
            return 0
        else:
            valor = str(obj.preciofinal)
            primer_indice = valor.find(".0")
            if primer_indice == -1:
                numero = "{:0,.2f}".format(obj.preciofinal)
            else:
                numero = "{:0,.0f}".format(obj.preciofinal)
            valor = '$ ' + str(numero)
            return valor

    mpreciofinal.short_description = 'Precio final'


    def fpreciofinal(self, obj):
        valor = str(obj.preciofinal)
        primer_indice = valor.find(".0")
        if primer_indice == -1:
            numero = "{:0,.2f}".format(obj.preciofinal)
        else:
            numero = "{:0,.0f}".format(obj.preciofinal)

        if obj.preciofinal == 0:
            valor = 'No tiene listado asociado'
        else:
            valor = '$ ' + str(numero)
        return valor

    fpreciofinal.short_description = 'Precio final'




