#from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader

# Create your views here.
def index(request):
    #return HttpResponse("This is a test...")
    template = loader.get_template('risk_centers_map/index.html')
    context = {
        "list": []
    }
    return HttpResponse(template.render(context, request))