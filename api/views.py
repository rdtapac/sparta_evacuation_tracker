import json
from django.http import JsonResponse

from .models.boundaries_model import BoundariesModel
from .models.markers_model import MarkersModel
from .models.boundaries_helper_model import BoundariesHelperModel

"""Test Endpoint

Args:
    None
Returns:
    Json response string
"""
def test_endpoint(self):

    # helper_model = BoundariesHelperModel()
    # helper_model.populate_barangay_stats()

    response = {
        "response": "this is a response from test endpoint"
    }
    return JsonResponse(response)


""" Markers API Endpoint

Args:
    marker_type: marker distinguisher flag
Returns:
    Json response string
"""
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

"""Boundaries endpoint

Args:
    boundary_type: flag for distinguising boundary type
Returns:
    Json response string
"""
def boundaries(self, boundary_type):

    response = {
        "status": 200
    }

    boundaries_model = BoundariesModel()

    response = {"data": boundaries_model.get_boundaries(boundary_type) }

    return JsonResponse(response)