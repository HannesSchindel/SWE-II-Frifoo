from django.urls import path
from . import views

urlpatterns = [
    path('hello/', views.my_view, name='my_view'),
    path('recipes/', views.recipe_list, name='recipe_list'),
    path('ingredient/<str:ingr>/', views.get_ingredient, name='get_ingredient'),
    path('recipes/<str:ingrs>/', views.get_recipes, name='get_recipes'),
]