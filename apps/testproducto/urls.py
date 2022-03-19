from django.urls import path
from .views import *

urlpatterns = [
    path('',testproducto,name='test-producto')
]