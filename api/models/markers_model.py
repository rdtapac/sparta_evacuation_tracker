from .parent_model import ParentModel
import json

class MarkersModel(ParentModel):

    def __init__(self) -> None:
        super().__init__()
        print("markers model instantiated")
        return

    def get_markers(self, marker_type = 0):
        if marker_type == 0:
            return self.get_facilities()
        elif marker_type == 1:
            return self.get_evacuation_centers()
        else:
            return []

    def get_evacuation_centers(self):
        return_result = []

        try:
            sql_get_evacuation_markers = """
                SELECT
                    ec.evacuation_center_id as ec_evacuation_center_id
                    , ec.facility_id as ec_facility_id
                    , ec.date_active_start as ec_date_active_start
                    , ec.date_active_end as ec_date_active_end
                    , fc.barangay_id as fc_barangay_id
                    , fc.facility_type_id as fc_facility_type_id
                    , fc.name as fc_name
                    , fc.address as fc_address
                    , fc.phone_primary as fc_phone_primary
                    , fc.coordinates as fc_coordinates
                    , ft.facility_type_id as ft_facility_type_id
                    , ft.facility_type_label as ft_facility_type_label
                FROM
                    evacuation_center ec 
                JOIN
                    facilities fc
                    ON ec.facility_id = fc.facility_id
                JOIN
                    facility_type ft
                    ON fc.facility_type_id = ft.facility_type_id
            """

            self.db_conn.execute(sql_get_evacuation_markers)
            rs_markers_rows = self.db_conn.fetchall()

            for rs_marker_row in rs_markers_rows:
                obj_marker_row = {
                    "marker_id": rs_marker_row["ec_evacuation_center_id"]
                    , "label": rs_marker_row["fc_name"]
                    , "id": "evacuation_center_" + str(rs_marker_row["ec_evacuation_center_id"])
                    , "coordinates": json.loads(rs_marker_row["fc_coordinates"])
                    , "primary_phone": rs_marker_row["fc_phone_primary"]
                    , "facility_type_id": rs_marker_row["ft_facility_type_id"]
                    , "facility_type_label": rs_marker_row["ft_facility_type_label"]
                    , "additional_attributes": {
                        "facility_id": rs_marker_row["ec_facility_id"]
                        , "date_active_start": rs_marker_row["ec_date_active_start"]
                        , "date_active_end": rs_marker_row["ec_date_active_end"]
                    }
                }
                print(obj_marker_row)
                return_result.append(obj_marker_row)

            return return_result

            pass
        except Exception as e:
            print("Error encountered in markers model (evacuation center)")
            print(e)


    def get_facilities(self):
        return_result = []

        try:
            sql_get_facility_markers = """
                SELECT 
                    fc.facility_id as fc_facility_id
                    , fc.barangay_id as fc_barangay_id
                    , fc.facility_type_id as fc_facility_type_id
                    , fc.name as fc_name
                    , fc.address as fc_address
                    , fc.phone_primary as fc_phone_primary
                    , fc.coordinates as fc_coordinates
                    , ft.facility_type_id as ft_facility_type_id
                    , ft.facility_type_label as ft_facility_type_label
                FROM
                    facilities AS fc
                JOIN
                    facility_type AS ft
                    ON
                        fc.facility_type_id = ft.facility_type_id
            """                

            self.db_conn.execute(sql_get_facility_markers)
            rs_markers_rows = self.db_conn.fetchall()

            for rs_marker_row in rs_markers_rows:
                obj_marker_row = {
                    "marker_id": rs_marker_row["fc_facility_id"]
                    , "label": rs_marker_row["fc_name"]
                    , "id": "facility_" + str(rs_marker_row["fc_facility_id"])
                    , "coordinates": json.loads(rs_marker_row["fc_coordinates"])
                    , "primary_phone": rs_marker_row["fc_phone_primary"]
                    , "facility_type_id": rs_marker_row["ft_facility_type_id"]
                    , "facility_type_label": rs_marker_row["ft_facility_type_label"]
                }
                print(obj_marker_row)
                return_result.append(obj_marker_row)

            return return_result
        except Exception as e:
            print("Error encountered in markers model (facilities)")
            print(e)

        # return {
        #         "evacuation_centers": [
        #             {
        #                 "label": "Evacuation Center 1",
        #                 "id": "e_center_1",
        #                 "coordinates": {"lat": 16.87854037431313, "lng": 121.85548420423102}
        #             },
        #             {
        #                 "label": "Evacuation Center 2",
        #                 "id": "e_center_2",
        #                 "coordinates": {"lat": 16.939473443912565, "lng": 121.76793690195545}
        #             },
        #             {
        #                 "label": "Evacuation Center 3",
        #                 "id": "e_center_3",
        #                 "coordinates": {"lat": 16.942921896125124, "lng": 121.77806492326522}
        #             }
        #         ],
        #         "pickup_points": [
        #             {
        #                 "label": "Pickup Point 1",
        #                 "id": "pickup_1",
        #                 "coordinates": {"lat": 16.9302772623189, "lng": 121.7990076113972}
        #             },
        #             {
        #                 "label": "Pickup Point 2",
        #                 "id": "pickup_2",
        #                 "coordinates": {"lat": 16.885932227661485, "lng": 121.67489643526515}
        #             },
        #             {
        #                 "label": "Pickup Point 3",
        #                 "id": "pickup_3",
        #                 "coordinates": {"lat": 16.864741475060434, "lng": 121.74201603398606}
        #             }
        #         ],
        #         "facilities": [
        #             {
        #                 "label": "Facility 1",
        #                 "id": "facility_1",
        #                 "coordinates": {"lat": 16.948649752327544, "lng": 121.77235492231901}
        #             },
        #             {
        #                 "label": "Facility 2",
        #                 "id": "facility_2",
        #                 "coordinates": {"lat": 16.93912867057586, "lng": 121.81872199673616}
        #             },
        #         ]
        #     }
