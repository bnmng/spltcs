from django.contrib import admin
from .models import ( Category, Item, ItemHistory, MakeModel, Role, Location)

admin.site.register(Category)

admin.site.register(ItemHistory)

admin.site.register(MakeModel)

admin.site.register(Role)

admin.site.register(Location)




