from django.contrib import admin
from .models import Perfilusuario, Direcciones, Consulta, Respuesta

class DireccionesInline(admin.TabularInline):
    model = Direcciones
    extra = 0
    readonly_fields = ('telefono','direccion','numero','piso_departamento','provincia','ciudad','destacada')

@admin.register(Perfilusuario)
class PerfilAdmin(admin.ModelAdmin):
    inlines = [
        DireccionesInline,
    ]
    list_display = ('id_usuario','nombre_usuario','nombre','apellido','dni', 'fnacimiento', 'sexo', 'ciudad', 'provincia')
    search_fields = ('usuario__username', 'dni', 'usuario__first_name', 'usuario__last_name')
    list_per_page = 10
    list_filter = ['fnacimiento']

    def id_usuario(self, obj):
        value = "Usuario N°"+str(obj.id)
        return value

    def nombre_usuario(self, obj):
        return obj.usuario.username
    nombre_usuario.short_description = 'Usuario'

    def nombre(self, obj):
        return obj.usuario.first_name
    nombre.short_description = 'Nombre'

    def apellido(self, obj):
        return obj.usuario.last_name
    apellido.short_description = 'Apellido'

    nombre_usuario.admin_order_field = 'usuario__username'

    def ciudad(self, obj):
        return obj.ciudad.nombre
    ciudad.short_description = 'Ciudad'

    def provincia(self, obj):
        return obj.provincia.nombre
    provincia.short_description = 'Provincia'






class RespuestaInline(admin.StackedInline):
    model = Respuesta
    readonly_fields = ['visto_mensaje']
    extra = 0

@admin.register(Consulta)
class Consulta(admin.ModelAdmin):
    inlines = [
        RespuestaInline,
    ]
    list_display = ('id','nombre_usuario', 'motivo', 'respondida','fecha')
    search_fields = ('usuario__username', 'fecha')
    list_filter = ('respondida',)
    ordering = ['fecha','id']
    readonly_fields = ('usuario','id', 'motivo', 'mensaje', 'respondida')

    def nombre_usuario(self, obj):
        return obj.usuario.username

    nombre_usuario.short_description = 'Usuario'