create table apn_info (
pname varchar(20),
dname varchar(20),
spec varchar(20),
apdate date,
aptime time);
select * from doc_info;
select * from apn_info;
insert into apn_info values('123','Doc2','Heart Surgery','2002/02/11','22:22:22');
create database hospital_database;
create table patients_info (
name varchar(20) NOT null,
email varchar(30),
contact_no int,
street varchar(50),
locality varchar(20),
aadhar varchar(12) PRIMARY KEY,
state varchar(20),
country varchar(20)
);
alter table patients_info add column password varchar(25);
create table doc_info
(
dname varchar(20),
dspec varchar(20),
psswd varchar(20)
);
insert into doc_info values('Doc1','Heart Surgery','123');
insert into doc_info values('Doc2','Brain surgery','dr@sheldon');
