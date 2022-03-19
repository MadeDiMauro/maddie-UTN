from django.shortcuts import render, redirect
from django.views.generic import View, TemplateView
from django.contrib.auth.forms import UserCreationForm ,AuthenticationForm, PasswordChangeForm, UsernameField, PasswordResetForm
from django.contrib import messages
from django.contrib.auth import login, logout, authenticate, update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from .forms import FormularioCompletar, FormularioDireccion, UserCreateForm, GenerarNuevoToken, ConsultaUsuario, FormVistoRespuesta
from django.contrib.auth.models import User
from django_email_verification import send_email
from .models import Perfilusuario, Direcciones, Consulta, Respuesta
from .funciones import enviar_email_bienvenida
from apps.deseadoslove.models import Lovelist, Loveproducto
from apps.carrito.models import Pedido, Detallepedido, Pago
from apps.envio.models import Envio, Transporte
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse

@csrf_exempt
def generar_nuevo_token(request):
    if request.method == "POST":
        form = GenerarNuevoToken(request.POST)
        if form.is_valid():
            nombre_usuario = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password")
            email = form.cleaned_data.get("email")
            print(nombre_usuario, password, email)
            user = User.objects.filter(username=nombre_usuario, password=password, email=email)
            print(user)
            if user is not None:
                user = User.objects.get(username=nombre_usuario)
                if user.is_active == True:
                    messages.info(request, F'Atención, tu cuenta fué activada anteriormente. Ya puedes iniciar sesión en el sitio web.',
                                   extra_tags='Cuenta activada')
                    return redirect("acceder")
                else:
                    send_email(user)

                    return render(request, 'emails/solicitud_mensaje_confirmar_2.html')
            else:
                messages.error(request, F'Los datos ingresados no son válidos, intente nuevamente.', extra_tags='Error')
                form = GenerarNuevoToken()
                return render(request, "emails/generar_token.html", {'form':form})
        else:
            messages.error(request, F'Los datos ingresados no son válidos, intente nuevamente.', extra_tags='Error')
            form = GenerarNuevoToken()
            return render(request, "emails/generar_token.html", {"form": form})
    else:
        form = GenerarNuevoToken()
        return render(request, "emails/generar_token.html", {"form": form})


def acceder(request):
    if request.method == "POST":
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            nombre_usuario = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password")
            usuario = authenticate(username=nombre_usuario, password=password)
            if usuario is not None:
                login(request, usuario)
                messages.success(request, F"Bienvenid@ a la página web {nombre_usuario} 🥰", extra_tags='Bienvenido/a ❤')
                return redirect("listado_productos")
            else:
                messages.error(request, F'Los datos ingresados no son válidos, verificar', extra_tags='Error')
                form = AuthenticationForm()
                return render(request, "autenticacion/acceder.html", {"form": form})
        else:
            messages.error(request, F'Los datos ingresados no son válidos, verificar', extra_tags='Error')
            form = AuthenticationForm()
            return render(request, "autenticacion/acceder.html", {"form": form})
    else:
        if request.user.is_authenticated:
            return redirect('carrito')
        else:
            form = AuthenticationForm()
            return render(request, "autenticacion/acceder.html", {"form": form})


@method_decorator(csrf_exempt, name='dispatch')
class VistaRegistro(View):
    def get(self, request):
        form = UserCreateForm()
        return render(request, "autenticacion/registro.html", {"form": form})
    def post(self, request):
        form = UserCreateForm(request.POST)
        if form.is_valid():
            print(form)
            usuario = form.save(commit=False)
            usuario.is_active = False
            usuario.save()
            print(usuario.id)
            user = User.objects.get(id=usuario.id)
            enviar_email_bienvenida(user=user)
            send_email(user)
            messages.success(request, F'El mail fué enviado satisfactoriamente, revisar casilla de correo', extra_tags='Excelente')
            return render(request, 'emails/solicitud_mensaje_confirmar.html')

        else:
            messages.error(request, F'El mail no pudo ser enviado, hubo un error', extra_tags='Error')
            return render(request, "autenticacion/registro.html", {"form": form})


def salir(request):
    logout(request)
    messages.success(request, F"Cierre de sesión exitosa", extra_tags='Nos vemos pronto 👋')
    return redirect("acceder")


@login_required(login_url='acceder')
def mi_cuenta(request):
    usuario = request.user
    perfil = Perfilusuario.objects.filter(usuario=usuario)
    direccion = Direcciones.objects.filter(usuario__in=perfil)

    if perfil:
        if direccion:
            return render(request, 'autenticacion/micuenta.html', {
                    'datos_usuario': perfil, "direcciones": direccion,
                })
        else:
            direccion = {}
            return render(request, 'autenticacion/micuenta.html', {
                    'datos_usuario': perfil, "direcciones": direccion,
            })
    else:
        perfil = {}
        direccion = {}
        return render(request, 'autenticacion/micuenta.html', {
                'datos_usuario': perfil, "direcciones": direccion,
        })



@login_required(login_url='acceder')
def CompletarCuenta(request):
    usuario = request.user
    if request.method == 'POST':
        form = FormularioCompletar(request.POST, request.FILES)
        if form.is_valid():
            perfil = form.save(commit=False)
            perfil.usuario_id = usuario.id
            print(perfil)
            perfil.save()
            messages.success(request, F"Los datos fueron cargados correctamente. Gracias por completar su perfil.", extra_tags='Excelente')
            return redirect('mi_cuenta')
        else:
            messages.error(request, F"El perfil no pudo ser creado, por contener errores, completar nuevamene.", extra_tags='Error')

        return redirect('mi_cuenta')
    else:
        form = FormularioCompletar()
        return render(request, "autenticacion/completar_cuenta.html", {"form": form})


@login_required(login_url='acceder')
def editar_cuenta(request, perfil_id):

    perfil = Perfilusuario.objects.get(id=perfil_id)
    if request.method == 'GET':
        form = FormularioCompletar(instance=perfil)
        return render(request, "autenticacion/forms/editar_cuenta.html", {"form": form})
    else:
        form = FormularioCompletar(request.POST, request.FILES, instance=perfil)
        if form.is_valid():
            form.save()
        messages.success(request, F'Los datos de su cuenta fueron actualizados correctamente.', extra_tags='Excelente')
        return redirect('mi_cuenta')



@login_required(login_url='acceder')
def crear_direccion(request):
    usuario = request.user

    if request.method == 'POST':
        perfilu = Perfilusuario.objects.get(usuario=usuario)
        form = FormularioDireccion(request.POST)
        if form.is_valid():
            perfil = form.save(commit=False)
            perfil.usuario = perfilu
            perfil.save()
            messages.success(request, F'Los datos fueron enviados correctamente.',
                             extra_tags='Excelente')
        return redirect('mi_cuenta')
    else:
        form = FormularioDireccion()
        return render(request, "autenticacion/forms/crear_direccion.html", {"form": form})



@login_required(login_url='acceder')
def editar_direccion(request, direccion_id):
    direccion = Direcciones.objects.get(id=direccion_id)

    if request.method == 'GET':
        form = FormularioDireccion(instance=direccion)
        return render(request, "autenticacion/forms/editar_direccion.html", {"form": form})
    else:
        form = FormularioDireccion(request.POST, instance=direccion)
        if form.is_valid():
            form.save()
            messages.success(request, F'La dirección fué actualizada correctamente.',
                             extra_tags='Excelente')
        return redirect('mi_cuenta')


@login_required(login_url='acceder')
def editar_datos_inicio(request, usuario_id):
    usuario = User.objects.get(id=usuario_id)

    if request.method == 'GET':
        form = PasswordChangeForm(user=usuario)
        return render(request, "autenticacion/forms/editar_datos_inicio.html", {"form": form, "usuario": usuario.username})
    else:
        form = PasswordChangeForm(user=usuario, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            messages.success(request, F'Tu contraseña fué actualizada!', extra_tags='Excelente')
            return redirect('mi_cuenta')
        else:
            messages.error(request, F'Por favor, corrija el error a continuación.',extra_tags='Error')
        return redirect('mi_cuenta')


@login_required(login_url='acceder')
def consulta_usuario(request):
    usuario = request.user
    if request.method == 'POST':
        form = ConsultaUsuario(request.POST)
        if form.is_valid():
            motivo = form.cleaned_data.get('motivo')
            mensaje = form.cleaned_data.get('mensaje')
            consulta = Consulta.objects.create(usuario=usuario, motivo=motivo, mensaje=mensaje)
            consulta.save()
            messages.success(request, F"El mensaje fué enviado correctamente. /n Responderemos a la brevedad.",
                             extra_tags='Excelente')
            return redirect('mi_cuenta')

            # return render(request, 'emails/solicitud_mensaje_confirmar.html')
        else:
            messages.error(request, F"El mensaje no pudo ser enviado", extra_tags='Error')
            form = ConsultaUsuario()
            return render(request, "consultas/consulta-usuario.html", {"form": form})

    else:
        form = ConsultaUsuario()
        return render(request, "consultas/consulta-usuario.html", {"form": form})



@login_required(login_url='acceder')
def detalle_consulta(request, consulta_id):
    consulta = Consulta.objects.get(id=consulta_id)
    respuesta = Respuesta.objects.filter(consulta_id=consulta_id)
    if respuesta:
        respuesta = Respuesta.objects.get(consulta_id=consulta_id)
        if respuesta.visto_mensaje == False:
            if request.method == 'GET':
                form = FormVistoRespuesta(instance=respuesta)
                return render(request, "consultas/detalle-consulta.html", {"form": form, 'consulta':consulta, 'ban':True, 'respuesta':respuesta, 'confirma':True})
            else:
                form = FormVistoRespuesta(request.POST, instance=respuesta)
                if form.is_valid():
                    form.save()
                    messages.success(request, F'Los datos se enviaron correctamente', extra_tags='Excelente')
                else:
                    messages.error(request, F'El formulario no es válido, hubo un error', extra_tags='Error')
                return redirect('mi_cuenta')
        else:
            return render(request, "consultas/detalle-consulta.html", {"consulta": consulta, 'ban': False, 'respuesta':respuesta, 'confirma':True})
    else:
        return render(request, "consultas/detalle-consulta.html",{"consulta":consulta, 'ban':False})


