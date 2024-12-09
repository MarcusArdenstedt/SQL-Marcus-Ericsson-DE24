from pathlib import Path

# __file__ - dunder file 
# absolute path constants.py
# / "data" --> concatenate with "data"
# / operator works here because of operatore overloading and polymorphism
DATA_PATH = Path(__file__).parent / "data"
DATABASE_PATH = Path(__file__).parent / "goterborg_stad.db"


print(DATA_PATH)