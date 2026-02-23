from rest_framework import viewsets
from .models import Profile, Project, Experience, Testimony
from .serializers import (
    ProfileSerializer,
    ProjectSerializer,
    ExperienceSerializer,
    TestimonySerializer
)


class ProfileViewSet(viewsets.ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer


class ProjectViewSet(viewsets.ModelViewSet):
    queryset = Project.objects.all().order_by('-created_at')
    serializer_class = ProjectSerializer


class ExperienceViewSet(viewsets.ModelViewSet):
    queryset = Experience.objects.all().order_by('-start_date')
    serializer_class = ExperienceSerializer


class TestimonyViewSet(viewsets.ModelViewSet):
    queryset = Testimony.objects.all()
    serializer_class = TestimonySerializer