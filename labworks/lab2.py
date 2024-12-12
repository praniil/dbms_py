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

create_publisher_table = '''
    create table if not exists Publishers(
        id int PRIMARY KEY,
        name varchar(50),
        country varchar(50)
    );
'''
cursor.execute(create_publisher_table)

create_author_table = '''
    create table if not exists Authors(
        author_id int PRIMARY KEY,
        author_name varchar(50),
        dob Date
    );
'''
cursor.execute(create_author_table)

create_book_table = '''
    create table if not exists Books(
        isbn int PRIMARY KEY,
        title varchar(50),
        publication_year date,
        number_of_pages int,
        author_id int,
        publisher_id int,
        FOREIGN KEY (author_id) references Authors(author_id),
        FOREIGN KEY (publisher_id) references Publishers(id)
    );
'''
cursor.execute(create_book_table)

create_review_table = '''
    create table if not exists Reviews(
        review_id int PRIMARY KEY,
        rating int,
        comment varchar(50),
        review_date date,
        book_isbn int,
        FOREIGN KEY (book_isbn) references Books(isbn)
    );
'''
cursor.execute(create_review_table)

insert_in_publishers = '''
    insert into Publishers(id, name, country)
    Values(1,'Bloomsbury', 'UK'),
    (2, 'Bantam Books', 'USA'),
    (3, 'Allen & Unwin', 'Australia')
'''
cursor.execute(insert_in_publishers)

insert_in_authors = '''
    insert into Authors(author_id, author_name, dob)
    Values(1, 'J.K. Rowling', '1965-07-31'),
    (2, 'George R.R. Martin', '1948-09-20'),
    (3, 'J.R.R. Tolkien', '1892-01-03')
'''
cursor.execute(insert_in_authors)

insert_in_books = '''
    insert into Books(isbn, title, publication_year, number_of_pages, author_id, publisher_id)
    Values(1, 'Harry Potter and the Philosophers Stone', NULL, NULL, 1, NULL),
    (2, 'Bloomsbury', '1997-06-26', 20, NULL, NULL),
    (3, 'A Game of Thrones', '1996-08-06', 25, 2, 2),
    (4, 'The Hobbit', '1937-09-21', 15, 3, 3)
'''
cursor.execute(insert_in_books)

insert_in_reviews = '''
    insert into Reviews(review_id, rating, comment, review_date, book_isbn)
    Values(1, 5, 'A magical journey', '1997-07-01', 1),
    (2, 4, 'An epic tale of power and betrail', '1996-08-10', 2),
    (3, 5, 'A timeless classic', '1937-10-01', 4)
'''
cursor.execute(insert_in_reviews)

connection.commit()
print("connected to the database")
cursor.close()
connection.close()