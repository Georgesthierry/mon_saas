from django.db import models


class Profile(models.Model):
    name = models.CharField(max_length=150)
    profession = models.CharField(max_length=200)
    description = models.TextField()
    photo = models.ImageField(upload_to='profile/')
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Project(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    image = models.ImageField(upload_to='projects/')
    url = models.URLField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title


class Experience(models.Model):
    company = models.CharField(max_length=200)
    role = models.CharField(max_length=200)
    description = models.TextField()
    start_date = models.DateField()
    end_date = models.DateField(null=True, blank=True)

    def __str__(self):
        return f"{self.role} - {self.company}"


class Testimony(models.Model):
    name = models.CharField(max_length=150)
    company = models.CharField(max_length=150)
    message = models.TextField()
    photo = models.ImageField(upload_to='testimonies/', null=True, blank=True)

    def __str__(self):
        return self.name


from django.db import models

# Create your models here.
