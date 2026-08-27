from psycopg2 import connect
from os import getenv
from dotenv import load_dotenv

load_dotenv()

def execute_sql(command: str) -> None:
    env_password = getenv("DB_PASSWORD")
  
    connector = connect(
        dbname="erasmus_projekt",
        user="jonathan",
        password=env_password,
        host="localhost",
    )

    connector.autocommit = True
    cursor = connector.cursor()


    cursor.execute(command)

    cursor.close()