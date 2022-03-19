from apps.server_mail import send_mail
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from django.template.loader import render_to_string
from apps.autenticacion.models import Perfilusuario
from .models import Detallegiftcard

def enviar_mail_amigo_giftcard(**kwargs):
    #Datos giftcard y amigo
    tarjeta = kwargs.get("tarjeta")
    correo = kwargs.get("correo")
    nombre = kwargs.get("nombre")
    id = kwargs.get("detalle_id")

    detalle = Detallegiftcard.objects.get(id=id)
    nombre_cliente = detalle.usuario.usuario.first_name

    mailServer = send_mail()
    motivo = nombre_cliente+" te regaló un giftcard de $"+str(detalle.giftcard.preciofinal)
    destinatario = "maddiemakeuprg@gmail.com"
    para = correo

    mensaje = MIMEMultipart()
    mensaje['From'] = destinatario
    mensaje['To'] = para
    mensaje['Subject'] = motivo

    content = render_to_string("emails/pedidos/plantilla_enviar_giftcard_amigo.html",{
        "nombre": nombre,
        "nombre_cliente": nombre_cliente,
        "preciofinal": detalle.giftcard.preciofinal,
        "nro_tarjeta": detalle.nro_tarjeta,
        "codigo_seg": detalle.codigo_seguridad,
    })
    mensaje.attach(MIMEText(content, 'html'))
    mailServer.sendmail(destinatario, para, mensaje.as_string())