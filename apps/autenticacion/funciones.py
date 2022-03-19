from django.contrib.auth.tokens import PasswordResetTokenGenerator
from apps.server_mail import send_mail
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from django.template.loader import render_to_string
from maddie.settings import BASE_URL


def enviar_email_bienvenida(**kwargs):
    mailServer = send_mail()
    usuario = kwargs.get('user')

    motivo = "¡Bienvenido a Maddie! :)"
    destinatario = "maddiemakeuprg@gmail.com"
    para = usuario.email

    mensaje = MIMEMultipart()
    mensaje['From'] = destinatario
    mensaje['To'] = para
    mensaje['Subject'] = motivo

    content = render_to_string("emails/bienvenida.html",{
        "usuario": usuario,
    })
    mensaje.attach(MIMEText(content, 'html'))
    #archivo_plano = strip_tags(html_message)
    mailServer.sendmail(destinatario, para, mensaje.as_string())