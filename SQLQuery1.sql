Create DataBase Practice;

Create table salesmen (
	salesman_id int,
	name nvarchar(15),
	city nvarchar(25),
	commission float(10)
);

alter table salesmen alter column salesman_id int NOT NULL;

alter table salesmen add constraint primary_id primary key (salesman_id);

