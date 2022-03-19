from maddie import settings
def total_carrito(request):
    total = 0.0
    cantidad_items = 0
    if request.user.is_authenticated and "cart" in request.session:
        for key, value in request.session['cart'].items():
            total = total + (float(value['precio'])*value['cantidad'])
            cantidad_items = cantidad_items + value['cantidad']

    return {'total_carrito': total, "cantidad": cantidad_items}



def extra_context(request):
    return {'base_url': settings.BASE_URL}