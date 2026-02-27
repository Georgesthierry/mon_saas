from django.contrib import admin
from .models import (
    Profile,
    Project,
    Experience,
    Testimony,
    Service,
    Contact
)

# 👤 Profile
@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ('name', 'profession', 'updated_at')
    search_fields = ('name', 'profession')
    list_filter = ('updated_at',)


# 🏗 Project
@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
    list_display = ('title', 'created_at')
    search_fields = ('title',)
    list_filter = ('created_at',)


# 💼 Experience
@admin.register(Experience)
class ExperienceAdmin(admin.ModelAdmin):
    list_display = ('company', 'role', 'start_date', 'end_date')
    search_fields = ('company', 'role')
    list_filter = ('start_date', 'end_date')


# 💬 Testimony
@admin.register(Testimony)
class TestimonyAdmin(admin.ModelAdmin):
    list_display = ('name', 'company')
    search_fields = ('name', 'company')


# 🛠 Services
@admin.register(Service)
class ServiceAdmin(admin.ModelAdmin):
    list_display = ('title', 'created_at')
    search_fields = ('title',)
    list_filter = ('created_at',)


# 📩 Messages Contact
@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'subject', 'created_at', 'is_read')
    search_fields = ('name', 'email', 'subject')
    list_filter = ('created_at', 'is_read')
    readonly_fields = ('name', 'email', 'subject', 'message', 'created_at')

    actions = ['mark_as_read']

    def mark_as_read(self, request, queryset):
        queryset.update(is_read=True)
    mark_as_read.short_description = "Mark selected messages as read"