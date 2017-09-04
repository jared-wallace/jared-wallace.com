import re
from django.forms import ModelForm
from django import forms

class EmailForm(forms.Form):
    email = forms.CharField(max_length=100, widget=forms.Textarea(attrs={'cols': 70, 'rows': 1}))
    subject = forms.CharField(max_length=200,widget=forms.Textarea(attrs={'cols': 70, 'rows': 1}))
    message = forms.CharField(widget=forms.Textarea)
