from django.db import models
from django.core.validators import MinValueValidator
from django.core import validators
from django.db.models import F, Sum, FloatField
from apps.autenticacion.models import Perfilusuario
import random
# Create your models here.
from django.db.models import Sum


class Codigodescuento(models.Model):
    codigo = models.CharField(max_length=250, verbose_name='Código de descuento', unique=True)
    nombre = models.CharField(max_length=250, verbose_name='Nombre del descuento')
    valor = models.IntegerField(null=True, verbose_name='Descuento %', help_text='Rellenar el campo con el procentaje de descuento', blank=True, default=0, validators=[MinValueValidator(limit_value=0, message='El monto tiene que ser mayor o igual 0.')])
    fecha_inicio = models.DateField(verbose_name='Fecha de inicio (Comienzo)')
    fecha_fin = models.DateField(verbose_name='Fecha fin (Caducidad)')

    def clean(self):
        if self.fecha_fin < self.fecha_inicio or self.fecha_inicio > self.fecha_fin:
            raise validators.ValidationError('Verificar las fechas, la fecha inicio debe ser menor que la fecha final')


    def __str__(self):
        return self.codigo

    class Meta:
        db_table = 'codigo_descuento'
        verbose_name = 'Código de descuento'
        verbose_name_plural = 'Códigos de descuento'
        ordering = ['id']

class Detallecodigodescuento(models.Model):
    usuario = models.ForeignKey(Perfilusuario, on_delete=models.SET_NULL, null=True, verbose_name='Usuario')
    codigo = models.ForeignKey(Codigodescuento, on_delete=models.SET_NULL, null=True, verbose_name='Código asociado')
    fecha = models.DateField(auto_now_add=True)
    codigo_texto = models.CharField(max_length=300, verbose_name='Código aplicado', null=True)
    porcentaje = models.IntegerField(verbose_name='Porcentaje aplicado')
    descuento_aplicado = models.FloatField(verbose_name='Descuento aplicado en el pedido', null=True)

    def __str__(self):
        return str(self.usuario.usuario.first_name)

    class Meta:
        db_table = 'detalle_codigodescuento'
        verbose_name = 'Listado de códigos aplicados'
        verbose_name_plural = 'Listados de códigos aplicados'
        ordering = ['id']


class Giftcard(models.Model):
    nombre = models.CharField(max_length=250, verbose_name='Nombre')
    descripcion = models.TextField(max_length=400, verbose_name='Descripción')
    slug = models.SlugField(verbose_name='Slug -> Url amigable')
    preciofinal = models.IntegerField(default=0, verbose_name='Precio del Giftcard')
    disponible = models.BooleanField(default=True, null=True, verbose_name='¿Está disponible?')
    stock = models.IntegerField(verbose_name='Stock disponible', default=1)
    temporada = models.CharField(max_length=250, verbose_name='Temporada del GiftCard', blank=True, null=True)
    imagen = models.ImageField(upload_to='giftcard/%Y/%m/%d', verbose_name='Imagen del giftcard', null=True, blank=True)
    imagen2 = models.ImageField(upload_to='giftcard/%Y/%m/%d', verbose_name='Imagen 2 del giftcard', null=True, blank=True)

    def monto_precio(self):
        return self.precio

    def __str__(self):
        return str(self.nombre)

    class Meta:
        db_table = 'gift_card'
        verbose_name = 'Gift Card'
        verbose_name_plural = 'Gift Cards'
        ordering = ['id']

class Detallegiftcard(models.Model):
    usuario = models.ForeignKey(Perfilusuario, on_delete=models.SET_NULL, null=True, verbose_name='Usuario asociado')
    giftcard = models.ForeignKey(Giftcard, on_delete=models.SET_NULL, null=True, verbose_name='Giftcard asociado')
    creacion = models.DateTimeField(auto_now_add=True, verbose_name='Fecha de creación', null=True)
    usado = models.BooleanField(verbose_name='¿Ya fué utilizado?', default=False)
    valor_descuento = models.FloatField(default=0, verbose_name='Descuento aplicado en $', null=True)
    nombre_amigo = models.CharField(max_length=250, verbose_name='Ingresa el nombre del amigo', null=True, blank=True)
    correo_amigo = models.EmailField(max_length=300, verbose_name='Email del amigo', null=True, blank=True)
    nro_tarjeta = models.IntegerField(null=True)
    codigo_seguridad = models.IntegerField(null=True)

    def numero_tarj(self):
        n1 = random.choice((1, 2, 3, 4, 5, 6, 7, 8, 9))
        n2 = random.choice((1, 2, 3, 4, 5, 6, 7, 8, 9))
        n3 = random.choice((1, 2, 3, 4, 5, 6, 7, 8, 9))
        n4 = random.choice((1, 2, 3, 4, 5, 6, 7, 8, 9))
        n5 = random.choice((1, 2, 3, 4, 5, 6, 7, 8, 9))
        n6 = random.choice((1, 2, 3, 4, 5, 6, 7, 8, 9))
        n7 = random.choice((1, 2, 3, 4, 5, 6, 7, 8, 9))
        n8 = random.choice((1, 2, 3, 4, 5, 6, 7, 8, 9))
        numero = str(n1)+str(n2)+str(n3)+str(n4)+str(n5)+str(n6)+str(n7)+str(n8)
        return numero

    def cod_seguridad(self):
        n1 = random.choice((1, 2, 3, 4, 5, 6, 7, 8, 9))
        n2 = random.choice((1, 2, 3, 4, 5, 6, 7, 8, 9))
        n3 = random.choice((1, 2, 3, 4, 5, 6, 7, 8, 9))
        seguridad = str(n1)+str(n2)+str(n3)
        return seguridad

    def __str__(self):
        return str(self.usuario.usuario.first_name)

    class Meta:
        db_table = 'detalle_giftcard'
        verbose_name = 'Listado de Gift Card'
        verbose_name_plural = 'Listados de Giftcards'
        ordering = ['id']
