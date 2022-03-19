from django import forms
from .models import *
from django.contrib.auth.forms import UserCreationForm


class UserCreateForm(UserCreationForm):

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')


class GenerarNuevoToken(forms.Form):
        username = forms.CharField(max_length=30, required=True)
        email = forms.EmailField(required=True)
        password = forms.CharField(required=True, widget=forms.PasswordInput())



DATE_INPUT_FORMATS = ('%d/%m/%a')

class FormularioCompletar(forms.ModelForm):
    fotoperfil: forms.FileField()
    class Meta:
        model = Perfilusuario
        fields = ('dni', 'tipo_usuario', 'fnacimiento', 'sexo', 'provincia', 'ciudad', 'fotoperfil')
        widgets = {
            'fnacimiento': forms.DateInput(
                format='%Y-%m-%d',
                attrs={'class': 'form-control',
                       'placeholder': 'Seleccione una fecha',
                       'type': 'date'
                       }),
        }


class FormularioDireccion(forms.ModelForm):
    class Meta:
        model = Direcciones
        fields = ('telefono', 'direccion', 'numero', 'piso_departamento', 'provincia', 'ciudad', 'destacada')


class ConsultaUsuario(forms.ModelForm):
    class Meta:
        model = Consulta
        fields = ('motivo', 'mensaje')

class FormVistoRespuesta(forms.ModelForm):
    class Meta:
        model = Respuesta
        fields = ('visto_mensaje',)


class FormMensajeProxPedidos(forms.ModelForm):
    class Meta:
        model = Consulta
        fields = ['mensaje']