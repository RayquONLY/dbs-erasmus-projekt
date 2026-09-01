from create_db import recreate_db, create_tables, fill_tables

def main() -> None:
  recreate_db("erasmus_projekt")
  create_tables()
  fill_tables()

if __name__ == "__main__":
  main()