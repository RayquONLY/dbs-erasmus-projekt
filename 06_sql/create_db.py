from psycopg2 import connect


def execute_sql(command: str) -> None:
  connector = connect(
      dbname="erasmus-projekt",
      user="jonathan",
      password="1223",
      host="localhost",
  )

  connector.autocommit = True
  cursor = connector.cursor()


  cursor.execute(command)

  cursor.close()

 

def main() -> None:
  
  command: str = ""
  with open("/home/jonathan/Documents/UNI/GitLab/dbs-erasmus-projekt/06_sql/create_db.sql", "r") as f:
    command = f.read()
    print(command)
    execute_sql(command)


if __name__ == "__main__":
  main()