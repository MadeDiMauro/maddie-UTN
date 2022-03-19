from apps.server_mail import send_mail
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from django.template.loader import render_to_string
from apps.autenticacion.models import Perfilusuario
from apps.carrito.models import Pedido, Pago, Token, Detallepedido
from maddie.settings import BASE_URL
from django.db.models.signals import post_save
from django.contrib.auth.tokens import PasswordResetTokenGenerator


def enviar_email_transferencia(**kwargs):
    mailServer = send_mail()
    motivo = "Datos para realizar transferencia"
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


    content = render_to_string("emails/pedidos/plantilla_datos_transferencia.html",{
        "pedido": kwargs.get("pedido"),
        "usuario_nombre": kwargs.get("usuario_nombre"),
        "token":url,
    })
    mensaje.attach(MIMEText(content, 'html'))
    #archivo_plano = strip_tags(html_message)
    mailServer.sendmail(destinatario, para, mensaje.as_string())

def enviar_email_giftcards(**kwargs):
    user = kwargs.get("user")
    perfil = Perfilusuario.objects.get(usuario=user)
    mailServer = send_mail()
    motivo = "Tienes giftcards sin asociar a tus amigos"
    destinatario = "maddiemakeuprg@gmail.com"
    para = perfil.usuario.email

    mensaje = MIMEMultipart()
    mensaje['From'] = destinatario
    mensaje['To'] = para
    mensaje['Subject'] = motivo

    content = render_to_string("emails/pedidos/plantilla_giftcards_asociar.html",{
        "pedido": kwargs.get("pedido"),
        "token": kwargs.get("token")
    })
    mensaje.attach(MIMEText(content, 'html'))
    mailServer.sendmail(destinatario, para, mensaje.as_string())


#Generación de token para mostrar pedido en email
def enviar_mail_pago(sender, instance, **kwargs):
    pago = instance
    pedido = Pedido.objects.filter(pago=pago)
    if pago.confirmado is True and pedido:
        pedido = Pedido.objects.get(pago=pago)

        if pago.formapago == 'transferencia' or pago.formapago == 'mercadopago':
            pedido.estado = 'pendiente'
            pedido.save()
            # Cuando se concreta el pago se envian los giftcards al usuario asociado
            detalle = Detallepedido.objects.filter(pedido=pedido, giftcard__isnull=False)
            if detalle:
                token_generator = PasswordResetTokenGenerator()
                token = token_generator.make_token(pedido.usuario)
                url = BASE_URL + '/validar/token?token=' + str(token)
                Token.objects.create(usuario=pedido.usuario, token=token, pedido=pedido, evento='giftcards_asociados')

                enviar_email_giftcards(user=pedido.usuario,
                                   pedido=pedido,
                                   token=url)


        token_generator = PasswordResetTokenGenerator()
        token = token_generator.make_token(pedido.usuario)
        url = BASE_URL + '/validar/token?token=' + str(token)
        Token.objects.create(usuario=pedido.usuario, token=token, pedido=pedido, evento='ver_pedido')
        enviar_email_pago_recibido(pedido=pedido, token=url)
post_save.connect(enviar_mail_pago, sender=Pago)



def enviar_email_pago_recibido(**kwargs):
    mailServer = send_mail()
    pedido = kwargs.get('pedido')
    token = kwargs.get('token')

    pedido = Pedido.objects.get(id=pedido.id)
    pago = Pago.objects.get(id=pedido.pago.id)

    motivo = "Pago recibido en Maddie"
    destinatario = "maddiemakeuprg@gmail.com"
    para = pedido.usuario.email

    mensaje = MIMEMultipart()
    mensaje['From'] = destinatario
    mensaje['To'] = para
    mensaje['Subject'] = motivo

    content = render_to_string("emails/pedidos/plantilla_pago_recibido.html",{
        "pedido": pedido,
        "pago": pago,
        "token": token,
    })
    mensaje.attach(MIMEText(content, 'html'))
    #archivo_plano = strip_tags(html_message)
    mailServer.sendmail(destinatario, para, mensaje.as_string())

