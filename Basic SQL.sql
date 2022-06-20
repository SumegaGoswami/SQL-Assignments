-- 1. Which shippers do we have? We have a table called Shippers. Return all the fields from all the
shippers

SELECT * FROM northwind_db.shippers;

-- 2. Certain fields from Categories. In the Categories table, selecting all the fields using this SQL:Select * from Categories …will return 4 columns. We only want to see two columns,
CategoryName and Description.

SELECT * FROM northwind_db.categories;
select  
category_name,
description
from northwind_db.categories;

-- 3. Sales Representatives We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales Representative. Write a SQL statement that returns only those employees
select*
from northwind_db.employees;
select
first_name,
last_name,
hire_date
from northwind_db.employees;

-- 4. Sales Representatives in the United States Now we’d like to see the same columns as above, but only for those employees that both have the title of Sales Representative, and also are in the United States

select*
from northwind_db.employees;
select 
first_name, last_name, country from northwind_db.employees;
select*
from northwind_db.employees
where title = 'sales representative'and country = 'USA';

-- 5. Orders placed by specific EmployeeID Show all the orders placed by a specific employee. The EmployeeID for this Employee (Steven Buchanan) is 5.
select*
from northwind_db.orders;
select order_id, order_date from northwind_db.orders
where employee_id=5;

-- 6. Suppliers and ContactTitles In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers whose ContactTitle is not Marketing Manager

select*
from northwind_db.suppliers;
select Supplier_ID, Contact_Name, Contact_Title 
from northwind_db.suppliers
where Contact_Title != 'Marketing Manager';

-- 7. Products with “queso” in ProductName In the products table, we’d like to see the ProductID and ProductName for those products where the ProductName includes the string “queso”
select*
from northwind_db.products;
select product_id, product_name from northwind_db.products
where product_name like '%queso%';

-- 8. Orders shipping to France or Belgium Looking at the Orders table, there’s a field called ShipCountry. Write a query that shows the OrderID, CustomerID, and ShipCountry for the orders where the ShipCountry is either France or Belgium
select*
from northwind_db.orders;
select Order_ID, Customer_ID, Ship_Country from northwind_db.orders
where Ship_Country = 'France' or Ship_Country ='Belgium';

-- 9. Orders shipping to any country in Latin America Now, instead of just wanting to return all the orders from France of Belgium, we want to show all the orders from any Latin American country. But we don’t have a list of Latin American countries in a table in the Northwind database. So, we’re going to just use this list of Latin American countries that happen to be in the Orders table: Brazil Mexico Argentina Venezuela It doesn’t make sense to use multiple Or statements anymore, it would get too convoluted. Use the In statement
select*
from northwind_db.orders;
select Order_ID, Customer_ID, Ship_Country from northwind_db.orders
where Ship_Country in ('Brazil', 'Mexico', 'Argentina','Venezula');

-- 10 Employees, in order of age For all the employees in the Employees table, show the FirstName, LastName, Title, and BirthDate. Order the results by BirthDate, so we have the oldest employees first
select*
from northwind_db.employees;
select First_Name, Last_Name, Title, Birth_date from northwind_db.employees
order by birth_date;

-- 11 Showing only the Date with a DateTime field In the output of the query above, showing the Employees in order of BirthDate, we see the time of the BirthDate field, which we don’t want. Show only the date portion of the BirthDate field.
select*
from northwind_db.employees;
select First_Name, Last_Name, Title, Birth_date from northwind_db.employees
order by birth_date;

-- 12. Employees full name Show the FirstName and LastName columns from the Employees table, and then create a new column called FullName, showing FirstName and LastName joined together in one column, with a space in-between.

select * from northwind_db.employees;
select first_name, 
last_name, 
concat(first_name, ' ', last_name)n
from northwind_db.employees;

-- 13. OrderDetails amount per line item In the OrderDetails table, we have the fields UnitPrice and Quantity. Create a new field, TotalPrice, that multiplies these two together. We’ll ignore the Discount field for now. In addition, show the OrderID, ProductID, UnitPrice, and Quantity. Order by OrderID and ProductID

SELECT * FROM northwind_db.order_details;
select order_id, product_id, unit_price, quantity,
Unit_Price *Quantity As TotalPrice
from northwind_db.order_details
order by order_id, product_id;

-- 14. How many customers? How many customers do we have in the Customers table? Show one value only, and don’t rely on getting the recordcount at the end of a resultset.

SELECT * FROM northwind_db.customers;
select count(*)
from northwind_db.customers;

-- 15. When was the first order? Show the date of the first order ever made in the Orders tables
SELECT * FROM northwind_db.orders;
Select
min(order_date) as first_order
from northwind_db.orders;

-- 16. Countries where there are customers Show a list of countries where the Northwind company has customers
SELECT * FROM northwind_db.customers;
select distinct (country) as country
from northwind_db.customers;

-- 17. Contact titles for customers Show a list of all the different values in the Customers table for ContactTitles. Also include a count for each ContactTitle. This is similar in concept to the previous question “Countries where there are customers” , except we now want a count for each ContactTitle

select * from northwind_db.customers;
select
contact_title,
count(contact_title)
from northwind_db.customers
group by contact_title;

-- 18. Products with associated supplier names We’d like to show, for each product, the associated Supplier. Show the ProductID, ProductName, and the CompanyName of the Supplier. Sort by ProductID. This question will introduce what may be a new concept, the Join clause in SQL. The Join clause is used to join two or more relational database tables together in a logical way. Here’s a data model of the relationship between Products and Suppliers.

select
product_id,
product_name,
company_name
from northwind_db.products 
left Join northwind_db.suppliers on
northwind_db.products.suppliers_id = northwind_db.suppliers.suppliers_id;

-- 19. Orders and the Shipper that was used We’d like to show a list of the Orders that were made, including the Shipper that was used. Show the OrderID, OrderDate (date only), and CompanyName of the Shipper, and sort by OrderID. In order to not show all the orders (there’s more than 800), show only those rows with an OrderID of less than 10300.
select 
order_id,
order_date,
company_name
from northwind_db.orders
left join northwind_db.shippers on 
northwind_db.orders.Ship_via = north_db.shippers.shipper_id
where order_id < 10300
order by order_id;







