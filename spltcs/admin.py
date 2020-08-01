from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin, GroupAdmin
from .forms import SPLTCSUserCreationForm, SPLTCSUserChangeForm
from .models import SPLTCSUser, SPLTCSGroup
from django.contrib.auth.models import Group


class SPLTCSUserAdmin(UserAdmin):
    add_form = SPLTCSUserCreationForm
    form = SPLTCSUserChangeForm
    model = SPLTCSUser
    list_display = ["username", "email",]
    fieldsets = (
        (None, {"fields": ("username", "password")}),
        (("Personal info"), {"fields": ("first_name", "last_name", "email")}),
        (
            ("Permissions"),
            {
                "fields": (
                    "is_active",
                    "is_staff",
                    "is_superuser",
                    "groups",
                    "user_permissions",
                ),
            },
        ),
        (("Important dates"), {"fields": ("last_login", "date_joined")}),
    )
    add_fieldsets = (
        (
            None,
            {"classes": ("wide",), "fields": ("username", "password1", "password2"),},
        ),
    )


admin.site.register(SPLTCSUser, SPLTCSUserAdmin)

class SPLTCSGroupAdmin(GroupAdmin):
    model = SPLTCSGroup
    list_display = ['name', 'grp_order']

admin.site.register(SPLTCSGroup, SPLTCSGroupAdmin)

admin.site.unregister(Group)

# vim sts=4 ts=4 sw=4 et ai
