from django.contrib import admin
from .models import Recomendados

# Register your models here.
@admin.register(Recomendados)
class RecomendadosAdmin(admin.ModelAdmin):
    list_display = ('producto_nombre','producto_precio', 'producto_categoria', 'producto_marca', 'producto_modelo', 'cantidad', 'fecha')
    actions = ['top5']
    list_filter = ['fecha']
    ordering = ['cantidad']

    def producto_nombre(self, obj):
        return obj.producto.nombre

    producto_nombre.short_description = 'Producto'

    def producto_precio(self, obj):
        return '$'+str(obj.producto.preciofinal)

    producto_precio.short_description = 'Precio final'

    def producto_categoria(self, obj):
        return obj.producto.categoria.nombre

    producto_categoria.short_description = 'Categoria'

    def producto_marca(self, obj):
        return obj.producto.marca.nombre

    producto_marca.short_description = 'Marca'

    def producto_modelo(self, obj):
        return obj.producto.modelo.nombre

    producto_marca.shor_description = 'Modelo'


