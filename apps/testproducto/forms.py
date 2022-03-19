from django import forms
from .models import Testdeproducto

TIPO_CHOICES = [
    ('normal','Normal'),
    ('seca', 'Seca'),
    ('mixta', 'Mixta'),
    ('grasa','Grasa/oleosa')
]

COLOR_CHOICES = [
    ('clara','Clara'),
    ('morena','Morena'),
    ('oscura','Oscura')
]

PALETA_CHOICES=[
    ('pasteles','Colores gama pasteles'),
    ('llamativo','Colores gama llamativos/fluor'),
    ('frios','Colores gama frios'),
    ('calidos','Colores gama cálidos'),
    ('marrones','Colores gama marrones/beige'),
]


class TestProductoForm(forms.Form):
    tipo_piel = forms.TypedChoiceField(
        required=True,
        widget=forms.RadioSelect(),
        choices=TIPO_CHOICES,
        label='¿Que tipo de piel sos?'
    )
    color_piel = forms.TypedChoiceField(
        required=True,
        widget=forms.RadioSelect(),
        choices=COLOR_CHOICES,
        label='¿Que color de piel tenés?'
    )
    paleta_piel = forms.TypedChoiceField(
        required=True,
        widget=forms.RadioSelect(),
        choices=PALETA_CHOICES,
        label='¿Que gama de colores sentis te queda mejor?'
    )
