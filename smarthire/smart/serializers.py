from django.contrib.auth.models import User
from rest_framework import serializers
from .models import Users


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = ['id','name', 'email', 'password','exam_id','score']

        