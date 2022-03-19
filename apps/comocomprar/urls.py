from django.urls import path
from .views import *

urlpatterns = [
    path('como-comprar/', como_comprar, name="como-comprar")
]