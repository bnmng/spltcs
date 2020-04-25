from django.contrib import admin
from django.contrib.contenttypes.admin import GenericInlineModelAdmin
from .forms import VariFieldSpecAdminForm

from .models import (VariFieldSpec, VariFieldValue,VariFieldSpecChoice)


admin.site.register(VariFieldValue)


class VariFieldSpecAdmin(admin.ModelAdmin):

    form = VariFieldSpecAdminForm
    change_form_template = "varifields/change_form.html"

admin.site.register(VariFieldSpec, VariFieldSpecAdmin)


admin.site.register(VariFieldSpecChoice)


