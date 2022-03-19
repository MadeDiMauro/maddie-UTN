from django.contrib import admin
from .models import Loveproducto, Lovelist

# Register your models here.
class LoveproductoInline(admin.TabularInline):
    model = Loveproducto
    extra = 0
    readonly_fields = ('lovelist', 'producto')

@admin.register(Lovelist)
class LovelistAdmin(admin.ModelAdmin):
    inlines = [
        LoveproductoInline,
    ]
    list_display = ('id','nombre', 'nombreusuario')
    search_fields = ('nombre', 'usuario__username',)
    readonly_fields = ('nombre','usuario')

    def nombreusuario(self, obj):
        return obj.usuario.username

    nombreusuario.short_description = 'Nombre de usuario'
    nombreusuario.admin_order_field = 'usuario__username'

