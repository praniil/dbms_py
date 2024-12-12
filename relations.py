import psycopg2
from dotenv import load_dotenv
import os

load_dotenv()

dbname = os.getenv("DB_NAME")
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")
host = os.getenv("DB_HOST")
port = os.getenv("DB_PORT")

connection = psycopg2.connect(
    dbname = dbname,
    user = user,
    password = password,
    host = host,
    port = port,
)

cursor = connection.cursor()

create_table_query = '''
    CREATE TABLE if not exists Customers(
        customer_id Serial PRIMARY key, 
        name varchar(50),
        email varchar(50) UNIQUE
    );

    CREATE TABLE if not exists Orders(
        order_id Serial PRIMARY key,
        order_date DATE,
        customer_id int,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    );
'''
cursor.execute(create_table_query)

insert_table_query = '''
    INSERT INTO Customers(name, email) VALUES
    ('Pranil', 'pranil@gmail.com'),
    ('Swopnil', 'swopnil@gmail.com'),
    ('Ram', 'ram@gmail.com'),
    ('Ramesh', 'ramash@gmail.com');

    INSERT INTO Orders(order_date, customer_id) Values
    ('2024-12-01', 1),
    ('2024-12-02', 1),
    ('2024-12-04', 2),
    ('2024-12-20', 1),
    ('2024-12-01', 3);
'''
cursor.execute(insert_table_query)

connection.commit()

print("connected to the database")
cursor.close()
connection.close()