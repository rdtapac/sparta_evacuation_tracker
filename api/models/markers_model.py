from .parent_model import ParentModel
from datetime import datetime
import json

class MarkersModel(ParentModel):

    """Constructor

    Args:
        None
    Returns:
        None
    """
    def __init__(self) -> None:
        super().__init__()
        print("markers model instantiated")
        return

    """Get Markers

    Args:
        marker_type: marker type flag
    Returns:
        list of marker objects
    """
    def get_markers(self, marker_type = 0):
        if marker_type == 0:
            return self.get_evacuation_centers()
        elif marker_type == 1:
            return self.get_facilities()
        else:
            return []

    """Get evacuation center markers

    Args:
        None
    Returns:
        list of evacuation center marker objects
    """
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
                WHERE
                    ec.date_active_end IS NULL
            """

            self.obj_cursor.execute(sql_get_evacuation_markers)
            rs_markers_rows = self.obj_cursor.fetchall()

            for rs_marker_row in rs_markers_rows:

                cur_date = datetime.today()
                start_date = rs_marker_row["ec_date_active_start"]
                delta_date = cur_date - start_date
                days_diff = delta_date.days if(delta_date.days > 0) else 1

                obj_marker_row = {
                    "marker_id": rs_marker_row["ec_evacuation_center_id"]
                    , "label": rs_marker_row["fc_name"]
                    , "id": "evacuation_center_" + str(rs_marker_row["ec_evacuation_center_id"])
                    , "address": rs_marker_row["fc_address"]
                    , "coordinates": json.loads(rs_marker_row["fc_coordinates"])
                    , "primary_phone": rs_marker_row["fc_phone_primary"]
                    , "facility_type_id": rs_marker_row["ft_facility_type_id"]
                    , "facility_type_label": rs_marker_row["ft_facility_type_label"]
                    , "additional_attributes": {
                        "facility_id": rs_marker_row["ec_facility_id"]
                        , "date_active_start": rs_marker_row["ec_date_active_start"].strftime("%m-%d-%y %H:%M:%S %p")
                        , "date_active_end": rs_marker_row["ec_date_active_end"].strftime("%m-%d-%y %H:%M:%S %p") if(rs_marker_row["ec_date_active_end"]) else ''
                        , "days_active": days_diff
                        , "is_evacuation_center": True
                    }
                }
                print(obj_marker_row)
                return_result.append(obj_marker_row)

            return return_result

            pass
        except Exception as e:
            print("Error encountered in markers model (evacuation center)")
            print(e)

    """Get facilities markers

    Args:
        None
    Returns:
        list of facilities marker objects
    """
    def get_facilities(self):
        return_result = []

        try:
            sql_get_facility_markers = """
                WITH evacuation_centers_list AS (
                    SELECT facility_id FROM evacuation_center ec 
                ) 
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
                AND
                    fc.facility_id NOT IN(SELECT * FROM evacuation_centers_list)
            """                

            self.obj_cursor.execute(sql_get_facility_markers)
            rs_markers_rows = self.obj_cursor.fetchall()

            for rs_marker_row in rs_markers_rows:
                obj_marker_row = {
                    "marker_id": rs_marker_row["fc_facility_id"]
                    , "label": rs_marker_row["fc_name"]
                    , "id": "facility_" + str(rs_marker_row["fc_facility_id"])
                    , "address": rs_marker_row["fc_address"]
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