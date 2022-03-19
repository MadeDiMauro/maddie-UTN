from django.contrib import admin
from .models import *
# Register your models here.

@admin.register(Proveedor)
class ProveedorAdmin(admin.ModelAdmin):
    list_display = ('razonsocial', 'cuit', 'provincia', 'ciudad', 'tipo', 'direccion', 'email', 'telefono', 'contacto')
    list_filter = ['tipo']
    search_fields = ('razonsocial', 'contacto')