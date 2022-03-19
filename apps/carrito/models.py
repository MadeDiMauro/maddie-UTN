from django.core.validators import MinValueValidator
from django.db import models
from django.contrib.auth.models import User
from maddie.settings import BASE_URL
from django.db.models.signals import post_save
from apps.envio.funciones import enviar_email_envio
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.db.models.signals import post_delete
from django.dispatch import receiver


from apps.productos.models import Producto
from apps.envio.models import Envio
from apps.giftcard.models import Giftcard, Codigodescuento, Detallegiftcard, Detallecodigodescuento
from apps.combinacion.models import Combo
#detallenota, notapedido, pago


FORMA_CHOICES = (
    ('efectivo', 'Efectivo'),
    ('transferencia', 'Transferencia'),
    ('mercadopago', 'Mercado Pago')
)

PAGO_CHOICES = (
    ('efectivo', 'Efectivo'),
    ('cbu','CBU Transferencia'),
    ('credit_card', 'Tarjeta de crédito'),
    ('debit_card', 'Tarjeta de débito'),
    ('prepaid_card', 'Tarjeta prepaga'),
)

ESTADO_CHOICES = (
    ('aprobado','Aprobado'),
    ('pendiente','Pendiente'),
    ('rechazado','Rechazado'),
)

class Pago(models.Model):
    formapago = models.CharField(max_length=200, verbose_name='Forma de pago', choices=FORMA_CHOICES)
    tipopago = models.CharField(max_length=200, verbose_name='Tipo de pago', choices=PAGO_CHOICES, null=True)
    id_pagomp = models.CharField(max_length=300, verbose_name='Id de pago - Mercado Pago', default='No aplica', null=True, blank=True)
    fechapago = models.DateField(verbose_name='Fecha de pago', null=True)
    confirmado = models.BooleanField(verbose_name='¿Pago recibido?', default=False)
    url_mp = models.URLField(null=True, editable=False, default=None)
    estado = models.CharField(max_length=300, null=True, verbose_name='Estado del pago', choices=ESTADO_CHOICES, default='pendiente')

    def save(self, *args, **kwargs):
        if self.confirmado is True:
            self.estado = 'aprobado'
        if self.confirmado is False:
            self.estado = 'pendiente'
        super(Pago, self).save(*args, *kwargs)

    def __str__(self):
        return str(self.id)

    class Meta:
        db_table = 'pago'
        verbose_name = 'Pago'
        verbose_name_plural = 'Pagos'
        ordering = ['id']

    def save(self, *args, **kwargs):
        if self.confirmado is True:
            self.estado = 'aprobado'

        super(Pago, self).save(*args, **kwargs)




ESTADO_CHOICES = (
    ('preparado','Preparado'),
    ('sin_preparar', 'Sin preparar'),
)

PEDIDO_CHOICES = (
    ('pendiente','Pendiente'),
    ('finalizado','Finalizado'),
    ('cancelado', 'Cancelado')
)

class Pedido(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='Usuario')
    confirmado = models.BooleanField(default=True, null=True, verbose_name='¿El pedido está confirmado?')
    estado_armado = models.CharField(max_length=250, default='sin_preparar', choices=ESTADO_CHOICES,verbose_name='Estado del pedido', null=True)
    creacion = models.DateTimeField(auto_now_add=True, verbose_name='Fecha de creación')
    montofinal = models.FloatField(editable=False, verbose_name='Monto final del pedido', default=0, validators=[MinValueValidator(limit_value=0, message='El monto tiene que ser mayor o igual 0.')])
    pago = models.OneToOneField(Pago, on_delete=models.CASCADE, verbose_name='Pago N°', null=True)
    estado = models.CharField(max_length=250, null=True, default='pendiente', choices=PEDIDO_CHOICES,
                              verbose_name='Estado del pedido')
    envio = models.ForeignKey(Envio, on_delete=models.CASCADE, verbose_name='Envío N°', null=True)
    recibido = models.BooleanField(default=False, null=True, verbose_name='¿Pedido recibido por el cliente?')
    codigo_descuento = models.OneToOneField(Detallecodigodescuento, null=True, on_delete=models.SET_NULL)
    giftcard_descuento = models.OneToOneField(Detallegiftcard, null=True, on_delete=models.SET_NULL)


    def __str__(self):
        return str(self.id)

    class Meta:
        db_table = 'pedido'
        verbose_name = 'Pedido'
        verbose_name_plural = 'Pedidos'
        ordering = ['id']

def eliminar_relacionados(sender, instance, **kwargs):
    pedido = instance

    if pedido.envio is not None:
        envio = Envio.objects.get(id=pedido.envio.id)
        envio.delete()

    if pedido.pago is not None:
        pago = Pago.objects.get(id=pedido.pago.id)
        pago.delete()

    if pedido.codigo_descuento is not None:
        codigo = Detallecodigodescuento.objects.get(id=pedido.codigo_descuento.id)
        codigo.delete()

    if pedido.giftcard_descuento is not None:
        giftcard = Detallegiftcard.objects.get(id=pedido.giftcard_descuento.id)
        giftcard.delete()

    token = Token.objects.filter(pedido=pedido)
    if token:
        for t in token:
            t.delete()

post_delete.connect(eliminar_relacionados, sender=Pedido)


def enviar_mail_nro_track(sender, instance, **kwargs):
    envio = instance
    if envio.estado == True and envio.codigo_seguimiento != None:
        usuario = envio.usuario
        envio_id = envio.id
        print('ingresó')
        pedido = Pedido.objects.get(usuario=usuario, envio_id=envio_id)
        pedido.estado = 'finalizado'
        pedido.save()

        token_generator = PasswordResetTokenGenerator()
        token = token_generator.make_token(pedido.usuario)
        url = BASE_URL+'/validar/token?token='+str(token)
        Token.objects.create(usuario=pedido.usuario, token=token, pedido=pedido, evento='recepcion_pedido')

        enviar_email_envio(
                pedido=pedido,
                codigo_seguimiento=envio.codigo_seguimiento,
                usuario_email=pedido.usuario.email,
                usuario_nombre=pedido.usuario.first_name,
                token=url,)

post_save.connect(enviar_mail_nro_track, sender=Envio)

#Listado de pedido asociado con los giftcards comprados
class Detallepedidogiftcard(models.Model):
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)
    detallegift = models.ForeignKey(Detallegiftcard, on_delete=models.CASCADE)

    class Meta:
        db_table = 'detalle_pedido_giftcards'
        verbose_name = 'Detalle del giftcard pedido'
        verbose_name_plural = 'Detalles de los giftcards pedidos'
        ordering = ['id']


TIPO_COMPRA_CHOICES = (
    ('producto','Producto'),
    ('giftcard','Gift Card'),
    ('combo','Box Gift'),
)

class Detallepedido(models.Model):
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE, verbose_name='Pedido')
    tipo_detalle = models.CharField(max_length=250, default='producto', verbose_name='Tipo de detalle', choices=TIPO_COMPRA_CHOICES, null=True)
    producto = models.ForeignKey(Producto, max_length=250, on_delete=models.CASCADE, null=True, blank=True, verbose_name='Producto normal')
    giftcard = models.ForeignKey(Giftcard, max_length=250, on_delete=models.CASCADE, null=True, blank=True, verbose_name='Giftcard para regalar')
    combo = models.ForeignKey(Combo, on_delete=models.CASCADE, max_length=250, null=True, blank=True, verbose_name='Box Gift de productos')
    cantidad = models.IntegerField(default=1)
    precio_venta_unitario = models.FloatField(default=0, verbose_name='Precio de venta', null=True)
    subtotal = models.FloatField(default=0, verbose_name='Subtotal', null=True)
    creacion = models.DateTimeField(auto_now_add=True)


    def get_subtotal_producto(self):
        return self.precio_venta_unitario * self.cantidad

    def get_subtotal_combo(self):
        return self.precio_venta_unitario * self.cantidad

    def get_subtotal_giftcard(self):
        return self.precio_venta_unitario * self.cantidad

    def __str__(self):
        return f'{self.cantidad} de {self.tipo_detalle}'

    class Meta:
        db_table = 'detalle_pedido'
        verbose_name = 'Detalle del pedido'
        verbose_name_plural = 'Detalles del pedido'
        ordering = ['id']


TIPO_TOKEN_CHOICES = (
    ('recepcion_pedido','Recepción del pedido'),
    ('giftcards_asociados','Giftcards asociados'),
    ('ver_pedido','Ver pedido')
)


class Token(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    token = models.CharField(max_length=300)
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE, null=True)
    evento = models.CharField(max_length=300, choices=TIPO_TOKEN_CHOICES)

    def __str__(self):
        return str(self.pedido.id)

    class Meta:
        db_table = 'token'
        verbose_name = 'Token'
        verbose_name_plural = 'Tokens'
        ordering = ['id']