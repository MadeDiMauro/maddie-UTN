from django.db import models

class Marca(models.Model):
    nombre = models.CharField(max_length=100, null=False, unique=True, verbose_name='Nombre')

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'marca'
        verbose_name = 'Marca'
        verbose_name_plural = 'Marcas'
        ordering = ['id']


class Modelo(models.Model):
    nombre = models.CharField(max_length=100, null=False, unique=True, verbose_name='Nombre')
    marca = models.ForeignKey(Marca, on_delete=models.CASCADE, verbose_name='Marca asociada', blank=True, null=True)


    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'modelo'
        verbose_name = 'Modelo'
        verbose_name_plural = 'Modelos'
        ordering = ['id']


class MarcaModelo(models.Model):
    marca = models.ForeignKey(Marca, on_delete=models.CASCADE, verbose_name='Marca')
    modelo = models.ForeignKey(Modelo, on_delete=models.CASCADE, verbose_name='Modelo')

    def __str__(self):
        return "Id: %d - Modelo: %s" % (self.id, self.modelo.nombre)

    class Meta:
        db_table = 'marca_modelo'
        verbose_name = 'Asignar entre marca y modelo'
        verbose_name_plural = 'Asignación de marcas y modelos'
        ordering = ['id']




class Categoria(models.Model):
    nombre = models.CharField(max_length=100, null=False, unique=True, verbose_name='Nombre')
    destacado = models.BooleanField(default=False)

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'categoria'
        verbose_name = 'Categoría'
        verbose_name_plural = 'Categorías'
        ordering = ['id']



class Calidad(models.Model):
    nivel = models.CharField(max_length=100, verbose_name='Nivel del producto')
    descripcion = models.TextField(verbose_name='Descripción', help_text='Ingrese breve despcripción sobre la calidad')

    def __str__(self):
        return self.nivel

    class Meta:
        db_table = 'calidad'
        verbose_name = 'Calidad'
        verbose_name_plural = 'Calidades'
        ordering = ['id']



