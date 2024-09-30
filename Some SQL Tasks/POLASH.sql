create database bidding_system;



create table bank (
Branch_name varchar(40) not null primary key,
city varchar(25) not null,
location varchar(50) not null
)



create table Account(

account_number int  not null primary key,
customer_name varchar(25) not null,
balance float not null,
branch_name varchar (40) foreign key references bank(branch_name)
)  



create table seller(
s_id  int not null primary key,
s_name varchar(25) not null,
account_number int foreign key references 
account(account_number),
phone varchar(20) not null,
address varchar (35) not null
)



create table buyer(
b_id int not null primary key,
b_name varchar(35) not null,
account_number int not null foreign key references account(account_number),
phone varchar(20) not null
)




create table items(
item_id varchar(25) not null primary key,
item_name varchar(50) not null,
typee varchar(15) not null,
price float not null,
quantity int not null,
s_id int not null foreign key references seller(s_id),
b_id int not null foreign key references buyer(b_id)
)



insert into account 
(account_number,customer_name,balance,branch_name)values
(30444344,'ripa',100000.66,'kolabagan_branch'),
(89343488,'zumur',600000.66,'savar_branch'),
(84378388,'pakhi',59900.66,'gulshan_branch'),
(74675856,'nuri',44400.77,'azimpur_branch'),
(65436354,'suba',44400.44,'mirpur_branch');



insert into buyer 
(b_id,b_name,account_number,phone)values
(10,'sakib',30444344,'+89437588'),
(22,'sakib',89343488,'+87367836'),
(10,'rahim',84378388,'+78473783'),
(32,'rahim',74675856,'+87238477'),
(99,'suba',65436354,'+778767677');




insert into seller 
(s_id,s_name,account_number,phone,address)values
(10,'sakib',2222222,+8984368,'dhaka'),
(12,'sakib',78436748,+78964785,'comilla'),
(10,'rahim',783465734,+87975868,'khulna'),
(32,'rahim',783676778,+34786873,'rajshahi');




insert into items(
item_id,item_name,type,price,quantity,s_id,b_id)values
(222,'sari','fashion',800,4,10,10),
(555,'flower','flower',6660,4,12,12),
(888,'tomato','vegitable',7770,2,12,32);


--3
select* from bank

select* from seller

select* from buyer

select* from items

select* from account



--4
select items_name from  items where  price >850


--5
select account_number from account where 
branch_name='kolabagan_branch' and balance >12000


--6
select customer_name ,account_number,balance from account where
branch_name='savar_branch' or branch_name='azimpur_branch' or branch_name='mirpur_branch'


--7
select s_name from seller where
 address='dhaka' or address='comilla' or address='khulna' 


--8
select branch_name,min(balance) as minimum_balance,max(balance) as maximum_balance,avg(balance) as average_balance
from account group by branch_name


--9
select item_name,avg(quantity) as average_quantity from 
items group by item_name having min(price)>350


--10
select item_name from items 
where price=
(select min(price) from items)
or price=(select max(price) from items)


--1
select B_name,Branch_name from Buyer inner join Account 
on Buyer.Account_number=Account.Account_number
where Account.Account_number='ACC1258'


--2
select b_name ,phone from buyer inner join items 
on buyer .b_id=items.b_id
where items.item_name='sari'


--3
select Bank.Branch_name from Bank inner join Account 
on Bank .Branch_name =Account.Branch_name
where balance>12000  


--4
 select item_name from items inner join seller 
 on items.s_id=seller.s_id 
 inner join buyer
 on buyer.b_id = items.b_id
 where
 s_name='rahim' and b_name='sakib'


--5
select item_name from Items
where price=(select max(price) from Items) or
price=(select min (price) from item)


--6
select * from buyer inner join  account  on 
buyer.Account_number = account.Account_number 
 inner join seller on 
seller.Account_number = account.Account_number 
where account.Branch_name='Gulshan Branch'