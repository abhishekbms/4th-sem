//create tables for supplier.

create table supplier(
sid int,
sname varchar(30),
city varchar(30),
primary key(sid));

//create tables for parts.

create table parts(
pid int,
pname varchar(30),
color varchar(20),
primary key(pid));

//create tables for catalog.

create table catalog(
sid int,
pid int,
cost int,
primary key(sid,pid),
foreign key(sid)references supplier(sid) on delete cascade,
foreign key(pid)references parts(pid) on delete cascade);

//insert values in the supplier table.

insert into supplier values
(10001,'Acme Widget','bangalore'),
(10002,'johns','kolkata'),
(10003,'vimal','mumbai'),
(10004,'reliance','delhi');

//insert values in the parts table.

insert into parts values
(20001,'book','red'),
(20002,'pen','red'),
(20003,'pencil','green'),
(20004,'mobile','green'),
(20005,'charger','black');

//insert values in the catalog table.

insert into catalog values
(10001,20001,10),
(10001,20002,10),
(10001,20003,30),
(10001,20004,10),
(10001,20005,10),
(10002,20001,10),
(10002,20002,20),
(10003,20003,30),
(10004,20003,40);

//display the output.

select * from supplier;
select * from parts;
select * from catalog;

//find the sid's of suppliers who supply some red or green parts.

select distinct(supplier.sid)from supplier,catalog,parts where supplier.sid=catalog.sid and
parts.pid=catalog.pid and parts.color in('red','green');

//find the sid's of suppliers who supply some red parts or whose city is bangalore.

select distinct(supplier.sid)from supplier,catalog,parts where supplier.sid=catalog.sid and
parts.pid=catalog.pid and parts.color in('red') or supplier.city=('bangalore');

//find pairs of sid's such that the suppliers with the first sid charges more for some part than the supplier with the second sid.

select s1.sid,s2.sid,p1.pid from supplier s1,supplier s2,catalog c1,catalog c2,parts p1
where s1.sid=c1.sid and s2.sid=c2.sid and p1.pid=c1.pid and p1.pid=c2.pid and c1.cost>c2.cost;
