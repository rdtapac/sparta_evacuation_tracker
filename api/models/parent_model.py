from django.conf import settings
import psycopg2
import numpy
from psycopg2.extras import RealDictCursor
from psycopg2.extensions import register_adapter, AsIs

def addapt_numpy_float64(numpy_float64):
    return AsIs(numpy_float64)
def addapt_numpy_int64(numpy_int64):
    return AsIs(numpy_int64)
register_adapter(numpy.float64, addapt_numpy_float64)
register_adapter(numpy.int64, addapt_numpy_int64)

class ParentModel:

    obj_cursor = None
    obj_actual_conn = None

    def __init__(self) -> None:
        print(settings.DB_NAME)

        # Initialize db connection for child classes
        obj_conn = psycopg2.connect(
            database=settings.DB_NAME,
            user=settings.DB_USER,
            password=settings.DB_PASSWORD,
            host=settings.DB_HOST,
            port=settings.DB_PORT
        )

        self.obj_actual_conn = obj_conn
        self.obj_cursor = obj_conn.cursor(cursor_factory=RealDictCursor)

        print(self.obj_cursor)
        print("construct parent model")
        return