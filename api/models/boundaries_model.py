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

            self.obj_cursor.execute(sql_get_city_boundaries)
            rs_barangay_rows = self.obj_cursor.fetchall()

            a = len(rs_barangay_rows)

            for rs_brgy_row in rs_barangay_rows:

                obj_elem = {
                    "barangay_id": rs_brgy_row["barangay_id"]
                    , "elem_id": "brgy_" + str(rs_brgy_row["barangay_id"])
                    , "name": rs_brgy_row["name"]
                    , "political_boundaries": json.loads(rs_brgy_row["political_boundaries"])
                    , "risk": self.detect_alert_status(rs_brgy_row["barangay_id"])
                }

                print(obj_elem)

                return_result.append(obj_elem)

        except Exception as e:
            print('Error encountered:')
            print(e)

        return return_result

    def detect_alert_status(self, brgy_id):
        return_status = 'low'

        try:
            sql_get_city_boundaries = """
                SELECT 
                    barangay_id
                    , num_exp_flooding
                    , norm_num_exp_flooding
                    , prop_exp_flooding
                    , norm_prop_exp_flooding
                FROM barangay_risk_statistics
                WHERE barangay_id = {brgy_id}
            """.format(brgy_id = brgy_id)

            self.obj_cursor.execute(sql_get_city_boundaries)
            rs_brgy_row = self.obj_cursor.fetchone()

            if rs_brgy_row is None:
                return return_status

            norm_num_exp_flooding_pct = rs_brgy_row['prop_exp_flooding']

            print(type(norm_num_exp_flooding_pct))
            print(norm_num_exp_flooding_pct)
            a = 1

            if norm_num_exp_flooding_pct > 50:
                print('test')
                return_status = 'high'
            elif norm_num_exp_flooding_pct <= 50 and norm_num_exp_flooding_pct >= 25:
                return_status = 'medium'
            else:
                return_status = 'low'

            # return_result = json.loads(rs_city_row['political_boundaries'])
        except Exception as e:
            print(e)
        
        return return_status

    def get_city_boundaries(self):

        return_result = []

        try:
            sql_get_city_boundaries = """
                SELECT name, political_boundaries FROM cauayan_city
            """

            self.obj_cursor.execute(sql_get_city_boundaries)
            rs_city_row = self.obj_cursor.fetchone()

            return_result = json.loads(rs_city_row['political_boundaries'])
        except Exception as e:
            print(e)

        return return_result