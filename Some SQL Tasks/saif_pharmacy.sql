create database pharmacy_as_saif;



--1
create table customer(
C_ID int primary key,
C_name varchar(50),
Gender varchar(20),
adress varchar(100),
);

create table drug(
d_code int primary key,
d_name varchar(50),
manu_date varchar(20),
expir_date varchar(20),
C_id int foreign key references customer(C_ID)
);


create table employee(
E_id int primary key,
E_name varchar(50),
adress varchar(100),
age int,
phone varchar(15),
salary float,
D_code int foreign key references drug(D_code)
);



--2
insert into customer(C_ID,C_name,Gender,adress)
values (101,'Saif','Male','Old-dhaka'),
(102,'Baraka','Male','Riyadh'),
(103,'Bahar','Male','Mirpur'),
(104,'Momin','Male','Dhanmondi');



insert into drug(d_code,d_name,manu_date,expir_date,C_id)
values(11,'Napa','2019-03-13','2022-03-13',101),
(12,'Adol','2019-05-13','2022-05-13',102),
(13,'Panadol','2019-07-16','2022-07-16',103),
(14,'Gasec','2019-08-08','2022-08-08',104);


insert into employee(E_id,E_name,adress,age,phone,salary,D_code)
values(201,'Rubel','uttara',22,'01905893802',20000.00,11),
(202,'Redwan','Mirpur',18,'01650078352',22000.00,12),
(203,'Shohag','Riyadh',21,'0562687819',21000.00,13),
(204,'Masud','uttar',19,'0571706490',25000.00,14);


--3
Select c_name from customer join drug
on customer.C_ID = drug.C_id
where d_name = 'napa';


--4
Select c_name from employee inner join drug 
on employee.d_code = drug.d_code
inner join customer
on customer.C_ID = drug.C_id;

Select e_name from employee full outer join drug 
on employee.d_code = drug.d_code
full outer join customer
on customer.C_ID = drug.C_id;


--5
select max(salary) as 'Max_salary' ,min(salary) as 'Min_salary', avg(salary) as 'Avg_salary' from employee;

--6
Select e_name from employee
where salary = (Select max(salary)from employee) 
or salary = (Select min(salary)from employee) ;


--7
Select e_name from employee
where adress in ('Dhaka','Comilla')
or age between 20 and 30;


