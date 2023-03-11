from django.shortcuts import render
from django.http import JsonResponse
from .models import Recipe
import requests

# Create your views here.
def my_view(request):
    data = {'message': 'Hello, World!'}
    return JsonResponse(data)

def recipe_list(request):
    recipes = Recipe.objects.all()
    data = {
        'recipes': [
            {
                'name': recipe.name,
                'image_url': recipe.image_url,
            }
            for recipe in recipes
        ]
    }
    return JsonResponse(data)

def get_ingredient(request, ingr):
    title: str = ingr
    response = requests.get(f"https://api.edamam.com/api/food-database/v2/parser?app_id=857558a0&app_key=0d7950e0f0f14e92914f0f37a1e6b537&ingr={title}&nutrition-type=cooking")
    if (response.status_code == 200): 
            data: dict = response.json()
            title: str = data['parsed'][0]['food']['label']
            imageurl: str = data['parsed'][0]['food']['image']
            ingredient: dict = {'title':title, 'imageurl':imageurl}
            return JsonResponse(ingredient)
    else:
        raise Exception('Failed to load data from API')

def get_recipes(request, ingrs):
     ingredients: str = ingrs
     # print(f"https://api.edamam.com/api/recipes/v2?type=public&q={ingredients}&app_id=a50df5d2&app_key=5d48597160ba83bc5214953152fd50dd")
     response = requests.get(f"https://api.edamam.com/api/recipes/v2?type=public&q={ingredients}&app_id=a50df5d2&app_key=5d48597160ba83bc5214953152fd50dd")
     if (response.status_code == 200):
          data: dict = {'hits':response.json()['hits']}
          return JsonResponse(data)
     else:
        raise Exception('Failed to load data from API')