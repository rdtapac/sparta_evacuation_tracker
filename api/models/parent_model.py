from django.conf import settings
import psycopg2
import numpy
from psycopg2.extras import RealDictCursor

class ParentModel:

    obj_cursor = None
    obj_actual_conn = None

    """Class constructor

    Args:
        None
    Returns:
        None
    """
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