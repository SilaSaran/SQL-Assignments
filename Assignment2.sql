-- 1: Creating a database called 'sales'
CREATE DATABASE Sales;
USE Sales;
-- 2: Creating a table called 'Orders' 
-- 3: Using constraints: Primary Key Unique Not Null 
CREATE TABLE Orders (
Order_Id int primary key auto_increment, 
Customer_name varchar(10) not null, 
Product_Category varchar(10), 
Ordered_item varchar (10),
Contact_No bigint unique
);
SELECT * FROM Orders;
-- 4: Adding a new column named “order_quantity” to the orders table. 
 ALTER TABLE Orders add column Order_quantity int;
 -- 5: Renaming the orders table to the sales_orders table.
 RENAME TABLE Sales_oreders to Sales_orders;
 SELECT * FROM Sales_orders;
 -- 6: Inserting 10 rows into the sales_orders table.
 INSERT INTO Sales_orders (Customer_name,Product_Category,Ordered_item,Contact_No,Order_quantity)
 VALUES ( 'James','Electronic','Mobile', 9961888999, 1);
  INSERT INTO Sales_orders (Customer_name,Product_Category,Ordered_item,Contact_No,Order_quantity)
 VALUES ( 'Sunny','Books','Novel', 9961886999, 2);
  INSERT INTO Sales_orders (Customer_name,Product_Category,Ordered_item,Contact_No,Order_quantity)
 VALUES ( 'Leo','Grocery','Pulses', 9961887998, 3);
  INSERT INTO Sales_orders (Customer_name,Product_Category,Ordered_item,Contact_No,Order_quantity)
 VALUES ( 'Tinto','Chocolate','kitkat', 9961878997, 4);
  INSERT INTO Sales_orders (Customer_name,Product_Category,Ordered_item,Contact_No,Order_quantity)
 VALUES ( 'Thomas','Juice','Fanta', 9961885999, 5);
  INSERT INTO Sales_orders (Customer_name,Product_Category,Ordered_item,Contact_No,Order_quantity)
 VALUES ( 'Rini','cosmetics','Lipstick', 9961884969, 6);
  INSERT INTO Sales_orders (Customer_name,Product_Category,Ordered_item,Contact_No,Order_quantity)
 VALUES ( 'Joe','Cloths','T-shirt', 9961883939, 7);
  INSERT INTO Sales_orders (Customer_name,Product_Category,Ordered_item,Contact_No,Order_quantity)
 VALUES ( 'Santa','Gifts','Toys', 9961876699, 8);
  INSERT INTO Sales_orders (Customer_name,Product_Category,Ordered_item,Contact_No,Order_quantity)
 VALUES ( 'Rohit','Fruits','Apple', 9961786799, 9);
  INSERT INTO Sales_orders (Customer_name,Product_Category,Ordered_item,Contact_No,Order_quantity)
 VALUES ( 'Dinesh','Chips','Parle', 9961586759, 10);
 SELECT * FROM Sales_orders;
 -- 7: Retrieving customer_name and Ordered_Item from the sales_orders table. 
SELECT Customer_name,Ordered_item from Sales_orders;
-- 8: Use the update command to change the name of the product for any row. 
UPDATE Sales_orders SET Ordered_item='Jeans' WHERE Customer_name='Joe';
SET sql_safe_updates=0;
-- 9:Delete the sales_orders table from the database.
DROP TABLE Sales_orders;
-- 10: Checked the table exsisting or not
