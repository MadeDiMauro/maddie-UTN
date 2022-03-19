from django.contrib import admin
from .models import *

# Register your models here.

@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'destacado',)
    search_fields = ('nombre',)
    list_filter = ('destacado',)

@admin.register(Marca)
class MarcaAdmin(admin.ModelAdmin):
    list_display = ('nombre',)
    search_fields = ('nombre',)

@admin.register(Modelo)
class ModeloAdmin(admin.ModelAdmin):
    list_display = ('nombre',)
    search_fields = ('nombre', 'marca__nombre',)
    list_filter = ('marca__nombre',)

@admin.register(Calidad)
class CalidadAdmin(admin.ModelAdmin):
    list_display = ('nivel', 'descripcion',)
    search_fields = ('nivel', 'descripcion',)
