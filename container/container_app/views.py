from django.shortcuts import render
from django.http import HttpResponse
from datetime import date

# Create your views here.
def index(request):
    today = date.today()
    template = f"<html>{today}</html>"
    return HttpResponse(content=template)