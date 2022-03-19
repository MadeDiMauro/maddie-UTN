from django.db import models
from django.contrib.auth.models import User
from apps.productos.models import Producto
# lovelist, loveproducto

class Lovelist(models.Model):
    nombre = models.CharField(max_length=150, verbose_name='Nombre del Love List', default='Mi Lovelist ❤')
    usuario = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name='Usuario asociado')

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'lovelist'
        verbose_name = 'Love listado'
        verbose_name_plural = 'Love listados'
        ordering = ['id']

class Loveproducto(models.Model):
    lovelist = models.ForeignKey(Lovelist, on_delete=models.CASCADE, null=True)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.lovelist.nombre

    class Meta:
        db_table = 'lovelist_producto'
        verbose_name = 'Listado de productos'
        verbose_name_plural = 'Listado de productos'
        ordering = ['id']