from django.contrib import admin
from .models import Producto, Productoproveedor
# Register your models here.

class ProductoProveedorInline(admin.TabularInline):
   model = Productoproveedor
   extra = 0

#class ProductoImagenesInline(admin.StackedInline):
  #  model = Repimagen
   # extra = 1

#class ProductoAdmin(admin.ModelAdmin):
  #  inlines = [
  #      ProductoProveedorInline, ProductoImagenesInline,
   # ]



@admin.register(Producto)
class ProductoAdmin(admin.ModelAdmin):
    inlines = [ProductoProveedorInline]
    list_display = ('id','nombre', 'fpreciocosto', 'ganancia', 'valorenvio','fpreciofinal')
    actions = ['actualizar_precio_ganancia']
    prepopulated_fields = {'slug': ('nombre',)}
    list_editable = ('ganancia', 'valorenvio')
    #raw_id_fields
    search_fields = ('nombre', 'descripcion', 'marca__nombre',
                     'categoria__nombre', 'calidad__nivel', 'modelo__nombre', 'disponible')
    date_hierarchy = 'fechaprecio'
    list_filter = ('marca__nombre','categoria__nombre', 'calidad__nivel', 'disponible')

    def ganancia(self, obj):
        valor = str(obj.ganancia)+' %'
        return valor

    ganancia.short_description = '% de ganancia'

    def valorenvio(self, obj):
        valor = str(obj.valorenvio)+' %'
        return valor

    valorenvio.short_description = '% de envio'

    def fpreciocosto(self, obj):
        valor = str(obj.preciocosto)
        primer_indice = valor.find(".0")
        if primer_indice == -1:
            numero = "{:0,.2f}".format(obj.preciocosto)
        else:
            numero = "{:0,.0f}".format(obj.preciocosto)
        valor = '$ ' + str(numero)
        return valor

    fpreciocosto.short_description = 'Precio de costo'

    def fpreciofinal(self, obj):
        valor = str(obj.preciofinal)
        primer_indice = valor.find(".0")
        if primer_indice == -1:
            numero = "{:0,.2f}".format(obj.preciofinal)
        else:
            numero = "{:0,.0f}".format(obj.preciofinal)
        valor = '$ '+str(numero)
        return valor

    fpreciofinal.short_description = 'Precio final de venta'


