from django.db import models
from apps.productos.models import Producto
# Create your models here.

TIPO_CHOICES = (
    ('normal','Normal'),
    ('seca', 'Seca'),
    ('mixta', 'Mixta'),
    ('grasa','Grasa/oleosa'),
)

COLOR_CHOICES = (
    ('clara','Clara'),
    ('morena','Morena'),
    ('oscura','Oscura'),
)

PALETA_CHOICES=(
    ('pasteles','Colores gama pasteles'),
    ('llamativo','Colores gama llamativos/fluor'),
    ('frios','Colores gama frios'),
    ('calidos','Colores gama cálidos'),
    ('marrones','Colores gama marrones/beige'),
)


class Testdeproducto(models.Model):
    producto = models.ForeignKey(Producto, verbose_name='Producto asociado', on_delete=models.SET_NULL, null=True)
    tipo_piel = models.CharField(max_length=250, verbose_name='¿Para que tipo de piel?', choices=TIPO_CHOICES)
    color_piel = models.CharField(max_length=250, verbose_name='¿Para que color de piel?', choices=COLOR_CHOICES)
    paleta_color = models.CharField(max_length=250, verbose_name='¿Que tipo de colores lleva?', choices=PALETA_CHOICES)

    def __str__(self):
        return str(self.id)

    class Meta:
        db_table = 'test_producto'
        verbose_name = 'Test de producto'
        verbose_name_plural = 'Test de productos'
        ordering = ['id']
