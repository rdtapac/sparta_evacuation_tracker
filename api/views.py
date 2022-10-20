import json
from django.http import JsonResponse

from .models.boundaries_model import BoundariesModel
from .models.markers_model import MarkersModel

def test_endpoint(self):

    test_model = BoundariesModel()

    response = {
        "response": "this is a response from test endpoint"
    }
    return JsonResponse(response)

def markers(self, marker_type):

    markers_model = MarkersModel()

    response = {
        "response": "this is a response from markerss"
    }

    if marker_type == 0:
        response = markers_model.get_markers()

    return JsonResponse(response)

def boundaries(self, boundary_type):

    boundaries_model = BoundariesModel()

    response = {
        "response": "this is a response from boundaries"
    }

    if boundary_type == 0:
        response = {"coords_list": boundaries_model.get_city_boundaries() }

    return JsonResponse(response)