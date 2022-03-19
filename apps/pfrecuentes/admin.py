from django.contrib import admin
from .models import Pregfrecuentes
# Register your models here.

@admin.register(Pregfrecuentes)
class PregfrecuentesAdmin(admin.ModelAdmin):
    list_display = ('pregunta', 'categoria', 'relevancia', 'destacada')
    search_fields = ('pregunta', 'categoria')
    list_filter = ('categoria', 'relevancia', 'destacada')