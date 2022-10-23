from .parent_model import ParentModel
import json

class BoundariesModel(ParentModel):

    def __init__(self) -> None:
        super().__init__()
        print("boundaries model instantiated")
        pass


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