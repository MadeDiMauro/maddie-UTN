from django.db import models
from apps.categorizacion.models import *
from apps.proveedores.models import *
from django.core.validators import MinValueValidator
from django.urls import reverse
from django.db.models import F, Sum, FloatField

# Create your models here.



class Producto(models.Model):
    nombre = models.CharField(max_length=300, verbose_name='Nombre')
    slug = models.SlugField(null=True, blank=True)
    calidad = models.ForeignKey(Calidad, on_delete=models.CASCADE, verbose_name='Calidad')
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE, verbose_name='Categoría')
    marca = models.ForeignKey(Marca, on_delete=models.CASCADE, verbose_name='Marca')
    modelo = models.ForeignKey(Modelo, on_delete=models.CASCADE, verbose_name='Modelo')
    descripcion = models.TextField(max_length=1000, verbose_name='Descripción del producto', help_text='Ingrese breve despcripción del producto')
    resumen = models.TextField(max_length=200, verbose_name='Detalle', null=True)
    destacado = models.BooleanField(default=False, verbose_name='Destacado', help_text='¿El producto es destacado?')
    stock = models.IntegerField(verbose_name='Stock disponible', default=1)
    fechaprecio = models.DateField(verbose_name='Fecha del precio', null=True, auto_now_add=True)
    preciocosto = models.FloatField(verbose_name='Precio de costo', default=0, null=True, validators=[MinValueValidator(limit_value=0, message='El precio tiene que ser mayor o igual 0.')])
    ganancia = models.IntegerField(verbose_name='% de ganancia', null=True, default=0, validators=[MinValueValidator(limit_value=0, message='La ganancia debe ser mayor o igual 0.')])
    valorenvio = models.IntegerField(verbose_name='% de envio', null=True, default=0, validators=[MinValueValidator(limit_value=0, message='El porcentaje debe ser mayor o igual 0.')])
    preciofinal = models.FloatField(editable=False, null=True)
    disponible = models.BooleanField(default=True, null=True, verbose_name='¿Está disponible?')
    imagen1 = models.ImageField(upload_to='imagenes/%Y/%m/%d', blank=True, null=True, verbose_name='Imagen N°1')
    imagen2 = models.ImageField(upload_to='imagenes/%Y/%m/%d', blank=True, null=True, verbose_name='Imagen N°2')
    imagen3 = models.ImageField(upload_to='imagenes/%Y/%m/%d', blank=True, null=True, verbose_name='Imagen N°3')

    def save(self, *args, **kwargs):
        precio_costo = self.preciocosto
        envio = self.valorenvio
        ganancia = self.ganancia

        print(precio_costo)
        print(envio)
        print(ganancia)

        nuevo_precio = precio_costo + (precio_costo * ganancia / 100) + (precio_costo * envio / 100)
        self.preciofinal = nuevo_precio
        super(Producto, self).save(*args, **kwargs)

    def get_absolute_url(self):
     return reverse('detalle_producto', args=[self.id, self.slug])


    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'producto'
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'
        ordering = ['id']


class Productoproveedor(models.Model):
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE, verbose_name='Producto')
    proveedor = models.ForeignKey(Proveedor, on_delete=models.CASCADE, verbose_name='Proveedor')

    class Meta:
        db_table = 'producto_proveedor'
        verbose_name = 'Proveedor'
        verbose_name_plural = 'Proveedores'
        ordering = ['id']




