from django.shortcuts import render

# Create your views here.

def como_comprar(request):
    return render(request, 'comocomprar/como-comprar.html')