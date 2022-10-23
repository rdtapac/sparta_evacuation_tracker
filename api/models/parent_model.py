from django.conf import settings
import psycopg2
from psycopg2.extras import RealDictCursor

class ParentModel:

    db_conn = None

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
        self.db_conn = obj_conn.cursor(cursor_factory=RealDictCursor)

        print(self.db_conn)
        print("construct parent model")
        return