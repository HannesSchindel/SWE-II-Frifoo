from django.db import models

# Create your models here.
class Recipe(models.Model):
    name = models.CharField(max_length=100)
    image_url = models.URLField()

    class Meta:
        app_label = 'frifoo_api'