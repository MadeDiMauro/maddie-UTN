from django import forms
from apps.giftcard.models import Codigodescuento
from apps.autenticacion.models import Direcciones, Perfilusuario
from apps.envio.models import Transporte

class FormPaso1(forms.Form):
    def __init__(self, *args, **kwargs):
        super(self.__class__, self).__init__(*args, *kwargs)
        self.fields['coddescuento'].required = False
        self.fields['nrotarjetagiftcard'].required = False
        self.fields['codseggiftcard'].required = False
        #self.fields['coddescuento'].widget.attrs.update({'disabled': True})


    coddescuento = forms.CharField(label='Código de descuento',
                                   help_text='Ingrese aquí su código de descuento para que pueda ser aplicado',
                                   widget=forms.TextInput(attrs={'class':'form-control rounded-0'}))

    nrotarjetagiftcard = forms.CharField(max_length=8, min_length=8, label='Nro de tarjeta giftcard',
                                         help_text='Ingrese aquí el número de tareta de su giftcard, es un númeor de 8 dígitos',
                                         widget=forms.NumberInput(attrs={'min':'0', 'max':'999999999','type':'number','class': 'form-control rounded-0 d-block',
                                                                       'oninput':'if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);'}))

    codseggiftcard = forms.CharField(max_length=3, min_length=3, label='Código de seguridad',
                                     help_text='Ingrese aquí el código de seguridad de la tarjeta, número 3 dígitos',
                                     widget=forms.NumberInput(attrs={'min':'0', 'max':'999','class':'form-control rounded-0',
                                                                     'oninput': 'if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);'
                                                                     }))


class FormPaso2(forms.Form):
    codpostal = forms.CharField(max_length=4, min_length=4, label='Código postal',
                                   help_text='Ingrese aquí su código postal para buscar su transporte.',
                                   widget=forms.NumberInput(attrs={'min':'0', 'max':'9999','class':'form-control rounded-0',
                                                                   'oninput': 'if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);'
                                                                   }))



MEDIOS_PAGO_CHOICE = (
    ('mercadopago','Mercado Pago'),
    ('transferencia', 'Transferencia bancaria'),
)

class FormPaso3(forms.Form):
    mediopago = forms.MultipleChoiceField(
        required=True,
        widget=forms.RadioSelect(attrs={'class': 'form-check-inline m-3 p-3 shadow-sm text-info display-4'}),
        choices=MEDIOS_PAGO_CHOICE,
        label='',
    )