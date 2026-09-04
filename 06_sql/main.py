from create_db import recreate_db, create_tables, fill_tables
from time import sleep
from psycopg2.errors import ObjectInUse

def create_and_fill() -> None:
  try:
    recreate_db()
  except ObjectInUse as e:
    print(e)
    print("Disconnect from the Database and try again.")
    return
  create_tables()
  fill_tables()
  print("Done.")


def main() -> None:
  exit: bool = False
  while not exit:
    print("-"*50)
    print("(1) Open Dashboard")
    print("(2) Recreate and Fill Database")
    print("(3) Exit")
    option = input("Select an option: ")

    match option:
      case "1":
        raise(NotImplementedError)
      case "2":
        print("This will undo all changes and revert the Database to the initial state. Are you sure?")
        option = input("(y|n) ")
        if option == "y":
          print("Recreating Database...")
          create_and_fill()
          sleep(1)
      case "3":
        exit = True
      case _:
        print("")
        print("Please select an option from the list.")
        sleep(1)

  

if __name__ == "__main__":
  main()