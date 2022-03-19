import time
from datetime import date
from datetime import datetime
from django.core.mail import send_mail
from apps.server_mail import send_mail
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from maddie.settings import BASE_URL

#Permite enviar correos electronicos
from email.mime.image import MIMEImage
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

from django.template.loader import render_to_string #Para poder enviar una cadena al enviar correos electronicos
from django.utils.html import strip_tags #Util para sanitizar información
from apps.envio.models import Transporte, Envio
from apps.autenticacion.models import Perfilusuario, Direcciones
from apps.giftcard.models import Codigodescuento, Giftcard, Detallegiftcard, Detallecodigodescuento
from apps.carrito.models import Pedido, Detallepedido, Pago, Detallepedidogiftcard
from apps.productos.models import Producto
from apps.combinacion.models import Combo
from apps.recomendados.models import Recomendados
from apps.carrito.models import Token

today = date.today()

#Fecha actual
now = datetime.now()

def crear_envio(transporte_id, direccion_id, perfil_id):
    transporte = Transporte.objects.get(id=transporte_id)
    perfil = Perfilusuario.objects.get(id=perfil_id)
    direccion = Direcciones.objects.get(id=direccion_id, usuario=perfil)

    envio = Envio.objects.create(
        usuario=perfil.usuario,
        direccion='Calle '+str(direccion.direccion)+' '+str(direccion.numero)+'. Piso/Dpto: '+str(direccion.piso_departamento),
        celular=direccion.telefono,
        provincia=direccion.provincia,
        ciudad=direccion.ciudad,
        estado=False,
        precio_envio=transporte.precio_servicio,
        transporte=transporte,
    )
    return envio

def existe_codigo_descuento(codigo_descuento_id):
    if codigo_descuento_id:
        codigo = Codigodescuento.objects.filter(id=codigo_descuento_id)
        if codigo:
            codigo = Codigodescuento.objects.get(id=codigo_descuento_id)
            if today >= codigo.fecha_inicio and today <= codigo.fecha_fin:
                return codigo.valor
            else:
                return 0
        else:
            return 0
    else:
        return 0

def existe_giftcard(giftcard_id, giftcar_nro_tarjeta, giftcard_cod_seg):
    if giftcard_id:
        detalle_giftcard = Detallegiftcard.objects.filter(id=giftcard_id, nro_tarjeta__exact=giftcar_nro_tarjeta, codigo_seguridad__exact=giftcard_cod_seg, usado=False)
        if detalle_giftcard:
            detalle_giftcard = Detallegiftcard.objects.get(id=giftcard_id, nro_tarjeta__exact=giftcar_nro_tarjeta, codigo_seguridad__exact=giftcard_cod_seg, usado=False)
            detalle_giftcard.usado = True
            detalle_giftcard.save()
            return detalle_giftcard.giftcard.preciofinal
        else:
            return 0
    else:
        return 0

def crear_pedido(perfil, montofinal, envio, codigo_descuento, descuento, giftcard_descuento):
    envio = Envio.objects.get(id=envio.id)
    if codigo_descuento:
        codigo = Detallecodigodescuento.objects.create(usuario=perfil, codigo=codigo_descuento, codigo_texto=codigo_descuento.codigo, porcentaje=codigo_descuento.valor, descuento_aplicado=descuento)
    else:
        codigo = None

    if giftcard_descuento:
        giftcard = giftcard_descuento
    else:
        giftcard = None

    pedido = Pedido.objects.create(
        usuario=perfil.usuario,
        confirmado=True,
        montofinal=montofinal,
        envio=envio,
        codigo_descuento=codigo,
        giftcard_descuento=giftcard,
    )

    return pedido


def actualizar_stock(Tipo, item_id, cantidad):
    item = Tipo.objects.get(id=item_id)
    item.stock = item.stock - cantidad
    item.save(update_fields=['stock'])


def recomendados(producto_id, cantidad):
    recomendado = Recomendados.objects.filter(producto_id=producto_id)
    if recomendado:
        recomendado = Recomendados.objects.get(producto_id=producto_id)
        cantidad = recomendado.cantidad + cantidad
        recomendado.cantidad = cantidad
        recomendado.fecha = datetime.now()
        recomendado.save()
    else:
        Recomendados.objects.create(producto_id=producto_id, cantidad=cantidad, fecha=datetime.now())


def asignar_detalle_giftcard(usuario, giftcard, pedido, cantidad):
    gift = Giftcard.objects.get(id=giftcard)

    for i in range(cantidad):
        detalle_giftcard = Detallegiftcard.objects.create(usuario=usuario, giftcard_id=giftcard, valor_descuento=gift.preciofinal)
        detalle_giftcard.nro_tarjeta = detalle_giftcard.numero_tarj()
        detalle_giftcard.codigo_seguridad = detalle_giftcard.cod_seguridad()
        detalle_giftcard.save()
        Detallepedidogiftcard.objects.create(pedido=pedido, detallegift=detalle_giftcard)
        print('Valor de i:',i)


def crear_detalle_pedido(pedido, cart, perfil):
    detallepedidos = list()
    # Recorremos el carrito con el pedido

    for key, value in cart.cart.items():
        if value["tipo"] == 'producto':
            p = Producto.objects.get(id=value["producto_id"])
            detallepedidos.append(
                Detallepedido(
                    producto_id=value["producto_id"],
                    tipo_detalle=value["tipo"],
                    cantidad=value["cantidad"],
                    precio_venta_unitario=p.preciofinal,
                    subtotal=p.preciofinal*value["cantidad"],
                    pedido=pedido,
                )
            )
            # Actualiza stock
            actualizar_stock(Producto, value["producto_id"], value["cantidad"])
            recomendados(value["producto_id"], value["cantidad"])


        if value["tipo"] == 'combo':
            c = Combo.objects.get(id=value["combo_id"])
            detallepedidos.append(
                Detallepedido(
                    combo_id=value["combo_id"],
                    tipo_detalle=value["tipo"],
                    cantidad=value["cantidad"],
                    precio_venta_unitario=c.preciofinal,
                    subtotal=c.preciofinal * value["cantidad"],
                    pedido=pedido,
                )
            )
            # Actualiza stock
            actualizar_stock(Combo, value["combo_id"], value["cantidad"])


        if value["tipo"] == 'giftcard':
            g = Giftcard.objects.get(id=value["giftcard_id"])
            detallepedidos.append(
                Detallepedido(
                    giftcard_id=value["giftcard_id"],
                    tipo_detalle=value["tipo"],
                    cantidad=value["cantidad"],
                    precio_venta_unitario=g.preciofinal,
                    subtotal=g.preciofinal * value["cantidad"],
                    pedido=pedido,
                )
            )
            # Actualiza stock
            actualizar_stock(Giftcard, value["giftcard_id"], value["cantidad"])
            cantidad = value["cantidad"]
            asignar_detalle_giftcard(perfil,  value["giftcard_id"], pedido, cantidad)


    # Crear con bulk create, multiples registros en un solo paso en bd, pasando un listado
    Detallepedido.objects.bulk_create(detallepedidos)

    return detallepedidos


#Funcion para enviar mail
def enviar_email_pedido(**kwargs):
    mailServer = send_mail()
    motivo = "Gracias por tu pedido"
    destinatario = "maddiemakeuprg@gmail.com"
    para = kwargs.get("usuario_email")
    mensaje = MIMEMultipart()
    mensaje['From'] = destinatario
    mensaje['To'] = para
    mensaje['Subject'] = motivo

    pedido = kwargs.get("pedido")
    token_generator = PasswordResetTokenGenerator()
    token = token_generator.make_token(pedido.usuario)
    url = BASE_URL + '/validar/token?token=' + str(token)
    Token.objects.create(usuario=pedido.usuario, token=token, pedido=pedido, evento='ver_pedido')

    content = render_to_string("emails/pedidos/plantilla_nuevo_pedido.html",{
        "pedido": kwargs.get("pedido"),
        "detallepedidos": kwargs.get("detallepedidos"),
        "usuario_nombre": kwargs.get("usuario_nombre"),
        "fecha":datetime.now(),
        "token":url,
    })
    mensaje.attach(MIMEText(content, 'html'))
    #archivo_plano = strip_tags(html_message)
    mailServer.sendmail(destinatario, para, mensaje.as_string())