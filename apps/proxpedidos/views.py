from django.db.models import Q
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.views.generic import ListView
from apps.autenticacion.models import Consulta
from apps.autenticacion.forms import FormMensajeProxPedidos
from .models import Proxpedidos
# Create your views here.

class ProximosPedidosListView(ListView):
    queryset = Proxpedidos.objects.all()
    context_object_name = 'ppedidos'
    paginate_by = 10
    template_name = 'proxpedidos/listado.html'

    def get_queryset(self):
        queryset = super(ProximosPedidosListView, self).get_queryset()
        if 'buscar' in self.request.GET:
            buscar = self.request.GET['buscar']
            queryset = queryset.filter(
                Q(titulo__icontains=buscar) |
                Q(listado__icontains=buscar) |
                Q(detalles__icontains=buscar)
            ).distinct()
        return queryset

@login_required(login_url='acceder')
def proximos_pedidos_mensaje(request, proxpedido_id):
    usuario = request.user
    proxp = Proxpedidos.objects.get(id=proxpedido_id)
    motivo = 'Próximo pedido N°'+str(proxp.id)+' - '+str(proxp.titulo)+' | Fecha del pedido: '+str(proxp.fecha_d)+' al '+str(proxp.fecha_h)
    if request.method == 'POST':
        form = FormMensajeProxPedidos(request.POST)
        if form.is_valid():
            mensaje = form.cleaned_data.get('mensaje')
            consulta = Consulta.objects.create(usuario=usuario, motivo=motivo, mensaje=mensaje)
            consulta.save()
            messages.success(request, F'Los datos fueron enviados correctamente.',
                             extra_tags='Excelente')
        else:
            messages.error(request, F'Los datos no fueron enviados, hubo un problema. /n Intente nuevamente.',
                             extra_tags='Error')
        return redirect('proximos-pedidos')
    else:
        form = FormMensajeProxPedidos()
        return render(request, "proxpedidos/consulta-prox-pedidos.html", {"form": form, "motivo":motivo, "proxp":proxp})