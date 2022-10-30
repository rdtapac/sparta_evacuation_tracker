from .parent_model import ParentModel

import pandas as pd
import json

class BoundariesHelperModel(ParentModel):

    """Class constructor

    Args:
        None
    Returns:
        None
    """
    def __init__(self) -> None:
        super().__init__()
        print("boundaries helper model instantiated")

    """Get barangay list from barangay table

    Args:
        None
    Returns:
        List of resultset objects
    """
    def get_existing_barangay_list(self):
        existing_brgy_list = []
        sql_get_existing_brgy = """
            SELECT 
                barangay_id
                , name 
                , LOWER(name) as l_name
            from barangay
        """

        self.obj_cursor.execute(sql_get_existing_brgy)

        rs_barangay_rows = self.obj_cursor.fetchall()

        existing_brgy_list = []
        for rs_brgy_row in rs_barangay_rows:
            brgy_elem = {
                "id": rs_brgy_row["barangay_id"]
                , "name": rs_brgy_row["name"]
                , "name_lower": rs_brgy_row["l_name"]
            }
            existing_brgy_list.append(brgy_elem)
        
        return existing_brgy_list

    """Populate barangay rows

    Args:
        None
    Returns:
        List of resultset objects
    """
    def populate_barangay_rows(self):

        df_path = "/home/ralph/Development/prototype/client_prototype/risk_centers_map/data_source_files/brgy_list.json"

        existing_barangay_list = self.get_existing_barangay_list()
        # print(existing_barangay_list)

        df = pd.read_json(df_path)

        existing_brgy_id_list = []
        for i in range(len(df)):
            skip_barangay = False
            brgy_name = df.loc[i, "properties"]["NAME_3"]
            brgy_name_lower = brgy_name.lower()

            coordinates = df.loc[i, "geometry"]["coordinates"][0]
            
            for y in existing_barangay_list:
                if y["name_lower"] == brgy_name_lower:
                    existing_brgy_id_list.append(y["id"])
                    skip_barangay = True
                    break

            if skip_barangay:
                print("Barangay {0} exists [{1}]!".format(y["name_lower"], y["id"]))
                continue
            else:
                print("CONTINUE for {0}".format(brgy_name))
                new_bry_coords = []
                for c_i in coordinates:
                    lng = 0
                    lat = 0
                    lng = c_i[0]
                    lat = c_i[1]
                    new_bry_coords.append({
                        "lng" : lng,
                        "lat" : lat
                    })

                str_coords = str(new_bry_coords).replace("'", '"')

                print(str_coords)
                print(type(str_coords))

                try:
                    sql_new_barangay = """
                        INSERT INTO barangay (name, political_boundaries) 
                        values (%s, %s)
                    """
                    print(sql_new_barangay)
                    self.obj_cursor.execute(sql_new_barangay, (brgy_name, str_coords))
                    self.obj_actual_conn.commit()
                except Exception as e:
                    print(e)

    """Populate barangay stats

    Args:
        None
    Returns:
        List of resultset objects
    """
    def populate_barangay_stats(self):

        existing_barangay_list = self.get_existing_barangay_list()
        # print(existing_barangay_list)

        df_path = "/home/ralph/Development/prototype/client_prototype/risk_centers_map/data_source_files/brgy_data.csv"
        df = pd.read_csv(df_path)

        unprocessed_list = []

        for i in range(len(df)):
            skip_barangay = False
            brgy_name = df.loc[i, "brgy"]
            brgy_name_lower = brgy_name.lower()
            target_brgy_id = None

            for y in existing_barangay_list:
                if y["name_lower"] == brgy_name_lower:
                    target_brgy_id = y["id"]
                    skip_barangay = True
                    break
            
            if target_brgy_id is None:
                unprocessed_list.append(brgy_name)
            else:
                num_exp_flooding = df.loc[i, "Number of Households who experienced more frequent flooding"]
                norm_num_exp_flooding = df.loc[i, "Normalized number of household who experience flooding"]
                prop_exp_flooding = df.loc[i, "Proportion of household experiencing floods"]
                norm_prop_exp_flooding = df.loc[i, "Normalized proportion of households experiencing floods"]

                elevation = df.loc[i, "brgy_elev"]
                print ("Create rows for baragay ID {0}".format(target_brgy_id))
                print ("{0} | {1} | {2} | {3}".format(num_exp_flooding, norm_num_exp_flooding, prop_exp_flooding, norm_prop_exp_flooding))
                
                try:
                    #  update barangay stats table
                    sql_update_barangay_stats = """
                        INSERT INTO barangay_risk_statistics (
                            barangay_id
                            , num_exp_flooding
                            , norm_num_exp_flooding
                            , prop_exp_flooding
                            , norm_prop_exp_flooding
                        ) 
                        VALUES (%s, %s, %s, %s, %s)
                    """
                    print(sql_update_barangay_stats)
                    scalar_update_vals = (
                        int(target_brgy_id)
                        , float(num_exp_flooding)
                        , float(norm_num_exp_flooding)
                        , float(prop_exp_flooding)
                        , float(norm_prop_exp_flooding)
                    )
                    self.obj_cursor.execute(sql_update_barangay_stats, scalar_update_vals)

                    #  update elevation column in barangay table
                    sql_update_barangay_elev = """
                        UPDATE barangay
                            SET elevation = {elevation}
                        WHERE
                            barangay_id = {brgy_id}
                    """.format(brgy_id = target_brgy_id, elevation = elevation)
                    print(sql_update_barangay_elev)
                    print('test')
                    self.obj_cursor.execute(sql_update_barangay_elev)
                    self.obj_actual_conn.commit()
                except Exception as e:
                    print(e)


        print(unprocessed_list)