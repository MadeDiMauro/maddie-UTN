from apps.categorizacion.models import Marca, Categoria
from .models import Producto

def categoria(request):
    categoria = Categoria.objects.all()

    return {'categorias':categoria}


def marca(request):
    marca = Marca.objects.all()
    return {'marcas': marca}

def destacados(request):
    productos = Producto.objects.filter(destacado=True)[:4]
    if productos:
        return {'productos_destacados':productos}
    else:
        return {}
