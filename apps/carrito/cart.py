from django.db.models import F, Sum, FloatField
from  django.contrib.messages import constants as messages
from apps.combinacion.models import Comboproducto

class Cart():
    def __init__(self, request):
        self.request = request
        self.session = request.session
        cart = self.session.get("cart")
        request.session.modified = True

        if not cart:
            cart = self.session["cart"] = {}
            request.session.modified = True
        self.cart = cart

    #Producto
    def addp(self, producto):
        keyp = 'p'+str(producto.id)
        print(keyp)

        if keyp not in self.cart.keys():
            self.cart['p'+str(producto.id)] = {
                "producto_id": producto.id,
                "tipo": 'producto',
                "nombre": producto.nombre,
                "cantidad": 1,
                "precio": producto.preciofinal,
                "imagen": producto.imagen1.url,
            }
            return 'exito'
        else:
            for key, value in self.cart.items():
                if key == keyp:
                    if value["cantidad"] < producto.stock:
                        value["cantidad"] = value["cantidad"] + 1
                        return 'exito'
                    else:
                        print('No se pueden agregar más unidades')
                        return 'error'
        self.save()


    def decrementp(self, producto):
        keyp = 'p' + str(producto.id)
        print(keyp)
        for key, value in self.cart.items():
            if key == keyp:
                value["cantidad"] = value["cantidad"] - 1
                if value["cantidad"] < 1:
                    del self.cart[keyp]
                    self.save()
                    return 'delete'
                else:
                    self.save()
                    return 'exito'
            else:
                print("El producto no existe en el carrito")

    def quitarp(self, producto):
        keyp = 'p' + str(producto.id)
        print(keyp)
        for key, value in self.cart.items():
            if key == keyp:
                del self.cart[keyp]
                self.save()
                return 'exito'

    #Combo
    def addc(self, combo, comboproducto):
        keyc = 'c' + str(combo.id)
        print(keyc)

        if keyc not in self.cart.keys():
            self.cart['c' + str(combo.id)] = {
                    "combo_id": combo.id,
                    "tipo": 'combo',
                    "nombre": combo.nombre,
                    "cantidad": 1,
                    "precio": combo.preciofinal,
                    "imagen": combo.imagen.url,
            }
            return 'exito'
        else:
            for key, value in self.cart.items():
                if key == keyc:
                    if value["cantidad"] < combo.stock:
                        value["cantidad"] = value["cantidad"] + 1
                        return 'exito'
                    else:
                        return 'error'
        self.save()


    def decrementc(self, combo):
        keyc = 'c' + str(combo.id)
        print(keyc)
        for key, value in self.cart.items():
            if key == keyc:
                value["cantidad"] = value["cantidad"] - 1
                if value["cantidad"] < 1:
                    del self.cart[keyc]
                    self.save()
                    return 'delete'
                else:
                    self.save()
                    return 'exito'
            else:
                print("El combo no existe en el carrito")


    def quitarc(self, combo):
        keyc = 'c' + str(combo.id)
        print(keyc)
        for key, value in self.cart.items():
            if key == keyc:
                del self.cart[keyc]
                self.save()
                return 'exito'

    #Giftcard
    def addg(self, giftcard):
        keyg = 'g' + str(giftcard.id)
        print(keyg)
        if keyg not in self.cart.keys():

            self.cart['g'+str(giftcard.id)] = {
                "giftcard_id": giftcard.id,
                "tipo": 'giftcard',
                "nombre": giftcard.nombre,
                "cantidad": 1,
                "precio": giftcard.preciofinal,
                "imagen": giftcard.imagen.url,
            }
            return 'exito'
        else:
            for key, value in self.cart.items():
                if key == keyg:
                    if value["cantidad"] < giftcard.stock:
                        value["cantidad"] = value["cantidad"] + 1
                        return 'exito'
                    else:
                        return 'error'
        self.save()

    def decrementg(self, giftcard):
        keyg = 'g' + str(giftcard.id)
        print(keyg)
        for key, value in self.cart.items():
            if key == keyg:
                value["cantidad"] = value["cantidad"] - 1
                if value["cantidad"] < 1:
                    del self.cart[keyg]
                    self.save()
                    return 'delete'
                else:
                    self.save()
                    return 'exito'
            else:
                print("El giftcard no existe en el carrito")


    def quitarg(self, giftcard):
        keyg = 'g' + str(giftcard.id)
        print(keyg)
        for key, value in self.cart.items():
            if key == keyg:
                del self.cart[keyg]
                self.save()
                return 'exito'




    def save(self):
        self.session["cart"] = self.cart
        self.session.modified = True

    def clear(self):
        self.session["cart"] = {}
        self.session.modified = True
