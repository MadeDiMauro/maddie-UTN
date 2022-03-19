from django.db import models
from django.contrib.auth.models import User
from apps.ubicacion.models import Provincia, Ciudad
from django.contrib.auth.models import AbstractUser
# Create your models here.


from django.contrib.auth.models import User
User._meta.get_field('email')._unique = True

#USUARIO, SESION

SEXO_CHOICES = (
    ('femenino','Femenino'),
    ('masculino', 'Masculino'),
    ('otro','Otro'),
)

TIPO_USUARIO = (
    ('consumidor_final','Consumidor final'),
    ('responsable_inscripto','Responsable inscripto'),
    ('monotributista', 'Monotributista')
)

class Perfilusuario(models.Model):
    usuario = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)
    dni = models.IntegerField(verbose_name='DNI o CUIT', null=True, unique=True)
    tipo_usuario = models.CharField(max_length=100, verbose_name='Tipo de usuario', choices=TIPO_USUARIO, null=True, default='consumidor_final')
    fnacimiento = models.DateField(null=True, verbose_name='Fecha de nacimiento')
    sexo = models.CharField(max_length=100, choices=SEXO_CHOICES, null=True, verbose_name='Sexo', default='otro')
    provincia = models.ForeignKey(Provincia, on_delete=models.CASCADE, default='Tierra del Fuego',verbose_name='Provincia')
    ciudad = models.ForeignKey(Ciudad, on_delete=models.CASCADE, verbose_name='Ciudad', default='Rio Grande')
    fotoperfil = models.ImageField(upload_to='perfil-foto/%Y/%m/%d/', blank=True, null=True, verbose_name='Foto de perfil')

    def username(self):
        return self.usuario.username

    def first_name(self):
        return self.usuario.first_name

    def last_name(self):
        return self.usuario.last_name

    def email(self):
        return self.usuario.email

    def is_active(self):
        return self.usuario.is_active

    def __str__(self):
        return self.usuario.first_name

    class Meta:
        db_table = 'perfil_usuario'
        verbose_name = 'Perfil de usuario'
        verbose_name_plural = 'Perfil de usuarios'
        ordering = ['id']

class Direcciones(models.Model):
    usuario = models.ForeignKey(Perfilusuario, on_delete=models.CASCADE, null=True)
    telefono = models.CharField(max_length=150, verbose_name='Telefono/Celular')
    direccion = models.CharField(max_length=200, verbose_name='Dirección')
    numero = models.IntegerField(verbose_name='Número de casa')
    piso_departamento = models.CharField(max_length=100, verbose_name='Piso y departamento', blank=True)
    provincia = models.ForeignKey(Provincia, on_delete=models.CASCADE, default='Tierra del Fuego')
    ciudad = models.ForeignKey(Ciudad, on_delete=models.CASCADE, default='Rio Grande')
    destacada = models.BooleanField(default=False, blank=True)

    def __str__(self):
        return self.usuario.usuario.first_name

    class Meta:
        db_table = 'direccion_usuario'
        verbose_name = 'Dirección usuario'
        verbose_name_plural = 'Libreta de direcciones'
        ordering = ['id']


class Consulta(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    motivo = models.CharField(max_length=300, verbose_name='Motivo del mensaje')
    mensaje = models.TextField(max_length=600, verbose_name='Consulta de usuario')
    fecha = models.DateField(auto_now_add=True, verbose_name='Fecha del mensaje', null=True)
    respondida = models.BooleanField(null=True, verbose_name='Respondida', default=False)

    def __str__(self):
        return self.usuario.first_name

    class Meta:
        db_table = 'consulta_usuario'
        verbose_name = 'Consulta del usuario'
        verbose_name_plural = 'Consultas del usuario'
        ordering = ['id']


class Respuesta(models.Model):
    consulta = models.OneToOneField(Consulta, on_delete=models.SET_NULL, null=True, verbose_name='Consulta del usuario')
    mensaje = models.TextField(verbose_name='Mensaje de respuesta', max_length=600)
    fecha = models.DateField(auto_now_add=True, verbose_name='Fecha de respuesta', null=True)
    visto_mensaje = models.BooleanField(default=False, verbose_name='Mensaje visto', blank=True)

    def save(self, *args, **kwargs):
        if self.mensaje is not None:
            self.consulta.respondida = True
            self.consulta.save()
            self.visto_mensaje = True
        super(Respuesta, self).save(*args, **kwargs)


    def __str__(self):
        return self.consulta.usuario.first_name

    class Meta:
        db_table = 'respuesta_usuario'
        verbose_name = 'Respuesta para el usuario'
        verbose_name_plural = 'Respuestas para el usuario'
        ordering = ['id']
