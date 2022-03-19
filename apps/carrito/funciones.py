from apps.server_mail import send_mail
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from django.template.loader import render_to_string
from apps.autenticacion.models import Perfilusuario
from apps.carrito.models import Pedido, Pago, Token, Detallepedido
from maddie.settings import BASE_URL
from django.contrib.auth.tokens import PasswordResetTokenGenerator

def enviar_email_pedido_cancelado(**kwargs):
    mailServer = send_mail()
    pedido = kwargs.get('pedido')

    pedido = Pedido.objects.get(id=pedido.id)

    motivo = "Pedido N°"+str(pedido.id)+" cancelado - Maddie"
    destinatario = "maddiemakeuprg@gmail.com"
    para = pedido.usuario.email

    mensaje = MIMEMultipart()
    mensaje['From'] = destinatario
    mensaje['To'] = para
    mensaje['Subject'] = motivo

    content = render_to_string("emails/pedidos/plantilla_pedido_cancelado.html",{
        "pedido": pedido,
    })
    mensaje.attach(MIMEText(content, 'html'))
    #archivo_plano = strip_tags(html_message)
    mailServer.sendmail(destinatario, para, mensaje.as_string())