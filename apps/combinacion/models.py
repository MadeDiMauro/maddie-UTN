from django.db import models
from apps.productos.models import Producto
from django.db.models import Sum
from django.db.models.signals import post_save, pre_delete, pre_save, post_delete
from django.core.validators import MaxValueValidator, MinValueValidator
from django.core.exceptions import ValidationError

# Create your models here.



class Combo(models.Model):
    nombre = models.CharField(max_length=100, null=False, unique=True, verbose_name='Nombre')
    descripcion = models.TextField(verbose_name='Descripción', help_text='Ingrese breve despcripción del combo')
    disponible = models.BooleanField(default=True, verbose_name='¿Está disponible?')
    pganancia = models.IntegerField(verbose_name='Porcentaje de ganancia', null=True)
    preciofinal = models.FloatField(null=True)
    stock = models.IntegerField(verbose_name='Stock disponible', default=1)
    imagen = models.ImageField(upload_to='combo/%Y/%m/%d', verbose_name='Imagen combo', null=True)

    def save(self, *args, **kwargs):
        comproducto = Comboproducto.objects.filter(combo=self)
        suma = 0
        for c in Comboproducto.objects.filter(combo=self):
            suma = suma + c.subtotal
        total = suma + (suma * self.pganancia / 100)
        self.preciofinal = total

        super(Combo, self).save(*args, **kwargs)

    def calcularprecio(self):
        comproducto = Comboproducto.objects.filter(combo=self)
        suma = 0
        for c in Comboproducto.objects.filter(combo=self):
            suma = suma + c.subtotal
        total = suma + (suma*self.pganancia/100)
        return total

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'combo'
        verbose_name = 'Box Gift'
        verbose_name_plural = 'Box Gifts'
        ordering = ['id']


class Comboproducto(models.Model):
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE, verbose_name='Producto')
    unidades = models.IntegerField(verbose_name='Unidades', default=1, validators=[MinValueValidator(1)])
    combo = models.ForeignKey(Combo, verbose_name='Combo asociado', on_delete=models.CASCADE, null=True)
    subtotal = models.FloatField(editable=False, null=True)


    def save(self, *args, **kwargs):
        multi = self.producto.preciofinal * self.unidades
        self.subtotal = multi

        super(Comboproducto, self).save(*args, **kwargs)

    def __str__(self):
        return self.combo.nombre

    class Meta:
        db_table = 'combo_producto'
        verbose_name = 'Listado de productos para Box Gifts'
        verbose_name_plural = 'Combinaciones de productos'
        ordering = ['id']

def calcular_combo_guardado(sender, instance, **kwargs):
    self = instance
    combo = Combo.objects.get(id=self.combo.id)
    combo.preciofinal = combo.calcularprecio()
    combo.save()

post_save.connect(calcular_combo_guardado, sender=Comboproducto)


def calcular_combo_eliminado(sender, instance, **kwargs):
    self = instance
    combo = Combo.objects.get(id=self.combo.id)
    combo.preciofinal = combo.calcularprecio()
    combo.save()
post_delete.connect(calcular_combo_eliminado, sender=Comboproducto)