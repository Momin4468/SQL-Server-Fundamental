Create Database Mumin
Create Table Orders(
OrderNumber int ,
Dates date,
Quantity int ,
ProductID varchar(255)FOREIGN KEY REFERENCES Product (productId),
CustomerID varchar(255)
);

Create Table Product(
ProductId varchar(255) PRIMARY KEY,
ProductName varchar(255),
Qty int,
UnitPrice float
);

Create Table Customer(
CustomerId varchar(255) PRIMARY KEY,
CustomerName varchar(255),
Adress varchar(255)
);

Insert Into Orders
Values
(542378 ,'7/4/2012 ',12, 'P112' ,'Cs127'),
(542378 ,'7/4/2012' ,10, 'P113' ,'Cs127'),
(542378 ,'7/4/2012' ,5 , 'P114' ,'Cs127'),
(542379 ,'7/5/2012' ,9 , 'P112' ,'Cs129'),
(542379 ,'7/5/2012' ,40, 'P115' ,'Cs129'),
(542380 ,'7/8/2012' ,10, 'P111' ,'Cs126'),
(542380 ,'7/8/2012' ,35, 'P112' ,'Cs126'),
(542380 ,'7/8/2012' ,15, 'P117' ,'Cs126'),
(542381 ,'7/8/2012' ,6 , 'P112' ,'Cs115'),
(542381 ,'7/8/2012' ,15, 'P121' ,'Cs115'),
(542381 ,'7/8/2012' ,20, 'P122' ,'Cs115'),
(542382 ,'7/9/2012' ,40, 'P122' ,'Cs119'),
(542382 ,'7/9/2012' ,25, 'P123' ,'Cs119');

Insert Into Product
Values
('P112', 'LUXsoap', 100 ,14.00),
('P113', 'Energy Plus' ,106, 9.80),
('P114', 'Tip biscuit', 501, 34.80),
('P117', 'Lexus', 911, 18.60),
('P119', 'Bashundhara Atta', 401, 42.40),
('P118', 'Men Shampoo' ,101 ,7.70),
('P115', 'Manjimup Dried Apples' ,351, 42.40),
('P111', 'Louisiana Fiery Hot Pepper Sauce' ,158 ,16.80),
('P120', 'Tomato sauce', 600 ,16.80),
('P121', 'Spicy sauce',150, 15.60),
('P122', 'Diaper', 20 ,16.80),
('P123', 'Coconut Oil',40, 64.80),
('P124', 'Toast Buiscuit', 25, 2.00);

Insert Into Customer
Values
('Cs123', 'Azizul Hakim', 'Mirpur'),
('Cs124', 'Nafees' ,      'Mirpur'),
('Cs114', 'Nafees',       'Malibag'),
('Cs117', 'Anika' ,       'NULL'),
('Cs119', 'Najib' ,       'Taltola'),
('Cs118', 'Maliha' ,      'Khilgaon'),
('Cs115', 'Jatin' ,       'Taltola'),
('Cs126', 'Zeba' ,        'Malibag'),
('Cs127', 'Raihan' ,      'Malibag'),
('Cs129', 'Ranbier' ,     'Malibag');

SELECT * FROM Orders
SELECT * FROM Product
SELECT * FROM Customer

--ans 1-->
select CustomerID from Orders
where Quantity =(select min(Quantity) from Orders)

--ans 2-->
select CustomerID,OrderNumber from Orders
where Quantity =(select min(Quantity) from Orders) and DATES='07-05-2012'

--ans 3-->
Select max(Quantity)as MaxAmount from Orders
where Dates = '7-9-2012'

--ans 4-->
Select sum(Quantity)as TotalAmount from Orders Group By ProductID
having Dates = '7-9-2012'

--ans 5-->
Select ProductName,UnitPrice from Product
where UnitPrice<15

--ans 6-->
select avg(UnitPrice)as meanPrice
from Product join Orders
on Product.ProductID = Orders.ProductID
where OrderNumber = 542381

--ans 7-->
Select ProductID from Product select Max(UnitPrice)from Product

--ans 8-->
Select CustomerName from Customer
where Adress='Taltola'

--ans 9-->
Select CustomerID,Adress from Customer
where Adress = 'NULL'

--ans 10-->
Select sum(Qty)as TotalSold from Product

--ans 11-->
Update Product
set ProductName='Dove Soap'
where ProductName='LUXsoap'

--ans 12-->
Update Product
set Qty=0
where ProductName='Toast Biscuit'

--ans 13 & 15-->
Create table Movie(
Movie_id int Primary Key,
MovieName varchar(255) NOT NULL
)

--ans 14-->
Create table viewer(
ViewerId int,
viewerName varchar(255),
Movie_id int foreign Key references Movie(Movie_id)
)

--ans 16-->
update Product
set Qty=0
where ProductName='Bashundhara Atta' and UnitPrice =2

--ans 17-->
Drop table Orders
Delete Customer

--ans of 18-->
To delete customer table we need  to remove the foreign key CustomerID of Orders table. Thats why we need to drop the Orders Table .Because if the primary key of a table is the foreign key of another table we cannot
delete that table until we remove the foreign key from that other table.

--ans of 19-->
Primary key and Foreign key is important in relational Database because Without these key we cannot join the tables. Primary key of a table is the foreign key of another table.

--The End.