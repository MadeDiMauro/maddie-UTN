
import smtplib
from maddie.settings import *

def send_mail():
    try:
        mailServer = smtplib.SMTP(EMAIL_HOST, EMAIL_PORT)
        mailServer.ehlo()
        mailServer.starttls()
        mailServer.ehlo()
        mailServer.login(EMAIL_HOST_USER, EMAIL_HOST_PASSWORD)
    except Exception as e:
        print(e)

    return mailServer
