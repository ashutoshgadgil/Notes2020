create table demo(num1 number,num2 number(3,2));

insert into demo values(112.234,3.3456);
select * from demo;

create table demo1(num1 number(3));
insert into demo1 values(111.5);
select * from demo1;

create table demo2(x char(5));
insert into demo2 values('abcde');
select * from demo2;

create table demo3(x varchar2(5));
desc demo3;

create table demo4(x varchar(5));
desc demo4;

create table demo5(dob date);                /* yyyy-mm-dd */
insert into demo5 values(Date '2015-12-14');
select * from demo5;

select To_Date('December 01, 2020', 'MONTH DD,YYYY') from dual;

select sysdate from dual;  /* To see current date */

alter table emp rename to employee;   /* To rename the table */
select * from employee;
desc employee;

alter table employee add city varchar2(20);           /* Adding a single column */

alter table employee add(contact number,address varchar2(30));  /* Adding multiple columns in a table */

alter table employee modify address char(20);      /* Modifying a single column*/

alter table employee modify(contact number(10),address char(50));      /* Modifying a multiple column*/

alter table employee modify(address char(50),contact number(10)); 

alter table employee drop column contact; /* removing a column from table */

alter table employee drop(city,address); /* removing multi column from table */

alter table employee rename column fullname to Full_Name;

create table ta(n1 number,n2 number,n3 as (n1+n2));  /* n3 is virtual column */ 
insert into ta(n1,n2) values(3,5);
/*insert into ta values(3,5,4); Invalid */
select * from ta;

desc demo5;
drop table demo5;     /* dropping a table*/

desc demo4;
truncate table demo4;  /* truncating a table */


