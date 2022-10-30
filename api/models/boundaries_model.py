from .parent_model import ParentModel
import json

class BoundariesModel(ParentModel):

    """Constructor
    Args:
        None
    Returns:
        None
    """
    def __init__(self) -> None:
        super().__init__()
        print("boundaries model instantiated")

    """ Get boundaries

    Args:
        boundary_type: boundary type flag if city or barangay
    Returns:
        list of boundary objects

    """
    def get_boundaries(self, boundary_type = 0):
        if boundary_type == 0:
            return self.get_city_boundaries()
        else:
            return self.get_barangay_boundaries()


    """Get barangay boundaries

    Args:
        None
    Returns:
        list of barangay objects

    """
    def get_barangay_boundaries(self):
        return_result = []

        try:
            sql_get_city_boundaries = """
                SELECT barangay_id, name, political_boundaries, elevation from barangay
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
                    , "elevation": rs_brgy_row["elevation"]
                    , "risk": self.detect_alert_status(rs_brgy_row["barangay_id"])
                }

                print(obj_elem)

                return_result.append(obj_elem)

        except Exception as e:
            print('Error encountered:')
            print(e)

        return return_result

    """Detect alert status

    Args:
        brgy_id: barangay id for search condition
    Returns:
        string categorization of risk level

    """
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

            num_exp_flooding = rs_brgy_row['num_exp_flooding']

            # print(type(num_exp_flooding))
            # print(num_exp_flooding)
            # base formula on model: 2.718^(0.20*Number  of Households who experienced more frequent flooding + 1.543)
            compute_risk_value = 2.718 ** (0.20*rs_brgy_row['num_exp_flooding']+1.543)

            if compute_risk_value > 78:
                return_status = 'high'
            elif compute_risk_value <= 78 and compute_risk_value >= 25:
                return_status = 'medium'
            else:
                return_status = 'low'

            # return_result = json.loads(rs_city_row['political_boundaries'])
        except Exception as e:
            print(e)
        
        return return_status

    """Get City Boundaries

    Args:
        None
    Returns:
        Dictionary object of cauayan city data

    """
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