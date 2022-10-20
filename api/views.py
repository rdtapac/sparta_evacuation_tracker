import json
from django.http import JsonResponse


def test_endpoint(self):

    response = {
        "response": "this is a response"
    }
    return JsonResponse(response)