from django.urls import path
from .views import *



urlpatterns = [
    path('',PreguntasFrecuentesListView.as_view(), name="preguntas-frecuentes"),
]