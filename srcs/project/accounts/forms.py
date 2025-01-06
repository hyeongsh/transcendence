from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import CustomUser

class CustomUserCreationForm(UserCreationForm):
	emil = forms.EmailField(required=True)

	class Meta:
		model = CustomUser
		fields = ('username', 'email', 'nickname', 'password1', 'password2')