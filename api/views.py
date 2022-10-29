import json
from django.http import JsonResponse

from .models.boundaries_model import BoundariesModel
from .models.markers_model import MarkersModel
from .models.boundaries_helper_model import BoundariesHelperModel

def test_endpoint(self):

    # helper_model = BoundariesHelperModel()
    # helper_model.populate_barangay_stats()

    response = {
        "response": "this is a response from test endpoint"
    }
    return JsonResponse(response)

def markers(self, marker_type):

    try:
        markers_model = MarkersModel()

        response = {
            "status": 200
        }

        marker_data = markers_model.get_markers(marker_type)
        response = {
            "status": 200,
            "data": marker_data
        }

        return JsonResponse(response, safe=False)
    except Exception as e:
        print("markers endpoint error")
        print(e)


def boundaries(self, boundary_type):

    response = {
        "status": 200
    }

    boundaries_model = BoundariesModel()

    response = {"data": boundaries_model.get_boundaries(boundary_type) }

    return JsonResponse(response)