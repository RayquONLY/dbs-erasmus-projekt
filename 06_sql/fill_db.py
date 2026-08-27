from utils import execute_sql

def fill_tables() -> None:
  
  command: str = ""
  with open("/home/jonathan/Documents/UNI/GitLab/dbs-erasmus-projekt/06_sql/fill_db.sql", "r") as f:
    command = f.read()
    print(command)
    execute_sql(command)
