create table zipcodes (
  zip int primary key,
  city  varchar(30),
  State varchar(20));


create table employees (
  eno  varchar(10) primary key,
  ename  varchar(30),
  zip  int references zipcodes,
  hire_date date);



create table books (
  bno  int primary key,
  bname  varchar(30),
  qoh  int not null,
  price  dec(6,2) not null);


create table customers (
  cno   int primary key,
  cname  varchar(30),
  street varchar(30),
  zip  int  references zipcodes,
  phone  char(12));



create table orders (
  ono  int  primary key,
  cno  int  references customers,
  eno  varchar(10)  references employees,
  received date,
  shipped date
);



create table odetails (
  ono  int  references orders,
  bno  int  references books,
  quantity int not null,
  primary key (ono, bno));

create table Student (
  stdname  varchar(10) primary key,
  marks  int);

Alter table Student
add marks2 int;

update Student set subject= 1 where stdname='robort'
update Student set subject= 1 where stdname='john'
update Student set subject= 1 where stdname='raj'
update Student set subject= 1 where stdname='jeff'
update Student set subject= 2 where stdname='arya'
update Student set subject= 2 where stdname='sansa'
update Student set subject= 2 where stdname='wolf'
update Student set subject= 2 where stdname='snow'


insert into Student values ('john', 12); 
insert into Student values ('raj', 15); 
insert into Student values ('jeff', 20); 
insert into Student values ('arya', 18); 
insert into Student values ('sansa', 40); 
insert into Student values ('snow', 30); 
insert into Student values ('wolf', 13); 
insert into Student values ('robort',25 );



insert into zipcodes values (98225, 'Bellingham', 'WA'); 
insert into zipcodes values (95388, 'Winton', 'CA'); 
insert into zipcodes values (44242, 'Stow', 'OH'); 
insert into zipcodes values (61536, 'Hanna city', 'IL'); 
insert into zipcodes values (01254, 'Richmond', 'MA'); 
insert into zipcodes values (95124, 'San Jose', 'CA'); 
insert into zipcodes values (95382, 'Turlock', 'MA'); 
insert into zipcodes values (95380, 'Turlock', 'CA');


insert into employees values ('P0239400', 'Jones Hoffer',98225, '2000-12-12'); 
insert into employees values ('P0239401', 'Jeffrey Prescott',95388, '2006-01-01'); 
insert into employees values ('P0239402', 'Fred NcFaddeb',95124, '2008-09-01');


insert into books values (10506, 'Accounting 101',200, 129.99); 
insert into books values (10507, 'Management 101',159, 109.99); 
insert into books values (10508, 'Fraud Cases',190, 179.99); 
insert into books values (10509, 'CPA Review',65, 299.99); 
insert into books values (10601, 'Peachtree for Dummies',322, 49.99); 
insert into books values (10701, 'Financial Accounting',129, 164.99); 
insert into books values (10800, 'Managerial Accounting',155, 114.99); 
insert into books values (10900, 'Cost Accounting',122, 119.99); 
insert into books values (10901, 'Intermediate Accounting',123, 164.99); 
insert into books values (10902, 'XBRL in Nutshell',124, 109.99);

insert into customers values (23511, 'Michelle Kuan', '123 Main St.',98225, '360-636-5555'); 
insert into customers values (23512, 'George Myer', '237 Ash Ave.',95124, '312-678-5555'); 
insert into customers values (23513, 'Richard Gold', '111 Inwood St.',95124, '312-883-7337'); 
insert into customers values (23514, 'Robert Smith', '54 Gate Dr.',95388, '206-832-1221'); 
insert into customers values (23515, 'Christopher David', '777 Loto St.',98225, '360-458-9878'); 
insert into customers values (23516, 'Adam Beethoven', '234 Park Rd..',95380, '209-546-7299'); 
insert into customers values (23517, 'Lidwig Bach', '5790 Walnut St.',95382, '209-638-2712');


insert into orders values (1020, 23511, 'P0239400', '2009-10-18', '2009-10-20'); 
insert into orders values (1021, 23511, 'P0239400', '2009-10-29', '2009-10-31'); 
insert into orders values (1022, 23512, 'P0239401', '2009-11-10', '2009-11-13'); 
insert into orders (ONO, CNO, ENO, RECEIVED) values (1023, 23513, 'P0239402', '2009-11-15'); 
insert into orders (ONO, CNO, ENO, RECEIVED) values (1024, 23511, 'P0239400', '2009-11-16');


insert into odetails values (1020, 10506,1); insert into odetails values (1020, 10507,2); 
insert into odetails values (1020, 10508,2); insert into odetails values (1020, 10509,3); 
insert into odetails values (1021, 10601,4); insert into odetails values (1022, 10601,1); 
insert into odetails values (1022, 10701,2); insert into odetails values (1023, 10800,4); 
insert into odetails values (1023, 10900,1); insert into odetails values (1024, 10900,7);