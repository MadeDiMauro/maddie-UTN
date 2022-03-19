from django.urls import path
from .views import *

urlpatterns = [
    path('', CombosListView.as_view(), name="listado_combos"),
    path('detalle/<int:pk>', ComboDetailView.as_view(), name="detalle_combo"),
    path('add_combo/<int:combo_id>/', add_combo, name='add_combo'),
    path('decrement_combo/<int:combo_id>/', decrement_combo, name='decrement_combo'),
    path('quitar_combo/<int:combo_id>/', quitar_combo, name='quitar_combo'),
]