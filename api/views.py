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

    try:
        markers_model = MarkersModel()

        response = {
            "response": "this is a response from markerss"
        }

        response = markers_model.get_markers(marker_type)

        return JsonResponse(response, safe=False)
    except Exception as e:
        print("markers endpoint error")
        print(e)


def boundaries(self, boundary_type):

    boundaries_model = BoundariesModel()

    response = {"data": boundaries_model.get_boundaries(boundary_type) }

    return JsonResponse(response)