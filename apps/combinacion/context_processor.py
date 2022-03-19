from .models import Comboproducto
def combo_productos(request):
    comboproducto = Comboproducto.objects.all()
    return {'productos_combo':comboproducto}