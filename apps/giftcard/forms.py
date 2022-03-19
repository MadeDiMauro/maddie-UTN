from django import forms
from .models import *


class FormularioGiftcardAmigo(forms.ModelForm):
    id = forms.IntegerField(label='',widget=forms.NumberInput(attrs={'hidden':'hidden'}))
    nro_tarjeta = forms.CharField(widget=forms.TextInput(attrs={'readonly': 'readonly'}))
    nombre_amigo = forms.CharField(widget=forms.TextInput())
    correo_amigo = forms.EmailField(widget=forms.EmailInput())
    class Meta:
        model = Detallegiftcard
        fields = ('id','nro_tarjeta','nombre_amigo', 'correo_amigo')
