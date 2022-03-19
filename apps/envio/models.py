from django.core.validators import MinValueValidator
from django.core import validators
from django.db import models
from apps.ubicacion.models import *
from django.contrib.auth.models import User
# envio, transporte

TIPO_CHOICES = (
       ('provincial','Tipo provincial'),
       ('nacional', 'Tipo nacional'),
       ('de_ciudad','Transporte del tipo ciudad'),
       ('internacional','Transporte del tipo internacional'),
       ('ninguno', 'Ninguno')
)

class Transporte(models.Model):
    nombre = models.CharField(max_length=250, null=False, unique=True, verbose_name='Nombre')
    tipo = models.CharField(max_length=100, null=True, choices=TIPO_CHOICES, default='ninguno', verbose_name="Tipo")
    direccion = models.CharField(max_length=250, null=False, unique=True, verbose_name='Direccion sede')
    telefono = models.IntegerField(null=False, verbose_name="Número de contac.")
    email = models.EmailField(max_length=250, null=False, verbose_name="Email")
    provincia = models.ForeignKey(Provincia, on_delete=models.CASCADE, null=True, verbose_name='Provincia')
    ciudad = models.ForeignKey(Ciudad, on_delete=models.CASCADE, null=True, verbose_name='Ciudad')
    plazo_entrega = models.CharField(max_length=250, null=True, blank=True, verbose_name='Plazo de entrega habitual')
    precio_servicio = models.FloatField(default=0, null=True, verbose_name='Precio del servicio Standard')

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'transporte'
        verbose_name = 'Transporte'
        verbose_name_plural = 'Transportes'
        ordering = ['id']

class Envio(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='Usuario asociado')
    direccion = models.CharField(max_length=250, null=False, verbose_name='Direccion')
    celular = models.CharField(max_length=300, null=True, verbose_name='Celular de contacto')
    provincia = models.ForeignKey(Provincia, on_delete=models.CASCADE, verbose_name='Provincia')
    ciudad = models.ForeignKey(Ciudad, on_delete=models.CASCADE, verbose_name='Ciudad')
    estado = models.BooleanField(default=False, verbose_name='¿Fue enviado?')
    codigo_seguimiento = models.CharField(max_length=100, null=True, verbose_name='Código de seguimiento del envío', unique=True)
    precio_envio = models.FloatField(verbose_name='Precio del envío', default=0, validators=[MinValueValidator(limit_value=0, message='El monto tiene que ser mayor o igual 0.')])
    transporte = models.ForeignKey(Transporte, on_delete=models.CASCADE)

    def clean(self):
        if self.codigo_seguimiento is not None:
            if len(self.codigo_seguimiento) < 8:
                raise validators.ValidationError('Debe ingresar un código de seguimiento válido')

    def save(self, *args, **kwargs):
        if self.codigo_seguimiento is not None and len(self.codigo_seguimiento) >= 8:
            self.estado = True

        super(Envio, self).save(*args, **kwargs)

    def __str__(self):
        return str(self.id)

    def destinatario(self):
        return self.usuario.username

    class Meta:
        db_table = 'envio'
        verbose_name = 'Envío'
        verbose_name_plural = 'Envíos'
        ordering = ['id']


