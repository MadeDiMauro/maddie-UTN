from django.contrib import admin
from django.contrib import messages
from .models import *


class DetallepedidoInline(admin.TabularInline):
    model = Detallepedido
    extra = 0
    readonly_fields = ['fpv','cantidad','ps','tipo_detalle','producto', 'combo', 'giftcard']
    exclude = ['precio_venta_unitario', 'subtotal']

    def fpv(self, obj):
        valor = str(obj.precio_venta_unitario)
        primer_indice = valor.find(".0")
        if primer_indice == -1:
            numero = "{:0,.2f}".format(obj.precio_venta_unitario)
        else:
            numero = "{:0,.0f}".format(obj.precio_venta_unitario)
        numero = '$'+str(numero)
        return numero

    fpv.short_description = 'Precio venta'

    def ps(self, obj):
        valor = str(obj.subtotal)
        primer_indice = valor.find(".0")
        if primer_indice == -1:
            numero = "{:0,.2f}".format(obj.subtotal)
        else:
            numero = "{:0,.0f}".format(obj.subtotal)
        numero = '$'+str(numero)
        return numero

    ps.short_description = 'Subtotal'

@admin.register(Pago)
class PagoAdmin(admin.ModelAdmin):
    list_display = ('id','formapago', 'fechapago', 'confirmado')
    readonly_fields = ('id_pagomp','estado')
    search_fields = ('id','formapago', 'fechapago', 'confirmado', 'estado', 'tipopago')


@admin.register(Pedido)
class PedidoAdmin(admin.ModelAdmin):
    inlines = [
        DetallepedidoInline,
    ]

    list_display = ('id','nombreusuario', 'estado_armado','creacion','nroenvio', 'estadoe', 'nropago', 'formapago', 'tipopago', 'estadop')
    search_fields = ('usuario__username', 'id','usuario__first_name','usuario__last_name', 'estado_armado', 'usuario__username','creacion', 'pago__formapago', 'pago__estado')
    list_filter = ('estado_armado','pago__formapago','pago__estado')
    list_editable = ['estado_armado']
    readonly_fields = ('usuario','confirmado', 'creacion', 'mmontofinal', 'pago', 'estado', 'envio', 'recibido', 'codigo', 'giftcard')
    exclude = ('codigo_descuento','giftcard_descuento', 'montofinal')

    def estadoe(self, obj):
        if obj.envio.estado == True:
            return 'Si'
        else:
            return 'No'

    estadoe.short_description = '¿Enviado?'

    def nroenvio(self, obj):
        return str(obj.envio.id)

    nroenvio.short_description = 'Envío N°'

    def nropago(self, obj):
        return str(obj.pago.id)
    nropago.short_description = 'Pago N°'

    def mmontofinal(self,obj):
        if obj.montofinal == None:
            return '0'
        else:
            valor = str(obj.montofinal)
            primer_indice = valor.find(".0")
            if primer_indice == -1:
                numero = "{:0,.2f}".format(obj.montofinal)
            else:
                numero = "{:0,.0f}".format(obj.montofinal)
            valor = '$ ' + str(numero)
            return valor
    mmontofinal.short_description = 'Precio final'

    def codigo(self, obj):
        return obj.codigo_descuento.codigo

    def giftcard(self, obj):
        return obj.giftcard_descuento.nombre

    def formapago(self, obj):
        return obj.pago.formapago

    def tipopago(self, obj):
        return obj.pago.tipopago

    def estadop(self, obj):
        return obj.pago.estado

    formapago.short_description = 'Forma pago'
    tipopago.short_description = 'Tipo pago'
    estadop.short_description = 'Estado pago'


    def nombreusuario(self, obj):
        return obj.usuario.username

    nombreusuario.short_description = 'Usuario'
    nombreusuario.admin_order_field = 'usuario__username'

@admin.register(Token)
class Tokens(admin.ModelAdmin):
    readonly_fields = ('usuario','token','pedido','evento')
    list_display = ('id','usuario','token','pedido','evento')