from django.db import models

RELEVANCIA_CHOICE = (
    ('alta','Alta'),
    ('media','Media'),
    ('baja','Baja'),
)

CATEGORIA_PREGUNTA = (
    ('medios-de-pago','Medios de pago'),
    ('compras','Compras'),
    ('pedidos','Pedidos'),
    ('envios','Envios'),
    ('garantias','Garantías'),
    ('devoluciones','Devoluciones'),
    ('giftcards','Giftcards'),
    ('codigos-de-descuento','Codigos de descuento'),
    ('productos','Productos'),
    ('otros','Otros temas'),
)
# Create your models here.
class Pregfrecuentes(models.Model):
    pregunta = models.CharField(max_length=250, verbose_name='Pregunta frecuente', help_text='Ingrese en el campo la pregunta frecuente.')
    categoria = models.CharField(max_length=250, choices=CATEGORIA_PREGUNTA, verbose_name='Categoria de pregunta')
    respuesta = models.TextField(max_length=1000, verbose_name='Respuesta a la pregunta frecuente')
    relevancia = models.CharField(max_length=250, choices=RELEVANCIA_CHOICE)
    destacada = models.BooleanField(default=False, verbose_name='¿Pregunta destacada?', blank=True)

    def __str__(self):
        return self.pregunta

    class Meta:
        db_table = 'pregunta_frecuente'
        verbose_name = 'Pregunta frecuente'
        verbose_name_plural = 'Pregunas frecuentes'
        ordering = ['id']