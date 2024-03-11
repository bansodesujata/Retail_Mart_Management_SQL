/*2. Write a query to select SQL basics*/
USE sql_basics;

/*3.	Write a query to create a product table with the fields product code, product name, price, stock, and category, 
a customer table with the fields customer ID, customer name, customer location, and customer phone number, and 
a sales table with the fields date, order number, product code, product name, quantity, and price.*/

create database lep_4;

CREATE TABLE lep_4.product (
 p_code varchar(45) NOT NULL,
 p_name varchar(45) NOT NULL,
 stock varchar(45) NOT NULL,
 price INT NOT NULL,
 category varchar(45) NOT NULL,
 PRIMARY KEY(p_code)
 );
 
 CREATE TABLE lep_4.customer (
 c_id VARCHAR(45) NOT NULL,
 c_name varchar(45) NOT NULL,
 c_location varchar(45) NOT NULL,
 c_phoneno int NOT NULL,
 PRIMARY KEY(c_id)
 );
 
 CREATE TABLE lep_4.sales (
 order_date DATE NOT NULL,
 order_no varchar(45) NOT NULL,
 c_id varchar(45) NOT NULL,
 c_name varchar(45) NOT NULL,
 p_code varchar(45) NOT NULL,
 p_name varchar(45) NOT NULL,
 qty INT NOT NULL,
 price INT NOT NULL,
 PRIMARY KEY(order_date));
 
 /*Write a query to insert values into the customer, product, and sales tables*/
 INSERT INTO lep_4.customer(c_id,c_name,c_location,c_phoneno) VALUES 
('9212','Jessica','banglore','1233435');
INSERT INTO lep_4.sales(order_date,order_no,c_id,c_name,p_code,p_name,qty,price) VALUES 
('2021-02-12','HM02','2123','Biyush','03','Pen','2','20');
INSERT INTO lep_4.product(p_code,p_name,stock,price,category) VALUES 
('07','shampoo','90','5','hair product');

/*5.	Write a query to add two new columns such as S_no and categories to the sales table.
ALTER TABLE lep_4.sales ADD (S_no INT,categories varchar(45));

/*Write a query to change the column type of stock in the product table to varchar.*/
ALTER TABLE lep_4.product MODIFY stock varchar(45);

/*Write a query to change the table name from customer-to-customer details.*/
ALTER TABLE lep_4.customer RENAME TO lep_4.customerdetails;

/*Write a query to drop the columns S_no and categories from the sales table.*/
ALTER TABLE lep_4.sales DROP COLUMN S_no;
ALTER TABLE lep_4.sales DROP COLUMN categories;

/*Write a query to display order id, customer id, order date, price, and quantity from the sales table.*/
SELECT order_date,order_no,c_id,qty,price FROM lep_4.sales;

/*Write a query to display all the details in the product table if the category is stationary.*/
SELECT * FROM lep_4.product WHERE category='Stationary';

/*Write a query to display a unique category from the product table.*/
SELECT DISTINCT(category) FROM lep_4.product;

/*Write a query to display the sales details if quantity is greater than 2 and price is lesser than 500 from the sales table.*/
SELECT * FROM lep_4.sales WHERE qty>2 AND price < 500;

/*Write a query to display the customer’s name if the name ends with a.*/
SELECT c_name FROM lep_4.customerdetails WHERE c_name LIKE '%a';

/*Write a query to display the product details in descending order of the price.*/
SELECT * FROM lep_4.product ORDER BY price DESC ;

/*Write a query to display the product code and category from similar categories that are greater than or equal to 2.*/
SELECT p_code,category FROM lep_4.product
WHERE category IN ( SELECT category FROM lep_4.product
GROUP BY category HAVING COUNT(distinct p_code) >= 2) ; 

/*Write a query to display the order number and the customer name to combine the results of the order and the customer tables including duplicate rows.*/
SELECT order_no,c_name FROM lep_4.sales LEFT JOIN lep_4.product ON 
sales.p_code = product.p_code
UNION ALL 
SELECT order_no,c_name FROM lep_4.sales RIGHT JOIN lep_4.product ON 
sales.p_code = product.p_code;







