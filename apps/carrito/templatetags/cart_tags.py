from django import template
from datetime import datetime
from datetime import time, timedelta

register = template.Library()

@register.filter()
def multiply(value, arg):
    return float(value) * arg

@register.filter()
def money_format(value, arg):
    return f"{arg}{value}"

@register.filter()
def preciof(value1, value2):
    v1 = float(value1)
    v2 = float(value2)
    v3 = 100
    v4 = (v1*v2/v3)+v1
    return v4

@register.filter()
def descontarStock(value, cantidad):
    return value-cantidad

@register.filter()
def separador(value):
    valor = str(value)
    primer_indice = valor.find(".0")
    if primer_indice == -1:
        numero = "{:0,.2f}".format(value)
    else:
        numero = "{:0,.0f}".format(value)

    return numero

@register.filter()
def mayus_minus(value):
    valor = value.lower()
    valor = valor.title()
    return valor

@register.filter()
def des_efectivo(value):
    valor = value-(value*15/100)
    return valor

@register.filter()
def titulo(value):
    valor = value.capitalize()
    return valor

@register.filter()
def descod(value, porc):
    valor = value - (value*porc/100)
    return valor

@register.filter()
def desgif(value, gif):
    valor = value - gif
    return valor

@register.filter()
def mdescod(value, porc):
    valor = value*porc/100
    return valor

@register.filter()
def sumaenvio(value, envio):
    valor = value + envio
    return valor

@register.filter()
def sumahoras(value):
    now = datetime.now()
    valor = value + timedelta(hours=3)
    return valor

@register.filter()
def convertirf(value):
    valor = float(value)
    return valor