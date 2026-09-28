from psycopg2 import connect
from os import getenv
from dotenv import load_dotenv
from sql_utils import execute_sql

load_dotenv()


def recreate_db() -> None:
  db_user = getenv("DB_USER")
  db_password = getenv("DB_PASSWORD")
  db_name = getenv("DB_NAME")
  db_host = getenv("DB_HOST")

  connector = connect(
    dbname="postgres",
    user=db_user,
    password=db_password,
    host=db_host,
  )

  connector.autocommit = True
  cursor = connector.cursor()

  cursor.execute(f"DROP DATABASE {db_name};")

  cursor.execute(f"CREATE DATABASE {db_name};")

  cursor.close()


def fill_tables() -> None:
  sql_file = getenv("DB_FILL_TABLES_FILE")
  if sql_file == None:
    raise(ValueError)
  command: str = ""
  with open(sql_file, "r") as f:
    command = f.read()
    #print(command)
    execute_sql(command)



def create_tables() -> None:
  sql_file = getenv("DB_CREATE_TABLES_FILE")
  if sql_file == None:
    raise(ValueError)
  command: str = ""
  with open("", "r") as f:
    command = f.read()
    #print(command)
    execute_sql(command)
