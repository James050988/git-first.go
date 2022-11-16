# Library task

CREATE DATABASE library;

SHOW DATABASES;

USE library;

CREATE TABLE customer(
cust_id INT UNIQUE NOT NULL AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL,
surname VARCHAR(30) NOT NULL,
mobile_no CHAR(11) DEFAULT "n/a",
address VARCHAR(50),
age INT,
email VARCHAR(30) DEFAULT "n/a",
PRIMARY KEY(cust_id));

SHOW TABLES;

DESCRIBE customer;

CREATE TABLE books(
books_id INT UNIQUE NOT NULL AUTO_INCREMENT,
book_title VARCHAR(50) NOT NULL,
genre VARCHAR(50) NOT NULL,
author VARCHAR(50) NOT NULL,
synopsis VARCHAR(100) NOT NULL,
PRIMARY KEY(books_id));

SHOW TABLES;

DESCRIBE books;

CREATE TABLE orders(
orders_id INT UNIQUE NOT NUll AUTO_INCREMENT,
fk_cust_id INT NOT NULL,
check_out DATETIME DEFAULT current_timestamp,
check_in DATETIME DEFAULT current_timestamp,
PRIMARY KEY(orders_id),
FOREIGN KEY(fk_cust_id) REFERENCES customer(cust_id));

SHOW TABLES;

DESCRIBE orders;

INSERT INTO customer(first_name, surname, mobile_no, address, age, email) VALUE("David", "JONES", 07985843211, "10 high street", 50, "david@gmail.com");
INSERT INTO customer(first_name, surname, mobile_no, address, age, email) VALUE("John", "Davies", 07985865211, "11 high street", 51, "john@gmail.com");
INSERT INTO customer(first_name, surname, mobile_no, address, age, email) VALUE("Peter", "Jackson", 07985903211, "12 high street", 52, "peter@gmail.com");
INSERT INTO customer(first_name, surname, mobile_no, address, age, email) VALUE("Luke", "Evans", 07985844311, "13 high street", 53, "luke@gmail.com");
INSERT INTO customer(first_name, surname, mobile_no, address, age, email) VALUE("Eric", "Cantana", 07985893211, "14 high street", 54, "eric@gmail.com");

DESCRIBE customer;

SELECT * FROM customer;

INSERT INTO books(book_title, genre, author, synopsis) VALUE("Da Vinci Code", "Thriller", "Dan Brown", "A murder inside the Louvre, and clues in Da Vinci paintings");
INSERT INTO books(book_title, genre, author, synopsis) VALUE("The Deathly Hallows", "Magic", "JK Rowling", "Without the guidance and protection of their professors, Harry (Daniel Radcl");
INSERT INTO books(book_title, genre, author, synopsis) VALUE("Fifty shades Darker", "Love", "James.E.L", "When a wounded Christian Grey tries to entice a cautious Anastasia Steele back ,");
INSERT INTO books(book_title, genre, author, synopsis) VALUE("Twlight", "Vampire", "Stephenie Meyer", "High-school student Bella Swan (Kristen Stewart), always a bit of a misfit");
INSERT INTO books(book_title, genre, author, synopsis) VALUE("One Day", "General", "David Nicholls", "On July 15, 1988 -- the day of their college graduation -- two people from");

SELECT * FROM books;

INSERT INTO orders(fk_cust_id, check_out, check_in) VALUE(1, "2022-09-01", "2022-09-08");
INSERT INTO orders(fk_cust_id, check_out, check_in) VALUE(2, "2022-09-07", "2022-09-14");
INSERT INTO orders(fk_cust_id, check_out, check_in) VALUE(3, "2022-09-014", "2022-09-21");
INSERT INTO orders(fk_cust_id, check_out, check_in) VALUE(4, "2022-09-21", "2022-09-28");
INSERT INTO orders(fk_cust_id, check_out, check_in) VALUE(5, "2022-09-24", "2022-10-01");

SELECT * FROM orders;
