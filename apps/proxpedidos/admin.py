from django.contrib import admin
from .models import Proxpedidos
# Register your models here.

@admin.register(Proxpedidos)
class ProxPedidosAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'fecha_d', 'fecha_h', 'detalles')
    search_fields = ('titulo', 'listado', 'detalles')
    list_filter = ('fecha_d', 'fecha_h')