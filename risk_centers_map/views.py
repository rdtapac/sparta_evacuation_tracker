#from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from django.conf import settings

# Create your views here.
""" Index page for loading risk centers map template

Args:
    request: Django request object
Returns:
    HttpResponse: Django http response object
"""
def index(request):
    #return HttpResponse("This is a test...")
    template = loader.get_template('risk_centers_map/index.html')
    context = {
        "list": [],
        "GOOGLE_MAPS_API_KEY": settings.GOOGLE_MAPS_API_KEY
    }
    return HttpResponse(template.render(context, request))