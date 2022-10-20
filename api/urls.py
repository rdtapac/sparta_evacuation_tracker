from django.urls import path
from . import views


urlpatterns = [
    path('test_endpoint', views.test_endpoint, name="test_endpoint"),
    path('markers/<int:marker_type>', views.markers, name="markers"),
    path('boundaries/<int:boundary_type>', views.boundaries, name="boundaries")
]