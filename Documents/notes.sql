#sky store - customers, products, payments

CREATE DATABASE sky_store;

SHOW DATABASES;

USE sky_store; 

#customer - cust_id, first_name, surname, mobile_no, address, age, password, email

CREATE TABLE customers(
cust_id INT UNIQUE NOT NULL AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL,
surname VARCHAR(30) NOT NULL,
mobile_no CHAR(11) DEFAULT "n/a",
address VARCHAR(50),
age INT,
`password` VARCHAR(16) NOT NULL,
email VARCHAR(30) DEFAULT "n/a",
PRIMARY KEY(cust_id));


SHOW TABLES;

DESCRIBE customers;

DROP TABLE products;

CREATE TABLE products(
prod_id INT UNIQUE NOT NULL AUTO_INCREMENT,
sky_sports BOOL NOT NULL,
sky_cinema BOOL NOT NULL,
sky_kids BOOL NOT NULL,
sky_signature BOOL,
multiscreen BOOL NOT NULL,
UHD BOOL NOT NULL,
HD BOOL NOT NULL,
PRIMARY KEY(prod_id));

describe products;

show tables;

CREATE TABLE payments(
credit_card_name VARCHAR(30) NOT NULL,
credit_card_numner CHAR(16) NOT NULL,
cvv_code CHAR(4) NOT NULL,
expiry_date DATE,
issue_date CHAR(6) NOT NULL,
billing_address VARCHAR(50),
payment_amount FLOAT(6,2),
fk_cust_id INT NOT NULL,
PRIMARY KEY(credit_card_name),
FOREIGN KEY(fk_cust_id) REFERENCES customers(cust_id));

describe payments;

ALTER TABLE payments ADD COLUMN fk_cust_id INT NOT NULL, ADD CONSTRAINT FOREIGN KEY(fk_cust_id) REFERENCES customers(cust_id);


describe payments;

describe products;

CREATE TABLE orders(
order_id INT UNIQUE NOT NUll AUTO_INCREMENT,
fk_cust_id INT NOT NULL,
order_total DECIMAL(6,2) DEFAULT 0.00,
order_date DATETIME DEFAULT current_timestamp,
PRIMARY KEY (order_id),
FOREIGN KEY(fk_cust_id) REFERENCES customers(cust_id));

show tables;


CREATE TABLE order_items(
oi_id INT UNIQUE NOT NULL AUTO_INCREMENT,
fk_order_id INT NOT NULL,
fk_prod_id INT NOT NULL,
quantity INT DEFAULT 1,
line_total DECIMAL(6,2) DEFAULT 0.00,
PRIMARY KEY(oi_id),
FOREIGN KEY(fk_order_id) REFERENCES orders(order_id),
FOREIGN KEY(fk_prod_id) REFERENCES products(prod_id));

show tables;



#DML

# create - insert into

INSERT INTO customers(first_name, surname, mobile_no, address, `password`, email) VALUES("James", "Reynolds", "0789898234", "14 high street", "35dfvss", "james@gmail.com"); #inseret one record
INSERT INTO customers(first_name, surname, mobile_no, address, `password`, email) VALUES("Jim", "Reynolds", "0789893434", "15 high street", "35dfvss", "jim@gmail.com");
INSERT INTO customers(first_name, surname, mobile_no, address, `password`, email) VALUES("Jbig", "Reynolds", "0783498234", "16 high street", "35dfvss", "jbig@gmail.com");
INSERT INTO customers(first_name, surname, mobile_no, address, `password`, email) VALUES("Jimmy", "Reynolds", "0789834234", "17 high street", "35dfvss", "jimmy@gmail.com");
INSERT INTO customers(first_name, surname, mobile_no, address, `password`, email) VALUES("John", "Reynolds", "07843256234", "18 high street", "35dfvss", "john@gmail.com");

#to insert more than more after the first value enter, open new brackets with a comma inbetween

INSERT INTO payments(credit_card_name, credit_card_numner, cvv_Code, expiry_date, issue_date, billing_address, payment_amount, fk_cust_id) VALUES("James Reynolds", "1234567890123456", "345", "2022-5-4", "2021-4", "14 high street", "9.99", 1);
INSERT INTO payments(credit_card_name, credit_card_numner, cvv_Code, expiry_date, issue_date, billing_address, payment_amount, fk_cust_id) VALUES("Jim Reynolds", "1234567897823456", "346", "2022-5-5", "2021-4", "15 high street", "9.99", 2);
INSERT INTO payments(credit_card_name, credit_card_numner, cvv_Code, expiry_date, issue_date, billing_address, payment_amount, fk_cust_id) VALUES("Jbig", "1234567890903456", "347", "2022-5-6", "2021-4", "16 high street", "9.99", 3);
INSERT INTO payments(credit_card_name, credit_card_numner, cvv_Code, expiry_date, issue_date, billing_address, payment_amount, fk_cust_id) VALUES("Jimmy Reynolds", "1234567890673456", "348", "2022-5-7", "2021-4", "17 high street", "9.99", 4);
INSERT INTO payments(credit_card_name, credit_card_numner, cvv_Code, expiry_date, issue_date, billing_address, payment_amount, fk_cust_id) VALUES("John Reynolds", "1234565890123456", "349", "2022-5-4", "2021-4", "18 high street", "9.99", 5);


INSERT INTO orders(fk_cust_id, order_total, order_date) VALUES(1, 9.99, "2022-11-01");
INSERT INTO orders(fk_cust_id, order_total, order_date) VALUES(2, 9.99, "2022-11-01");
INSERT INTO orders(fk_cust_id, order_total, order_date) VALUES(3, 9.99, "2022-11-01");
INSERT INTO orders(fk_cust_id, order_total, order_date) VALUES(4, 9.99, "2022-11-01");
INSERT INTO orders(fk_cust_id, order_total, order_date) VALUES(5, 9.99, "2022-11-01");

DESCRIBE products;

INSERT INTO products(sky_sports, sky_cinema, sky_kids, sky_signature,  multiscreen, UHD, HD, prod_id) VALUES(1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO products(sky_sports, sky_cinema, sky_kids, sky_signature,  multiscreen, UHD, HD, prod_id) VALUES(1, 0, 1, 1, 1, 1, 1, 2);
INSERT INTO products(sky_sports, sky_cinema, sky_kids, sky_signature,  multiscreen, UHD, HD, prod_id) VALUES(1, 0, 0, 1, 1, 1, 1, 3);
INSERT INTO products(sky_sports, sky_cinema, sky_kids, sky_signature,  multiscreen, UHD, HD, prod_id) VALUES(1, 1, 1, 1, 1, 1, 0, 4);
INSERT INTO products(sky_sports, sky_cinema, sky_kids, sky_signature,  multiscreen, UHD, HD, prod_id) VALUES(1, 0, 1, 1, 1, 1, 1, 5);

SELECT * FROM products;

SELECT * FROM orders;


SELECT * FROM payments;

SELECT * FROM CUSTOMERS;  #shows up whats been input

SELECT cust_id, first_name, surname FROM customers;


#DELETE - DELETE

#DELETE FROM customers WHERE cust_id=12;
#DELETE FROm customers WHERE first-name = 'ash' can do this if safe mode is turned off

#< ,>, >=
# AND & or - |


#u - update



#UPDATE customer SET first_name="po" will set everyname to po or add WHERE cust_id=18


#LIKE - search for patterns in text

#SELECT cust_id, email FROM custeomrs Where email like "%gmail%",
#LIKE - search for patterns in text
# %m - find anything that end with an "m"
# m% - find anything that starts with "m"
# %mn% - finds anything with an mn together in any postion
# _m% - finds anything that has 'm' as the second character
# m_%n- "m" is the first character but there is another character after it which can be anything
# m%n - starts with m and ends in n

# cust_id email FROM customer Where email LIKE "%gmail%";

# INSERT INTO payments(method, name_on_card, card_no, expiry_date, cvv, fk_cust_id) VALUES("card", "ash", "348535634533", "2022-11-01", "1234", 15);

#AGGREGATE FUNCTIONS - do calculation on a set of data to return one result
# count, sum, min, max avg

#SELECT SUM(price) FROM products;
# SELECT COUNT(price) FROM products;
#SELECT MIN(price) FROM products;
#SELECT Max(price) FROM products;
#SELECT avg(price) FROM products;

#NESTED QUERIES - a statement within a statment

#SELECT fk_cust_id FROM orders WHERE order_id=4;
#SELECT * FROM customer WHERE cust_id=20;

#Joins - connect 2 or more tables together so you can view it all

#SELECT * FROM customer JOIN payments ON customers.cust_id=payments.fk_cust_id; #innner join
#SELECT * FROM customer LEFT OUTER JOIN payments ON customers.cust_id=payments.fk_cust_id; # outer join




 







