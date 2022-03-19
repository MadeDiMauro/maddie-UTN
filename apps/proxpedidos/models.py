from django.db import models

# Create your models here.
class Proxpedidos(models.Model):
    titulo = models.CharField(max_length=250, verbose_name='Título')
    fecha_d = models.DateField(verbose_name='Fecha desde')
    fecha_h = models.DateField(verbose_name='Fecha hasta')
    listado = models.TextField(max_length=1500, verbose_name='Listado de productos')
    detalles = models.TextField(max_length=400, verbose_name='Detalles del pedido')
    link_publicacion = models.URLField(verbose_name='Link de publicación - Fotos en Instagram')

    def __str__(self):
        return self.titulo

    class Meta:
        db_table = 'proximos-pedidos'
        verbose_name = 'Proximo pedido'
        verbose_name_plural = 'Próximos pedidos'
        ordering = ['id']