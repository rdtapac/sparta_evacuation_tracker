from .parent_model import ParentModel
import json

class BoundariesModel(ParentModel):

    def __init__(self) -> None:
        super().__init__()
        print("boundaries model instantiated")

    def get_boundaries(self, boundary_type = 0):
        if boundary_type == 0:
            return self.get_city_boundaries()
        else:
            return self.get_barangay_boundaries()

    def get_barangay_boundaries(self):
        return_result = []

        try:
            sql_get_city_boundaries = """
                SELECT barangay_id, name, political_boundaries from barangay
            """

            self.db_conn.execute(sql_get_city_boundaries)
            rs_barangay_rows = self.db_conn.fetchall()

            for rs_brgy_row in rs_barangay_rows:

                obj_elem = {
                    "barangay_id": rs_brgy_row["barangay_id"]
                    , "elem_id": "brgy_" + str(rs_brgy_row["barangay_id"])
                    , "name": rs_brgy_row["name"]
                    , "political_boundaries": json.loads(rs_brgy_row["political_boundaries"])
                    , "risk": self.detect_alert_status(rs_brgy_row["barangay_id"])
                }

                return_result.append(obj_elem)

        except Exception as e:
            print('Error encountered:')
            print(e)

        return return_result

    def detect_alert_status(self, brgy_id):
        return_status = 'none'

        # TODO: this is just a placeholder, create actual logic for identifying riks type
        if brgy_id == 1:
            return_status = 'medium'
        elif brgy_id == 2:
            return_status = 'high'
        
        return return_status

    def get_city_boundaries(self):

        return_result = []

        try:
            sql_get_city_boundaries = """
                SELECT name, political_boundaries from cauayan_city
            """

            self.db_conn.execute(sql_get_city_boundaries)
            rs_city_row = self.db_conn.fetchone()

            return_result = json.loads(rs_city_row['political_boundaries'])
        except Exception as e:
            print(e)

        return return_result