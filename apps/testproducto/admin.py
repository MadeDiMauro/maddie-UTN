from django.contrib import admin
from .models import Testdeproducto
# Register your models here.

@admin.register(Testdeproducto)
class Testdeproducto(admin.ModelAdmin):
    list_display = ('producto','tipo_piel', 'color_piel', 'paleta_color')
    search_fields = ('producto__nombre','tipo_piel', 'color_piel', 'paleta_color')
    list_filter = ('tipo_piel', 'color_piel', 'paleta_color')