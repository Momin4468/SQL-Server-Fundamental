
create database practice;

create table seller(
S_ID int primary key,
name varchar(50),
storeID int);

create table invoice(
In_id int primary key,
Onion varchar(50),
price float,
S_id int foreign key references seller(S_ID),
Qty float,
Dates date
);

//2

insert into Seller(S_ID,name,StoreID)
values (11,'Abul',1011),
(13,'Babul',1021),
(19,'Karina',1101),
(24,'Rahim',1011);


insert into invoice(In_id,Onion,price,S_id,Qty,Dates)
values(0112,'Egypt',40,11,6,'2019-12-11'),
(0223,'Bangla',130,13,2.5,'2019-12-10'),
(0334,'India',90,11,3,'2019-12-8'),
(0445,'Bangla',130,24,2,'2019-12-10');


//3
select name from seller
where storeid =
(select storeid from seller 
group by (storeid)
having count(storeid)>1);

//4
select distinct(onion) from invoice
where price in (select max(price) from invoice)

//5

select * from seller join invoice
on seller.S_ID = invoice.S_id
where onion = 'india';

//6
select storeid from seller
group by storeid
having count(storeid)>1

//7
select onion,price from invoice
where price > 40

//8
select * from invoice
where price<100 and price>50

//9
select Seller.S_ID,name from invoice join seller
on invoice.S_id = seller.S_ID
where (price*qty) = (select max(price*qty)
                    from invoice)

//10
select Onion from seller join invoice
on seller.S_ID = invoice.S_id
where name like '%ul'
order by price desc;


