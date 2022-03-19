from django.db.models import Q
from django.shortcuts import render
from django.views.generic import ListView
from .models import Pregfrecuentes
# Create your views here.

class PreguntasFrecuentesListView(ListView):
    queryset = Pregfrecuentes.objects.all()
    context_object_name = 'preguntas'
    paginate_by = 10
    template_name = 'pfrecuentes/listado.html'

    def get_queryset(self):
        queryset = super(PreguntasFrecuentesListView, self).get_queryset()
        if 'buscar' in self.request.GET:
            buscar = self.request.GET['buscar']
            queryset = queryset.filter(
                Q(pregunta__icontains=buscar) |
                Q(categoria__icontains=buscar) |
                Q(respuesta__icontains=buscar) |
                Q(relevancia__icontains=buscar) |
                Q(destacada__icontains=buscar)
            ).distinct()
        return queryset