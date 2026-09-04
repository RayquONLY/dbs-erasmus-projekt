from psycopg2 import connect
from os import getenv
from dotenv import load_dotenv

load_dotenv()

def execute_sql(command: str) -> None:
    env_password = getenv("DB_PASSWORD")
    db_name = getenv("DB_NAME")
  
    connector = connect(
        dbname=db_name,
        user="jonathan",
        password=env_password,
        host="localhost",
    )

    connector.autocommit = True
    cursor = connector.cursor()


    cursor.execute(command)

    cursor.close()


def recreate_db() -> None:
  env_password = getenv("DB_PASSWORD")
  db_name = getenv("DB_NAME")

  connector = connect(
    dbname=db_name,
    user="jonathan",
    password=env_password,
    host="localhost",
  )

  connector.autocommit = True
  cursor = connector.cursor()

  cursor.execute(f"DROP DATABASE {db_name};")

  cursor.execute(f"CREATE DATABASE {db_name};")

  cursor.close()


def fill_tables() -> None:
  
  command: str = ""
  with open("/home/jonathan/Documents/UNI/GitLab/dbs-erasmus-projekt/06_sql/fill_db.sql", "r") as f:
    command = f.read()
    #print(command)
    execute_sql(command)



def create_tables() -> None:
  command: str = ""
  with open("/home/jonathan/Documents/UNI/GitLab/dbs-erasmus-projekt/06_sql/create_db.sql", "r") as f:
    command = f.read()
    #print(command)
    execute_sql(command)
