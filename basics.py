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
    create table if not exists ValorantPlayers(
        name varchar(60) unique,
        age int,
        current_team varchar(60),
        team_role varchar(60)
    )
'''
cursor.execute(create_table_query)

insert_table_data = '''
    insert into ValorantPlayers (name, age, current_team, team_role)
    values('Tenz', 24, 'Sentinels', 'Controller'),
    ('Sacy', 29, 'Sentinels', 'Initiator'),
    ('Zekken', 20, 'Sentinels', 'Duelist'),
    ('Zellsis', 27, 'Sentinels', 'Flex / lurk / Midround igl'),
    ('Johnqt', 24, 'Sentinels', 'Sentinel/ Igl')
'''

cursor.execute(insert_table_data)

cursor.execute("select version();")


get_table_data = '''
    select * from ValorantPlayers;
'''

cursor.execute(get_table_data)
rows = cursor.fetchall()

for row in rows:
    print(row)

connection.commit()

print("connected to the database")
cursor.close()
connection.close()