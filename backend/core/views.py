from rest_framework import viewsets
from rest_framework import status, viewsets
from rest_framework.response import Response
from django.core.mail import send_mail
from django.conf import setting
from .models import Profile, Project, Experience, Testimony,Contact,Service
from .serializers import (
    ProfileSerializer,
    ProjectSerializer,
    ExperienceSerializer,
    TestimonySerializer,
    ServiceSerializer,
    ContactSerializer
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

class ServiceViewSet(viewsets.ModelViewSet):
    queryset = Service.objects.all()
    serializer_class = ServiceSerializer


class ContactViewSet(viewsets.ModelViewSet):
    queryset = Contact.objects.all()
    serializer_class = ContactSerializer
    http_method_names = ['post']  # autorise seulement POST

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)

        if serializer.is_valid():
            contact = serializer.save()  # sauvegarde en base

            try:
                send_mail(
                    subject=f"Nouveau message: {contact.subject}",
                    message=f"Nom: {contact.name}\nEmail: {contact.email}\nMessage:\n{contact.message}",
                    from_email=settings.DEFAULT_FROM_EMAIL,
                    recipient_list=["thierrygeorgeskouassi@gmail.com"],
                    fail_silently=False,
                )
            except Exception as e:
                return Response(
                    {"message": "Message reçu mais erreur d'envoi mail", "error": str(e)},
                    status=status.HTTP_500_INTERNAL_SERVER_ERROR
                )

            return Response(
                {"message": "Message envoyé avec succès"},
                status=status.HTTP_201_CREATED
            )

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)