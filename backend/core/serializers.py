from rest_framework import serializers
from .models import Profile, Project, Experience, Testimony


class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = '__all__'


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = '__all__'


class ExperienceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Experience
        fields = '__all__'


class TestimonySerializer(serializers.ModelSerializer):
    class Meta:
        model = Testimony
        fields = '__all__'