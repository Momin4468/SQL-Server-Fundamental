
create database hotelmanagement_system;

create table customer (
customer_name varchar(40) not null primary key,
city varchar(25) not null,
location varchar(50) not null,
phone int not null,
members int not null,
age int not null
)

create table room(
room_number int  not null primary key,
neighbor_name varchar(25) not null,
type varchar(25) not null,
confirmation varchar(6) not null,
customer_name varchar (40) foreign key references customer(customer_name)
)  

create table stuff(
s_id  int not null primary key,
s_name varchar(25) not null,
room_number int foreign key references 
room(room_number),
phone varchar(20) not null,
address varchar (35) not null
)

create table manager(
m_id int not null primary key,
m_name varchar(35) not null,
room_number int not null foreign key references room(room_number),
phone varchar(20) not null
)

create table thingsitems(
item_id varchar(25) not null primary key,
item_name varchar(50) not null,
type varchar(15) not null,
price float not null,
quantity int not null,
s_id int not null foreign key references stuff(s_id),
m_id int not null foreign key references manager(m_id)
)


insert into room
(room_number,neighbor_name,type,customer_name,confirmation)values
(32,'sokina','secondtclass','jafor','yes'),
(32,'jorina','firstclass','kasimma','yes'),
(32,'kasem','thirdclass','sana','yes'),
(32,'rakib','localclass','rana','yes'), 
(32,'nafisa','firstclass','masum','yes'),
(32,'saif','firstclass','meraz','yes'),
(32,'rimu','firstclass','joy','yes'),
(32,'anam','firstclass','jihad','yes'),
(32,'shuvro','firstclass','saiful','yes'),
(32,'faysal','seccondclass','hasib','yes'),
(32,'rudro','firstclass','famiha','yes');


insert into customer 
(customer_name,city,location,phone,members,age)values
('ripa','dhaka','dhanmondi',01649999999,4,25),
('zumur','comilla','tomsombridge',0233333333,4,66),
('pakhi','khulna','bagerhat',0238838838,5,55),
('nuri','rajshahi','dinazpur',32877878,7,36),
('pakhiii','dhaka','dhanmondi',016499999,0,63),
('murad','comilla','tomsombridge',023333333,1,82),
('shila','khulna','bagerhat',023883888,7,85),
('sweety','rajshahi','dinazpur',328778278,9,96);


insert into manager
(m_id,m_name,room_number,phone)values
(10,'sakib',30,'+89437588'),
(22,'sakib',89,'+87367836'),
(10,'rahim',84,'+78473783'),
(32,'rahim',74,'+87238477'),
(99,'suba',65,'+8767677'),
(11,'muhib',50,'+9437588'),
(23,'akib',49,'+00367836'),
(14,'rahi',34,'+33473783'),
(35,'jashim',74,'+844238477'),
(93,'subas',15,'+333767677');


insert into stuff
(s_id,s_name,room_number,phone,address)values
(10,'sakib',2222222,+8984368,'dhaka'),
(12,'sakib',78436748,+78964785,'comilla'),
(10,'rahim',783465734,+87975868,'khulna'),
(32,'rahim',783676778,+34786873,'rajshahi'),
(99,'tarib',2222222,+884368,'dhaka'),
(11,'fabi',78436748,+8964785,'comilla'),
(23,'jahid',783465734,+8975868,'khulna'),
(14,'kusum',783676778,+4786873,'rajshahi'),
(35,'fahid',78345734,+897868,'khulna'),
(93,'masum',78366778,+478673,'rajshahi');


insert into thingsitems(
item_id,item_name,type,price,quantity,s_id,m_id)values
(222,'pizza','fastfood',800,4,10,10),
(555,'chicken karry','food',6660,4,12,12),
(888,'tomato salad',' chinese',7770,2,12,32),
(887,'burger','thiland',7777,7,10,10),
(889,'pasta','thi',9477,4,32,99),
(881,'shik','uro',7447,7,99,11),
(882,'chicken masala','bd',4777,3,11,23),
(883,'beef masala','thi',8777,7,23,14),
(884,'beef fri','thi',7779,7,14,34);


select* from customer
select* from room
select* from manager
select* from thingsitems


update items set price =1000 where items_id=222
update items set price =750  where items_id=555


select item_name from  thingsitems where type='uro' and
 price >850

select customer_name from customer where 
location='tomsombridge' and age>60

select customer_name ,city,location from customer where
location='bagerhat' or location='tomsombridge' or location='dinazpur'

select s_name from stuff where
 address='dhaka' or address='comilla' or address='khulna' 

alter table customer alter column age int 
select location,min(age) as minimum_age,max(age) as maximum_age,avg(age) as average_balance
 from customer group by location

select item_name,avg(quantity) as average_quantity from thingitems
 group by item_name having min(price)>350

select item_name from thingsitems 
where price=
(select min(price) from items)
or price=(select max(price) from items)

select m_name,room_number,phone from manager inner join customer 
on manager.customer_name=customer.customer_name
where customer.customer_name='sakib'

select m_name ,phone from manager inner join thingsitems 
on manager.m_id=items.m_id
where item.items='pizza'

select customer.location from customer inner join room 
 on customer.customer_name=customer.customer_name
 where age>70 

update stuff set s_name='sakib' where
 s_id=10

 create view stuff thingsitem as
 select item_id,item_name,type,price,quantity,s_id, manager.m_id,m_name,customer_name,phone
 from thingsitems inner join manager
 on manager.m_id=thingsitems.m_id
 select item_name from thingsitems inner join stuff
 on  thingsitems.s_id=stuff.s_id where
 s_name='rahim' and m_name='sakib'

select item_name from thingsItems
where price=(select max(price) from thingsItems) or
price=(select min (price) from thingsitems)

create view corpo as 
select m_id ,m_name ,phone ,customer.customer_name ,customer_name ,age,location from customer full outer join 
manager on customer.customer_name =manager.customer_name 
select * from corpo full outer join stuff  on 
corpo.customer_name =stuff.customer_name 
where location ='tomsombridge'