from apps.server_mail import send_mail
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from django.template.loader import render_to_string



def enviar_email_envio(**kwargs):
    pedido = kwargs.get("pedido")
    mailServer = send_mail()
    motivo = "Número de seguimiento - Pedido "+str(pedido)
    destinatario = "maddiemakeuprg@gmail.com"
    para = kwargs.get("usuario_email")
    mensaje = MIMEMultipart()
    mensaje['From'] = destinatario
    mensaje['To'] = para
    mensaje['Subject'] = motivo

    content = render_to_string("emails/pedidos/plantilla_datos_envio.html", {
        "pedido": kwargs.get("pedido"),
        "usuario_nombre": kwargs.get("usuario_nombre"),
        "codigo_seguimiento": kwargs.get("codigo_seguimiento"),
        "token":kwargs.get('token'),
    })
    mensaje.attach(MIMEText(content, 'html'))
    mailServer.sendmail(destinatario, para, mensaje.as_string())

