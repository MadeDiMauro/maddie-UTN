from django.urls import path, include, re_path
from .views import *
from django.contrib.auth.views import PasswordResetView, PasswordResetDoneView, PasswordResetConfirmView, PasswordResetCompleteView
from django.contrib.auth import views
from django_email_verification import urls as mail_urls

urlpatterns = [
    path('registro/', VistaRegistro.as_view(), name="registro"),
    path('salir/', salir, name="salir"),
    path('acceder/', acceder, name="acceder"),
    path('mi_cuenta/',mi_cuenta, name="mi_cuenta"),
    path('completar_cuenta/', CompletarCuenta, name="completar_cuenta"),
    path('crear_direccion/', crear_direccion, name="crear_direccion"),
    path('editar_direccion/<int:direccion_id>/', editar_direccion, name="editar_direccion"),
    path('editar_cuenta/<int:perfil_id>/', editar_cuenta, name="editar_cuenta"),
    path('editar_datos_sesion/<int:usuario_id>/', editar_datos_inicio, name="editar_datos_inicio"),
    path('email/', include(mail_urls)),
    path('nuevo_token/', generar_nuevo_token, name="generar_nuevo_token"),
    path('consulta/', consulta_usuario, name="consulta-usuario"),
    path('detalle-consulta/<int:consulta_id>', detalle_consulta, name="detalle_consulta"),

    #Url de cambio de contraseña
    path('reset/password_reset', PasswordResetView.as_view(template_name='autenticacion/forms/password_reset/password_reset_form.html', html_email_template_name="autenticacion/forms/password_reset/password_reset_email.html"), name = 'password_reset'),
    path('reset/password_reset_done', PasswordResetDoneView.as_view(template_name='autenticacion/forms/password_reset/password_reset_done.html'), name = 'password_reset_done'),
    re_path(r'^reset/(?P<uidb64>[0-9A-za-z_\-]+)/(?P<token>.+)/$', PasswordResetConfirmView.as_view(template_name='autenticacion/forms/password_reset/password_reset_confirm.html'), name = 'password_reset_confirm'),
    path('reset/done',PasswordResetCompleteView.as_view(template_name='autenticacion/forms/password_reset/password_reset_complete.html') , name = 'password_reset_complete'),
]
