from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from core.views import (
    ProfileViewSet,
    ProjectViewSet,
    ExperienceViewSet,
    TestimonyViewSet
)

router = DefaultRouter()
router.register(r'profile', ProfileViewSet)
router.register(r'projects', ProjectViewSet)
router.register(r'experiences', ExperienceViewSet)
router.register(r'testimonies', TestimonyViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
]