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

rename ta to cal;      /* To rename the table */
select * from cal;
desc cal;

create table result(name varchar2(20),physics number(3),chemistry number(3),maths number(3),english number(3),computer 
number(3),Percentage as (((physics+chemistry+maths+english+computer)/500)*100));

insert into result(name,physics,chemistry,maths,english,computer) values('Ajay',67,98,87,77,55);
insert into result(name,physics,chemistry,maths,english,computer) values('Sunil',77,88,87,72,55);

select * from result;

desc demo4;
select * from employee;

create table emp(name varchar2(20),age number);
create table emp1(name varchar2(20),age number);

                    insert all
                       into emp(name,age) values('Rohit',20)
                       into emp(name,age) values('Amit',22)
                       into emp(name,age) values('Gaurav',25)
                       
                       into emp1(name,age) values('Manish',20)
                       into emp1(name,age) values('Rahul',32)
                       into emp1(name,age) values('Vikas',35)
                    select * from dual;
                    
    select * from emp;
    select * from emp1;
    truncate table emp1;
    desc emp;
    
    create table student1(rollno number,name varchar2(20),city varchar2(20));
    
    insert into student1 values(101,'Ajay','Pune');
    insert into student1 values(102,'Amit','Delhi');
    insert into student1 values(103,'vijay','Pune');
    insert into student1 values(104,'Ajay','Mumbai');
    
    commit;

    truncate table student1;
    
    SELECT * FROM student1;  

    select name,city from student1;
    
    select city from student1;
   
    select DISTINCT city from student1;
    
    select DISTINCT name from student1;
    
    create table city(name varchar2(20) NOT NULL);
   
    truncate table city;
    
    alter table city add state varchar2(20);
    
    insert into city values('');   /* Can not be null , will not work */
    
    insert into city values('Pune','');
     
    select * from city;
    
    ==============================================================
    
    create table product1(pid number,pname varchar2(20));
    create table product2(pid number,pname varchar2(20));
    
    insert into product1 values(101,'Keyboard');
    insert into product1 values(102,'Mouse');
    insert into product1 values(103,'USB');
    insert into product1 values(104,'DVD');
    insert into product1 values(101,'Mobile');
    insert into product1 values(101,'ROM',3000);
    insert into product1 values(102,'Keyboard',3000);
    
    select * from product1;
    
    insert into product2(pid,pname) select pid,pname from product1; /* Copy records from one table into another table */
    
    select * from product2;
    
    ============================================
    
    select pname from product1 where pid = 102; /* condition : pid = 102 */
    select * from product1 where pid = 102;  
    select pid from product1 where pname = 'Mouse';   
    select pname,pid from product1 where pname = 'Mouse';   
    select * from product1 where pid = 101;
    select distinct pid,pname from product1; 
    select * from product1 where pid > 101; 
    select * from product1 where pid >= 101; 
    select * from product1 where pid < 101;
    select * from product1 where pid != 101;    /* != not equal to */
    select * from product1 where pid <> 101;    /* <> not equal to */
    
    ===========================================
    
    select * from employee;
    
    delete from employee where age=34;   /* delete specific record*/
    
    delete from employee;            /* delete all record*/
    
    ===========================================
    
    select * from product1;
    
    update product1 set pname='RAM' where pid=103;
    
    alter table product1 add price number;
    
    update product1 set price=1000;
    
    update product1 set price=2000 where pname='RAM';
    
    update product1 set price=15000 where pname='Mobile';
    
    update product1 set price=null;
    
    update product1 set price='';
    
    update product1 set price=500 where pid IN (101,104);
    
    update product1 set price=500 where pname IN ('Keyboard','DVD');
    
    update product1 set price=800 where pid NOT IN (101,104);
    
    ===================================================================
    
    select * from product1;
    
    select pid as Product_ID, pname as Product_Name from product1; /* Column Alias name : Product_Id, Product_Name */
    
    select x.pid,x.price from product1 x;     /* Table alias name : s */
   
   ====================================================================
   
    select x.pid as Product_ID,x.price as Product_Name from product1 x;     /* Table alias name : s */
    
    select pid,price from product1;     
 
    select product1.pid from product1;
    
    ====================================================================
    
    select * from product1;
    
    select price from product1 where pname='Keyboard' AND pid=101 ; /* showing price where pname is keyboard and pid is 101 */
    
    select price from product1 where pname='RAM' OR pid=101 ;     /* showing price where pname is RAM or pid is 101 */
    
    select * from product1 where pid=101 AND pname='Keyboard' OR pname='Mobile';  /* showing all columns where pid is 101 and pname is keyboard or pname is Mobile */
    
    select * from product1 where pid >= 102 AND pid < 106;  /* showing all columns where pid is between 102 and 106 */
    
    select * from product1 where pid BETWEEN 102 AND 106;  /* showing all columns where pid is between 102 and 106 */
   
    select * from product1 where price IS NULL;  /* showing all columns where price is NULL */
    
    select * from product1 where price IS NOT NULL;  /* showing all columns where price is NULL */
    
    select * from product1 where price IS NOT NULL and pid = 101; /* showing all columns where price is NOT NULL and pid is 101*/  
 
    select * from product1 where pname LIKE 'M%';   /* All columns where pname starts with M */
    
    select * from product1 where pname LIKE '%M';   /* All columns where pname ends with M */
    
    select * from product1 where pname LIKE 'R_M';  /* All columns where pname starts with R and ends with M */
    
    select * from product1 where pname LIKE 'M___e';  /* All columns where pname starts with M and ends with e */
    
    select * from product1 where pname LIKE 'M%e';  /* All columns where pname starts with M and ends with e */
    
    select * from product1 where pname LIKE 'o%';  /* All columns where pname starts with M and ends with e */

    ========================================================================================
    
    select * from product1 ORDER BY pname ASC;  /* Sort records in ascending order */
    
    select * from product1 ORDER BY pname DESC; /* Sort records in descending order */
     
    select * from product1 ORDER BY pid ASC; 
     
    select * from product1 ORDER BY pid DESC; 
    
    select * from product1 ORDER BY pid desc,pname desc;  /* Sorting by pid first then by name*/
   
    select * from product1 ORDER BY pname,pid;     /* Sorting by pname first then by pid*/
    
    update product1 set price=4000 where price is null;
    
    ==================================================
    select sum(price) AS Total_Amt from product1;  /* sum of values of a column using sum() */
   
    select sum(price) AS Total_Amt from product1 where price > 2000; 
    
    select avg(price) AS Total_Amt from product1;     /* shows average of price */
    
    select count(pname) AS Total_Records from product1;  /* shows count of records */
   
    select count(pname) AS Total_Records from product1 where price >2000;
    
    select min(price) AS Total_Records from product1;
    
    select max(price) AS Total_Records from product1;
    
    select upper(pname) AS Total_Records from product1;
    
    select lower(pname) AS Total_Records from product1;
    
    select sqrt(5) from dual;
    
    ====================================================
    
    select * from product1;
    
    create table customer(cid number,cname varchar2(20),city varchar2(20),age number);
    
    insert all
         into customer(cid,cname,city,age) values(1,'Ajay','Pune',22)
         into customer(cid,cname,city,age) values(2,'Vijay','Mumbai',23)
         into customer(cid,cname,city,age) values(3,'Sanjay','Delhi',22)
         into customer(cid,cname,city,age) values(4,'Rohit','Chennai',24)
         into customer(cid,cname,city,age) values(5,'Akshay','Pune',25)
         into customer(cid,cname,city,age) values(6,'Amit','Pune',26)
         into customer(cid,cname,city,age) values(7,'Gaurav','Delhi',22)
    select * from dual;    
    
    select * from customer;
    
    select city,count(city) AS "Total Cusomers" from customer group by city order by city desc;   /* grouping records by city and count records*/
    
    select age,count(age) AS "Total Cusomers" from customer group by age having count(age)<3;   /* grouping records by city and count records */
   
    select * from customer order by city;   /* grouping records by city and count records*/
    
    select age,count(age) AS "Total Cusomers" from customer group by age having min(age)<25;   /* grouping records by city and count records */
    
    select age,count(age) AS "Total Cusomers" from customer group by age having max(age)>24;   /* grouping records by city and count records */
    
    =======================================================================================
    
    create table tabl1(sno number NOT NULL, name varchar2(10));
    
    insert into tabl1 values(1,'abc');
    insert into tabl1 values('','abc');
    insert into tabl1 values(2,'def');
    insert into tabl1 values(3,'');
    
    select * from tabl1;
    
    delete from tabl1 where sno=3;
    alter table tabl1 modify name varchar2(20) NOT NULL;
   
    desc tabl1;
    
    alter table tabl1 drop column name;
    alter table tabl1 ADD name varchar2(20);
    
   
    ===========================================================================
    
    /* Check constraint */
    
    create table tabl2(name varchar2(20),age number,check (age >=18));
    
    insert into tabl2 values('abc',22);
    
    insert into tabl2 values('abc',15);
    
    select * from tabl2;
    
  ========================================================================
  
    create table tabl3(name varchar2(20),age number check (age >=18));

    alter table tabl3 add per number check (per > 60);
    
    desc tabl3;
    
    insert into tabl3 values('Amit',22,75);
    
    insert into tabl3 values('Amit',24,55);
    
    insert into tabl3 values('Amit',24,65,1);
     
    select * from tabl3;
    
    alter table tabl3 add contact number(12);
    
    alter table tabl3 ADD CONSTRAINT ck_con Check(contact>0);   /* To add constraint using CONSTRAINT keyword */
    
    delete from tabl3;
    
    alter table tabl3 DROP CONSTRAINT ck_con;      /* To remove constraint using constraint name */
                                                /* ck_con : constraint name */
    select length('Ashutosh') As "Name Length " from dual;
    
    =========================================================
    
    create table tabl4(id number,name varchar2(20),city varchar2(20) default 'Pune');
    insert into tabl4 values(101,'Rahul','Delhi');
    select * from tabl4;
    
    insert into tabl4(id,name) values(102,'Saurav');
    insert into tabl4(id,name,city) values(102,'Saurav','');
    
    alter table tabl4 Modify name varchar2(20) DEFAULT '------';
    
    insert into tabl4(id,city) values(104,'Goa');
    
    create table tabl5(id number default 500,name varchar2(20),city varchar2(20) default 'Pune');
    
    ======================================================================
    
    create table tabl6(id number unique,name varchar2(20),city varchar2(20));
    insert into tabl6(id,name,city) values(101,'Saurav','abc');
    insert into tabl6(id,name,city) values(102,'Saurav','abc');
    insert into tabl6(id,name,city) values(103,'Saurav','xyz');
    insert into tabl6(id,name,city) values(104,'Saurav','');
    
    select * from tabl6;
    
    update tabl6 set city='Delhi' where id=102;
    
    alter table tabl6 add unique(city);
    
    =======================================================================
    
    create table tabl7(id number,name varchar2(20),primary key(id));
    insert into tabl7(id,name) values(101,'Saurav');
    insert into tabl7(id,name) values(102,'Gaurav');
    insert into tabl7(id,name) values(null,'Saurav');  /* primary key can not be null */
                                                       /* value of a column for primary key can not be same */
    select * from tabl7;
    =======================================================================
    
    create table tabl8(id number primary key,name varchar2(20));
    
    =======================================================================
    
    create table tabl9(id number,name varchar2(20),CONSTRAINT pk_id primary key(id));
    
    ========================================================================
    
    alter table tabl9 DROP CONSTRAINT pk_id;

   ===========================================
   
    alter table tabl8 DROP primary key;
    
    ==============================================
    
    create table tabl10(id number,firstname varchar2(20),lastname varchar2(20));
  
    insert into tabl10 values(101,'Ajay','Sharma');
    insert into tabl10 values(101,'Vikas','Gupta');
    insert into tabl10 values(102,'Gaurav','Sharma');
    
    delete from tabl10 where id=102;
    select * from tabl10;
    
    select firstname,lastname from tabl10 where id = 101 and lastname = 'Sharma';
    drop table tabl10;
    
    ========================================================================================================================
    /* Making ID+lastname as a primary key */
    
    create table tabl10(id number,firstname varchar2(20),lastname varchar2(20),CONSTRAINT pk_person PRIMARY KEY(id,lastname));
 
    ========================================================================================================================
    
    create table Empl(eid number,ename varchar2(20),primary key(eid));
    create table Address(city varchar2(20),id number CONSTRAINT fk_eid REFERENCES Empl(eid));
   
    insert into Empl values(101,'Amit');
    insert into Empl values(102,'Suresh');
    insert into Empl values(103,'Sunny');
    insert into Empl values(104,'Bunny');
    insert into Empl values(105,'Bunny');
    
    select * from Empl;
    
    insert into Address values('Mumbai',101);
    insert into Address values('Hyderabad',101);
    insert into Address values('Delhi',102);
    insert into Address values('Jaipur',103);
    insert into Address values('Pune',104);
  
    delete from Address where id=104;  
    delete from Empl where eid=103; 
    
    select * from Address;
    
    select e.eid,e.ename,a.city from Empl e,Address a where e.eid=a.id;
    
    ==========================================================================================
    
    create table Empl(eid number,ename varchar2(20),primary key(eid));
    create table Address(city varchar2(20),id number CONSTRAINT fk_eid REFERENCES Empl(eid));
    alter table Address Drop CONSTRAINT fk_eid;
    
    insert into Empl values(101,'Amit');
    insert into Empl values(102,'Suresh');
    insert into Empl values(103,'Sunny');
    insert into Empl values(104,'Bunny');
    insert into Empl values(105,'Bunny');
    insert into Empl values(107,'Sachin');
    insert into Empl values(108,'Vishal');
    
    select * from Empl;
    
    insert into Address values('Mumbai',101);
    insert into Address values('Hyderabad',101);
    insert into Address values('Delhi',102);
    insert into Address values('Jaipur',103);
    insert into Address values('Pune',104);
    insert into Address values('Delhi',106);
  
    delete from Address where id=104;  
    delete from Empl where eid=103; 
    
    select * from Address;
  
    select Empl.eid,Address.city from Empl INNER JOIN Address ON Empl.eid=Address.id;   /* Inner Join */
    
    select Empl.eid,Address.city from Empl LEFT JOIN Address ON Empl.eid=Address.id;   /* Left Join */
     
    select Empl.eid,Address.city from Empl RIGHT JOIN Address ON Empl.eid=Address.id;   /* Right Join */
    
    select Empl.eid,Address.city from Empl Full JOIN Address ON Empl.eid=Address.id;   /* Full Outer Join */
    
    =========================================================================
    
    create table fruits1(name varchar2(20));
    create table fruits2(name varchar2(20));
    
    insert into fruits1 values('banana');
     insert into fruits1 values('apple');
      insert into fruits1 values('orange');
       insert into fruits1 values('strawberry');
        insert into fruits1 values('Mango');
    
    
    insert into fruits2 values('Mango');
     insert into fruits2 values('Chiku');
      insert into fruits2 values('Mosambi');
       insert into fruits2 values('Grapes');
        insert into fruits2 values('Mango');
    
     delete from fruits1;
     select * from fruits1;
     select * from fruits2;
     
     select * from fruits2 union select * from fruits1;   /* union will remove redundancy from the records */
     
     select * from fruits2 union all select * from fruits1;   /* union will remove redundancy from the records */