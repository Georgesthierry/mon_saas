
from django.contrib import admin
from .models import Profile, Project, Experience, Testimony

# 👤 Profile
@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ('name', 'profession', 'updated_at')  # colonnes visibles
    search_fields = ('name', 'profession')              # barre de recherche
    list_filter = ('updated_at',)                       # filtres

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
# Register your models here.


