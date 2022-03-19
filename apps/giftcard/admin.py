from django.contrib import admin
from .models import *
admin.site.register(Detallecodigodescuento)
# Register your models here.
@admin.register(Giftcard)
class GiftcardAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'preciofinal', 'disponible', 'stock')
    prepopulated_fields = {'slug': ('nombre',)}
    search_fields = ('nombre', 'descripcion')

    def mpreciofinal(self, obj):
        if obj.preciofinal == None:
            return '0'
        else:
            valor = str(obj.preciofinal)
            primer_indice = valor.find(".0")
            if primer_indice == -1:
                numero = "{:0,.2f}".format(obj.preciofinal)
            else:
                numero = "{:0,.0f}".format(obj.preciofinal)
            valor = '- $' + str(numero)
            return valor

    mpreciofinal.short_description = 'Precio final'


@admin.register(Codigodescuento)
class CodigodescuentoAdmin(admin.ModelAdmin):
    list_display = ('codigo', 'nombre', 'porcentaje', 'fecha_inicio', 'fecha_fin')
    search_fields = ('codigo', 'nombre', 'valor')
    list_editable = ('fecha_inicio', 'fecha_fin')

    def porcentaje(self, obj):
        valor = '%'+str(obj.valor)
        return valor

    porcentaje.short_description = 'Porcentaje descuento'


class Detallecodigodes(admin.ModelAdmin):
    list_display = ('id', 'usuario', 'codigo', 'fecha', 'codigo_texto', 'mporcentaje', 'mdescuentoa')
    readonly_fields = ('id', 'usuario', 'codigo', 'fecha', 'codigo_texto', 'mporcentaje', 'mdescuentoa')
    exclude = ('porcentaje', 'descuento_aplicado')
    list_filter = ('fecha', 'porcentaje')

    def mporcentaje(self, obj):
        valor = '%'+str(obj.porcentaje)
        return valor

    def mdescuentoa(self, obj):
        if obj.descuento_aplicado == None:
            return '0'
        else:
            valor = str(obj.descuento_aplicado)
            primer_indice = valor.find(".0")
            if primer_indice == -1:
                numero = "{:0,.2f}".format(obj.descuento_aplicado)
            else:
                numero = "{:0,.0f}".format(obj.descuento_aplicado)
            valor = '- $'+ str(numero)
            return valor
    mdescuentoa.short_description = 'Descuento $'




@admin.register(Detallegiftcard)
class DetallegiftcardAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'nro_tarjeta' ,'valor', 'nombre_amigo','correo_amigo','usado')
    readonly_fields = ('usuario','valor', 'nombre_amigo', 'correo_amigo','nro_tarjeta', 'codigo_seguridad', 'usado')
    list_filter = ['usado']

    def nombre(self, obj):
        return obj.usuario.usuario.first_name
    nombre.short_description = 'Nombre de usuario'
    nombre.admin_order_field = 'usuario__nombre'


    def valor(self, obj):
        pvalor = '$'+str(obj.valor_descuento)
        return pvalor
    valor.short_description = 'Precio del giftcard'


