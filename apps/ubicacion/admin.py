from django.contrib import admin
from .models import *

# Register your models here.

class ProvinciaCiudadInline(admin.TabularInline):
    model = Ciudad
    extra = 2

@admin.register(Provincia)
class ProvinciaAdmin(admin.ModelAdmin):
    inlines = [
        ProvinciaCiudadInline,
    ]
    list_display = ['nombre']
    search_fields = ['nombre']

@admin.register(Ciudad)
class CiudadAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'provincia', 'cpostal')
    search_fields =('nombre', 'provincia__nombre', 'cpostal__codigo')

@admin.register(Cpostal)
class CpostalAdmin(admin.ModelAdmin):
    list_display = ['codigo']
    search_fields = ['codigo']

