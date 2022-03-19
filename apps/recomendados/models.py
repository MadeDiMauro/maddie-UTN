from django.db import models
from apps.productos.models import Producto


class Recomendados(models.Model):
    producto = models.ForeignKey(Producto, on_delete=models.SET_NULL, verbose_name='Producto', null=True)
    cantidad = models.IntegerField(verbose_name='Cantidad de articulos')
    fecha = models.DateField(auto_now_add=True, verbose_name='Fecha')

    def __str__(self):
        return self.producto.nombre

    class Meta:
        db_table = 'recomendados'
        verbose_name = 'Recomendado y más pedido'
        verbose_name_plural = 'Recomendados y más pedidos'
        ordering = ['id']