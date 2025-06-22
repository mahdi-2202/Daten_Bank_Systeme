create table customers as select * from read_csv('<path_to_file>/customers_large.csv');
create table products as select * from read_csv('<path_to_file>/products_large.csv');
create table suppliers as select * from read_csv('<path_to_file>/suppliers_large.csv');
create table offers as select * from read_csv('<path_to_file>/offers_large.csv');
create table orders as select * from read_csv('<path_to_file>/orders_large.csv');

select ContactName, cast(replace(Phone,'-','') as int) as "PHONE_NUMBER" from SUPPLIERS;

select distinct Country from CUSTOMERS;

SELECT * FROM CUSTOMERS C, SUPPLIERS S; -- no problem
SELECT Phone FROM CUSTOMERS C, SUPPLIERS S; -- now we have a problem
SELECT C.Phone, S.Phone FROM CUSTOMERS C, SUPPLIERS S; -- fixed the problem

select C.*, S.Phone from CUSTOMERS C, SUPPLIERS S;

SELECT * from ORDERS where TotalAmount > 100.00;

==========================================================================
-- NULL Handling

SELECT true and null;
SELECT false and null;
SELECT true or null;
SELECT false or null;
SELECT not null;
SELECT not true;
SELECT 1 + NULL;
SELECT COUNT(NULL);
SELECT COUNT(1);

CREATE TABLE numbers (n INTEGER);
INSERT INTO numbers VALUES (1),(2),(3),(4),(5),(6),(NULL),(NULL);
INSERT INTO numbers VALUES (NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL);
INSERT INTO numbers VALUES (0),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL);
SELECT COUNT(*) from numbers;
SELECT SUM(n) from numbers;

==========================================================================
-- Sorting:

CREATE TABLE numbers (val1 INT, val2 INT);
INSERT INTO numbers (val1,val2) VALUES (2,1),(2,2),(2,3),(1,1),(1,2),(1,3);

SELECT * FROM numbers order by val1, val2 desc;
SELECT * FROM numbers order by 1, 2 desc;
SELECT * FROM numbers order by val2, val1 desc;


-- Sorint & NULLs:

CREATE TABLE numbers (val1 INT, val2 INT);
INSERT INTO numbers (val1,val2) VALUES (1,1),(1,2),(1,3),(NULL,4);

SELECT * FROM numbers order by val1;
select * from numbers order by val1 nulls first;

==========================================================================

-- Joins

SELECT O.OR_ID, C.Name AS CustomerName, C.Email AS CustomerEmail, O.OrderDate, O.TotalAmount
FROM Orders O JOIN Customers C ON O.C_ID = C.C_ID;

SELECT O.OR_ID, O.OrderDate, O.TotalAmount, S.CompanyName AS SupplierName, S.ContactName AS SupplierContact
FROM Orders O LEFT JOIN Suppliers S ON O.S_ID = S.S_ID;

SELECT C1.C_ID AS Customer1ID, C1.Name AS Customer1Name, C2.C_ID AS Customer2ID, C2.Name AS Customer2Name, C1.City
FROM Customers C1
JOIN Customers C2 ON C1.City = C2.City AND C1.C_ID < C2.C_ID;

SELECT P.P_ID, P.ProductName, O.S_ID, O.AvailableStock, O.Discount
FROM Products P LEFT JOIN Offers O ON P.P_ID = O.P_ID;