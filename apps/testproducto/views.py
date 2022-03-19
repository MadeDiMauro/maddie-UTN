from django.shortcuts import render
from django.contrib import messages
from apps.productos.models import Producto
from .forms import TestProductoForm
from .models import Testdeproducto
# Create your views here.

def testproducto(request):
    if request.method == "POST":
        form = TestProductoForm(request.POST)
        if form.is_valid():
            color = form.cleaned_data['color_piel']
            paleta = form.cleaned_data['paleta_piel']
            tipo = form.cleaned_data['tipo_piel']

            producto = Testdeproducto.objects.filter(producto__stock__gte=1,
                                                     producto__disponible=True,
                                                     producto__preciofinal__isnull=False,
                                                     color_piel=color,
                                                     paleta_color=paleta,
                                                     tipo_piel=tipo)
            print(form)
            return render(request, "testproducto/producto_elegido.html", {'productos':producto})
        else:
            print(form)
            messages.warning(request, F'No se ha encontrado producto para las categorias seleccionadas', extra_tags='Información')
            form = TestProductoForm(request.POST)
            return render(request, "testproducto/testproducto.html", {"form": form})
    else:
        form = TestProductoForm(request.POST)
        return render(request, "testproducto/testproducto.html", {"form": form})
