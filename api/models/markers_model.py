

class MarkersModel:

    def __init__(self) -> None:
        print("markers model instantiated")
        pass

    def get_markers(self):

        return {
                "evacuation_centers": [
                    {
                        "label": "Evacuation Center 1",
                        "id": "e_center_1",
                        "coordinates": {"lat": 16.87854037431313, "lng": 121.85548420423102}
                    },
                    {
                        "label": "Evacuation Center 2",
                        "id": "e_center_2",
                        "coordinates": {"lat": 16.939473443912565, "lng": 121.76793690195545}
                    },
                    {
                        "label": "Evacuation Center 3",
                        "id": "e_center_3",
                        "coordinates": {"lat": 16.942921896125124, "lng": 121.77806492326522}
                    }
                ],
                "pickup_points": [
                    {
                        "label": "Pickup Point 1",
                        "id": "pickup_1",
                        "coordinates": {"lat": 16.9302772623189, "lng": 121.7990076113972}
                    },
                    {
                        "label": "Pickup Point 2",
                        "id": "pickup_2",
                        "coordinates": {"lat": 16.885932227661485, "lng": 121.67489643526515}
                    },
                    {
                        "label": "Pickup Point 3",
                        "id": "pickup_3",
                        "coordinates": {"lat": 16.864741475060434, "lng": 121.74201603398606}
                    }
                ],
                "facilities": [
                    {
                        "label": "Facility 1",
                        "id": "facility_1",
                        "coordinates": {"lat": 16.948649752327544, "lng": 121.77235492231901}
                    },
                    {
                        "label": "Facility 2",
                        "id": "facility_2",
                        "coordinates": {"lat": 16.93912867057586, "lng": 121.81872199673616}
                    },
                ]
            }
