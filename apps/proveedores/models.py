from django.db import models
from apps.ubicacion.models import *

PROVEEDOR_CHOICES = (
    ('provincial','Tipo Provincial'),
    ('nacional','Tipo Nacional'),
    ('internacional','Tipo Internacional'),
    ('ninguno', 'Ninguno')
)

# Create your models here.
class Proveedor(models.Model):
    razonsocial = models.CharField(max_length=100, null=False, unique=True, verbose_name='Razon Social')
    cuit = models.CharField(max_length=200, null=True, verbose_name='Cuit', help_text='Ingrese su cuit aquí')
    provincia = models.ForeignKey(Provincia, verbose_name='Provincia', on_delete=models.CASCADE)
    ciudad = models.ForeignKey(Ciudad, on_delete=models.CASCADE, verbose_name='Ciudad')
    tipo = models.CharField(max_length=200, verbose_name='Tipo', choices=PROVEEDOR_CHOICES, default='ninguno', null=True, blank=True)
    direccion = models.CharField(max_length=200, verbose_name='Dirección', blank=True)
    email = models.EmailField(max_length=254, null=False, help_text='Ingrese su email aquí')
    telefono = models.CharField(null=True, max_length=200, verbose_name='Teléfono')
    contacto = models.CharField(max_length=100, null=False, verbose_name='Contacto de referencia')

    def __str__(self):
        return self.razonsocial

    class Meta:
        db_table = 'proveedor'
        verbose_name = 'Proveedor'
        verbose_name_plural = 'Proveedores'
        ordering = ['id']

