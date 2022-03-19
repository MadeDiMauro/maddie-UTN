"""
Django settings for maddie project.

Generated by 'django-admin startproject' using Django 3.1.2.

For more information on this file, see
https://docs.djangoproject.com/en/3.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.1/ref/settings/
"""
import os
import psycopg2
import dj_database_url
from pathlib import Path
from .db import POSTGRESQL
from django.contrib.messages import constants as message_constants

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
BASE_URL = 'http://127.0.0.1:8000'

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'mn&@myhrn4hdrbt38^4i2_w!12*l#=!oip4u-f_sykjgd6n-e-'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = ['maddie-makeup.herokuapp.com']


# Application definition

INSTALLED_APPS = [
    'admin_interface',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    #Paquetes del proyecto
    'crispy_forms',
    'widget_tweaks',
    'preventconcurrentlogins',
    'sorl.thumbnail',
    'colorfield',
    'django_email_verification',
    #Mis aplicaciones

    'apps.carrito',
    'apps.autenticacion',
    'apps.categorizacion',
    'apps.combinacion',
    'apps.deseadoslove',
    'apps.envio',
    'apps.productos',
    'apps.proveedores',
    'apps.ubicacion',
    'apps.giftcard',
    'apps.pagos',
    'apps.testproducto',
    'apps.comocomprar',
    'apps.recomendados',
    'apps.pfrecuentes',
    'apps.proxpedidos',
    'apps.procesarpedido',
    'apps.checkout',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'preventconcurrentlogins.middleware.PreventConcurrentLoginsMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
]

ROOT_URLCONF = 'maddie.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'apps.carrito.context_processor.total_carrito',
                'django.template.context_processors.media',
                'apps.autenticacion.context_processor.resumen_cuenta',
                'apps.autenticacion.context_processor.lovelist_cuenta',
                'apps.autenticacion.context_processor.pedidos_cuenta',
                'apps.envio.context_processor.buscar_cp',
                'apps.productos.context_processor.categoria',
                'apps.productos.context_processor.marca',
                'apps.autenticacion.context_processor.direcciones',
                'apps.combinacion.context_processor.combo_productos',
                'apps.productos.context_processor.destacados',
                'apps.autenticacion.context_processor.respuestas_de_consultas',
                'apps.recomendados.context_processor.recomendados',
                'apps.carrito.context_processor.extra_context',
                'apps.giftcard.context_processor.mostrar_codigos_descuento',
            ],
        },
    },
]

WSGI_APPLICATION = 'maddie.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.1/ref/settings/#databases

DATABASES = POSTGRESQL
""" DATABASE_URL = os.environ['DATABASE_URL']

conn = psycopg2.connect(DATABASE_URL, sslmode='require')


DATABASES['default'] = dj_database_url.config(conn_max_age=600, ssl_require=True) """


# Password validation
# https://docs.djangoproject.com/en/3.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.1/topics/i18n/

LANGUAGE_CODE = 'es-ar'

TIME_ZONE = 'America/Argentina/Buenos_Aires'

USE_I18N = True

USE_L10N = True

USE_TZ = True

def verified_callback(user):
    user.is_active = True


EMAIL_VERIFIED_CALLBACK = verified_callback
EMAIL_FROM_ADDRESS = 'maddiemakeuprg@gmail.com'
EMAIL_MAIL_SUBJECT = 'Confirmar tu cuenta en Maddie'
EMAIL_MAIL_HTML = 'emails/mail_body.html'
EMAIL_MAIL_PLAIN = 'emails/mail_body.txt'
#EMAIL_TOKEN_LIFE = 60 * 60
EMAIL_TOKEN_LIFE = 1200
EMAIL_PAGE_TEMPLATE = 'emails/confirmar_cuenta.html'
EMAIL_PAGE_DOMAIN = 'http://127.0.0.1:8000/'

# For Django Email Backend
#EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'maddiemakeuprg@gmail.com'
EMAIL_HOST_PASSWORD = 'kjckfnurjdwyrsfo'  # os.environ['password_key'] suggested
EMAIL_USE_TLS = True

AUTHENTICATION_BACKENDS = ['django.contrib.auth.backends.AllowAllUsersModelBackend']

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.1/howto/static-files/

STATIC_URL = '/static/'

""" STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "statics")
]  """

STATICFILES_STORAGE = "whitenoise.storage.CompressedManifestStaticFilesStorage"

STATIC_ROOT = BASE_DIR / "statics"

CRISPY_TEMPLATE_PACK = 'bootstrap4'

MESSAGE_TAGS = {
    message_constants.DEBUG: 'debug',
    message_constants.INFO: 'info',
    message_constants.SUCCESS: 'success',
    message_constants.WARNING: 'warning',
    message_constants.ERROR: 'error',
}

MEDIA_URL = '/media/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

SESSION_COOKIE_AGE = 18000

SESSION_EXPIRE_AT_BROWSER_CLOSE = False
