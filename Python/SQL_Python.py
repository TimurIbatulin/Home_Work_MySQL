# import mysql.connector as sql
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="80AciPar@80",
    database="Home_Work_PYTHON_MySQL"  
)
c = db.cursor()
d = "DROP TABLE IF EXISTS table_python"
c.execute(d)

# # Создание таблицы
c = db.cursor()
table_create = """CREATE TABLE `table_python`(`id` INT PRIMARY KEY AUTO_INCREMENT, `name` VARCHAR(45), `second_name` VARCHAR(20))"""
c.execute(table_create)
c = db.cursor()
c.execute("desc table_python")
for i in c:
    print(i)

# # Добавление содержания 
c = db.cursor()
had = """INSERT INTO table_python(name, second_name) VALUES (%s, %s)"""
data = [("Ваня", "Дураков"), ("Петя", "Петухов")]
c.executemany(had, data)
db.commit()

# # Вывод таблицы
c.execute("SELECT * FROM table_python")
data = c.fetchall()
for e in data:
    print(e)

# UPDATE
up = "UPDATE table_python SET name = 'Вахтанг' WHERE second_name = 'Петухов'"
c.execute(up)
db.commit() 
c.execute("SELECT * FROM table_python")
data = c.fetchall()
for e in data:
    print(e)

db.close()