from django.db import models

# Create your models here.
class Provincia(models.Model):
    nombre = models.CharField(max_length=100, null=False, unique=True, verbose_name='Nombre')

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'provincia'
        verbose_name = 'Provincia'
        verbose_name_plural = 'Provincias'
        ordering = ['id']


class Cpostal(models.Model):
    codigo = models.CharField(max_length=100, null=False, verbose_name='Código asociado')

    def __str__(self):
        return self.codigo

    class Meta:
        db_table = 'codigo_postal'
        verbose_name = 'Código postal'
        verbose_name_plural = 'Códigos postales'
        ordering = ['id']

class Ciudad(models.Model):
    nombre = models.CharField(max_length=100, null=False, verbose_name='Nombre')
    provincia = models.ForeignKey(Provincia, on_delete=models.CASCADE, verbose_name='Provincia')
    cpostal = models.ForeignKey(Cpostal, on_delete=models.CASCADE, null=True, verbose_name='Código Postal')

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'ciudad'
        verbose_name = 'Ciudad'
        verbose_name_plural = 'Ciudades'
        ordering = ['id']
