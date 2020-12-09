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
     
     select * from fruits2 union all select * from fruits1;   /* show all records  */
     
     =====================================================
     
     create table tb1(name varchar2(20),city varchar2(20));
     create table tb2(name varchar2(20),city varchar2(20),age number);
     
     insert into tb1 values('abc','Pune');
     insert into tb1 values('abc','Mumbai');
     insert into tb1 values('abc','Pune');
     
     insert into tb2 values('abc','Pune',22);
     insert into tb2 values('abc','Pune',23);
     insert into tb2 values('abc','Pune',24);
     
     select name,city from tb1 union select name,city from tb2;
     
     
     =====================================================
     
     select pid,pname from product1;  /* Running query without creating index on table product1  0.047 secs */
     
     create index idx_pid on product1(pid,pname);  /* created index on table product1 for pid column*/
     
     select * from product1;   /* Running query with creating index on table product1  0.01 sec*/
     
     drop index idx_pid;       /* Dropping index*/
     
     create table dummy(sno number);
     
     insert into dummy values(101);
     insert into dummy values(102);
     delete from dummy;
     select * from dummy;
     
     create unique index idx_dm on dummy(sno);  /* Creating unique index on table */
     
     ====================================================================
     
     create table empsal(eno number primary key,ename varchar2(20),salary  number,city varchar2(20));
     
     insert into empsal values(101,'Sumit',10000,'Delhi');
     insert into empsal values(102,'Ajay',12000,'Mumbai');
     insert into empsal values(103,'Sanjay',14000,'Bengaluru');
     insert into empsal values(104,'Sunil',25000,'Pune');
     insert into empsal values(105,'amit',34000,'Delhi');
     insert into empsal values(106,'Vikas',24000,'Pune');
       
     drop table empsal;  
     select * from empsal;
     
     create or replace view v_emp AS select eno,ename,city from empsal with read only; /* create view v_emp */

     create or replace view v_emp1 AS select ename,city from empsal where city='Pune';

     create or replace view v_emp2 AS select ename || '(' || city || ')'  "Name (City)" from empsal;
     
     select * from v_emp;  
     select city from v_emp;  
    
     select * from v_emp1;  
     select * from v_emp2;   
     
     drop view v_emp2;  
    
     desc v_emp;    
     
     delete from v_emp;
     
     insert into v_emp values(107,'Rohit','NOIDA');
     
     ===============================================================
     
     create table laptop(pid number,price number);
     delete from laptop;
     
     insert into laptop values(1031,28000);
     
     select * from laptop;
     
     create or replace view v_laptop as select pid,price from laptop where pid=1031 with check option;
     
     select * from v_laptop;
     
     insert into v_laptop values(1031,30000);
     
     =============================================================
     
     create table user1(email varchar2(30),password varchar2(20) check(length(password)>8));
    
     insert into user1 values('ab@gmail.com','abcdefghi'); 
    
     insert into user1 values('ab@gmail.com','abc'); 
      
     select * from user1;
    ==============================================================
    
    
    DECLARE
    BEGIN
    null;
    END;
    /
=================================================
    SET SERVEROUTPUT ON
   
    DECLARE
    BEGIN
        dbms_output.put_line('Welcome to PLSQL');  /* Statement to display output on the screen */
    END;
    /

================================================

    DECLARE
           name varchar2(20) := 'PLSQL ';  -- string variable name --
           age number(2) := 10;           -- defining age as number and assigning value 10 to age
           pi CONSTANT double precision:= 3.14;
           x number :=1.23;
           ch CHAR(1) := 'S';  -- Declaration with initialization
           v1 number(3);    -- Declaration
           v2 number(3) default 400;  -- Initiazing Default value to v2
           str varchar2(20) DEFAULT 'A STRING VALUE';  -- Iniatilizing default value to str
           val varchar2(20) NOT NULL := 'ABC';   -- 
           v3 number;
           v4 integer := 300;
    BEGIN
  
        v1 := 500;         -- Initialization
        dbms_output.put_line(name);  /* Statement to display output on the screen */
        dbms_output.new_line();
        dbms_output.put_line(age|| ' ' || pi || x || ch);   --  (Concatenation operator)|| is used to concatenate the values
        dbms_output.new_line();
        dbms_output.put_line(v1);        
        dbms_output.put_line(v2);  
        dbms_output.new_line();
        dbms_output.put_line(str || val|| ' , '||v4);  
    END;
    
==============================================================

  
    DECLARE
          v1 integer := 50;
          v2 integer := 200;
          v3 integer;
          V4 REAL := 3.14;
    BEGIN
         v3 := v1+v2;
        dbms_output.put_line('Sum is : '||v3);    

        v3 := v1*v2;
        dbms_output.put_line('Product  is : '||v3);
        
        v3 := v1-v2;
        dbms_output.put_line('Subtraction is : '||v3);
        
        v3 := v1/v2;
        dbms_output.put_line('Division is : '||v3);
        
        dbms_output.put_line('Real no is : '||v4);
        
        
        dbms_output.put_line('Remainder is : '||MOD(15,4));
    END;

==============================================================================

    DECLARE
        r real := 4;
        pi CONSTANT real := 3.14;
        res real;
    BEGIN
       res := pi*r*r;
       
       dbms_output.put_line('Area is :' || res);
    END;

==================================================

DECLARE 
    v1 number :=10;        -- Global variable and it can be accessed throughout the block
BEGIN
    dbms_output.put_line(v1);
     
    DECLARE                      /* Nested PL/SQL block */
        v2 number := 20;    -- Local variable and can be accessed only within the inner block
    BEGIN
        dbms_output.put_line(v2);
        dbms_output.put_line(v1);
    END;
     dbms_output.put_line(v1);
     --   Local variable v2 can not be accessed in outer block   dbms_output.put_line(v2);
END;


===================================================================

DECLARE 
    v1 number :=10;        -- Global variable and it can be accessed throughout the block
BEGIN
    DECLARE                      /* Nested PL/SQL block */
        v1 number := 20;    -- Local variable and can be accessed only within the inner block
    BEGIN
        dbms_output.put_line(v1);
    END;
END;

==============================================================

DECLARE 
    v1 Date := '07-Dec-2020';        -- dd-Mon-yy
BEGIN
       dbms_output.put_line(v1);
END;

===============================================================

DECLARE 
        v1 number;
        v2 number;
BEGIN
       v1 := 30;
       v2 := 20;
       
       IF (v1<v2) then    -- IF BLOCK
              dbms_output.put_line(v1 || ' is less than '|| v2);
       END IF;
END;

==============================================================

DECLARE 
        v1 number;
        v2 number;
BEGIN
       v1 := 30;
       v2 := 40;
       
       IF (v1<v2) then    -- IF then else BLOCK
              dbms_output.put_line(v1 || ' is less than '|| v2);
       else
              dbms_output.put_line(v2 || ' is less than '|| v1);
       END IF;
END;

==========================================================

DECLARE 
        v1 number;
        v2 number;
BEGIN
       v1 := 40;
       v2 := 40;
       
       IF (v1<v2) THEN    -- IF then else BLOCK
              dbms_output.put_line(v1 || ' is less than '|| v2);
       ELSIF (v2<v1) THEN
              dbms_output.put_line(v2 || ' is less than '|| v1);
       ELSE
              dbms_output.put_line(v2 || ' is equal to '|| v1);
       END IF;
END;
============================================================


DECLARE 
        v1 number;
        v2 number;
BEGIN
       v1 := 40;
       v2 := 20;
       
       IF (v1>v2) THEN    -- OUTER IF
            DBMS_OUTPUT.PUT_LINE('WELCOME');
            IF (V1>10) THEN                -- NESTED IF 
            DBMS_OUTPUT.PUT_LINE('HI');
            ELSE
            DBMS_OUTPUT.PUT_LINE('HELLO');
            END IF;
       ELSE
            DBMS_OUTPUT.PUT_LINE('DEFAULT ANSWER');
       END IF;
END;

==================================================================

DECLARE 
        v char(1) :='f';
BEGIN
       CASE v
             when 'B' then dbms_output.put_line('Blue');
             
             when 'G' then dbms_output.put_line('Green');
             
             when 'R' then dbms_output.put_line('Red');
       
             else dbms_output.put_line('Invalid choice');
       END CASE;
END;

================================================================


DECLARE 
        v char(5) :='abc';
BEGIN
       CASE v
             when 'abc' then dbms_output.put_line('You name : '||v);
             
             when 'def' then dbms_output.put_line('You name : '||v);
             
             when 'ghi' then dbms_output.put_line('You name : '||v);
       
             else dbms_output.put_line('Invalid name');
       END CASE;
END;

============================================================

DECLARE 
        v number :=10;
BEGIN
       CASE v
             when 10 then dbms_output.put_line('You entered : '||v);
             
             when 20 then dbms_output.put_line('You entered : '||v);
             
             when 30 then dbms_output.put_line('You entered : '||v);
       
             else dbms_output.put_line('Invalid number');
       END CASE;
END;

=========================================================================


DECLARE 
        v number :=12;
BEGIN
       LOOP                                /* Exit loop */
            EXIT WHEN v < 10;
            DBMS_OUTPUT.PUT_LINE('HELLO - ' || v);
            
            v := v-1;
       END LOOP;
END;

=====================================================================


DECLARE 
        v number :=12;
BEGIN
       LOOP     /* Exit loop */ 
            IF (v = 10) then
                   exit;
            END IF;
              DBMS_OUTPUT.PUT_LINE('HELLO - ' || v);
            v :=v-1;
       END LOOP;
END;

=====================================================================
set serveroutput on

DECLARE 
        v number :=0;
BEGIN
    WHILE v<=10 LOOP                      /* While loop*/
        dbms_output.put_line(v);
        v := v+1; 
    END LOOP;
END;

===================================================================


DECLARE 
    
BEGIN
     FOR K IN 1..10 LOOP    /* FOR LOOP PRINTING VALUES FROM 1 TO 10*/
        DBMS_OUTPUT.PUT_LINE(K);
     END LOOP;
END;
=============================================


DECLARE  
BEGIN
     FOR K IN 1..10 LOOP   /* FOR LOOP PRINTING VALUES IN REVERSE ORDER*/
            IF K=8 THEN
                CONTINUE;  -- CONTINUE THE LOOP WITHOUT EXITING ON A SPECIFIC CONDITION
                --EXIT;    -- TERMINATE LOOP ON A SPECIFIC CONDITION
        END IF;
        DBMS_OUTPUT.PUT_LINE(K);
     END LOOP;
END;



DECLARE
     v boolean := TRUE;
BEGIN
      
          DBMS_OUTPUT.PUT_LINE(V);
    

END;

=============================================
declare
l char;
begin
  for al  in ascii('A')..ascii('Z') loop
    l := chr(al);
    dbms_output.put_line(l);
  end LOOP;
end; 


===============================================
-- String functions

declare
  ch char(1):='a';
  c char;
  i integer;
  
  s1 varchar2(20) :='hello world';
  s2 varchar2(20) :='India';
  s3 varchar2(20) :='INDIA';
  S4 VARCHAR2(20) :='....HI....';
  
begin
  i := ASCII(ch);               -- returning the ASCII value of a character
  dbms_output.put_line(i);
  
  c := CHR(i);                  -- returning the character equivalent of ASCII value
  dbms_output.put_line(c);
  
  dbms_output.put_line(CONCAT(s1,s2));   --concat will concatenate strings
  
  dbms_output.put_line(initcap(s1));  --initcap converts first letter of each word in a string in capital case
  
  dbms_output.put_line(UPPER(s2));   -- converts a string to upper case 
  
  dbms_output.put_line(LOWER(s3));   -- converts a string to lower case
  
  dbms_output.put_line(LTRIM(s4,'.')); -- trims a string to the left
  
  dbms_output.put_line(RTRIM(s4,'.')); -- trims a string to the right
  
  dbms_output.put_line(TRIM('.' FROM s4)); -- trims a string to the left and right
  
  dbms_output.put_line(substr(s1,7,5));    -- finds a substring where 7 is starting index and 5 is no of characters to be printed
end; 

======================================

declare
       TYPE numbers IS VARRAY(5) OF integer;
       nm numbers; 
begin
       nm := numbers(1,2,3,4,5);
       
       for i in 1..5 loop
        dbms_output.put_line(nm(i));
       end loop;
end; 

================================================

declare
      num1 number;
begin
     dbms_output.put_line('Enter a number :');
     num1 := &num1;
        
     dbms_output.put_line('Entered number :'||num1);
end;

=============================================================


CREATE OR REPLACE PROCEDURE demo_pr  -- Defining a procedure which is not taking any parameter
IS
  n integer :=5;
BEGIN
    dbms_output.put_line('Welcome to procedure '||n*n);
END;

BEGIN
    demo_pr;        -- calling procedure without passing any parameter
    demo_pr;
END;

DROP PROCEDURE demo_pr;

=============================================================


CREATE OR REPLACE PROCEDURE demo_pr1(x1 IN integer)  -- Defining a procedure which is taking a parameter of type integer
IS
  n integer :=5;
BEGIN
    dbms_output.put_line('Welcome to procedure '||n*x1);
END;

/* Defining block to call the procedure */
BEGIN
    demo_pr1(100);        -- procedure calling on passing value 100
    demo_pr1(200);
END;

================================================================


CREATE OR REPLACE PROCEDURE demo_pr2(x1 IN integer,x2 IN integer)  -- Defining a procedure which is taking 2 parameter of type integer
IS
  n integer;
BEGIN
    n := x1 * x2;
    dbms_output.put_line('Product of '||x1 ||' and '||x2||' is : '||n);
END;

/* Defining block to call the procedure */
BEGIN
    demo_pr2(6,8);        -- procedure calling on passing value 100
END;

============================================================

CREATE OR REPLACE PROCEDURE demo_pr3(x1 IN integer,x2 IN real)  -- Defining a procedure which is taking 2 parameter of type integer
IS
  n real;
BEGIN
    n := x1 * x2;
    dbms_output.put_line('Product of '||x1 ||' and '||x2||' is : '||n);
END;

/* Defining block to call the procedure */
BEGIN
    demo_pr3(6,8.2);        -- procedure calling on passing value 100
END;

=====================================================================
DECLARE 
v number(3):= 35;
BEGIN 
WHILE v<46 LOOP
 v:=v+1;
 IF v=40 THEN
   continue;
 END IF;
dbms_output.put_line(v);
END LOOP;
END;

====================================

DECLARE
TYPE names IS VARRAY(5) OF VARCHAR(20);
nm names;
BEGIN
nm := names('abhishek','abhinav','nimesh','nilesh','yogurt');
for k in 1..5 loop
dbms_output.put_line(UPPER(nm(k)) || ':' || length(nm(k)));
end loop;
end;

=======================================================================

CREATE OR REPLACE PROCEDURE demo_pr4(x1 IN integer,x2 OUT integer) 
IS
BEGIN
    x2 := x1 * x1;
END;

/* Defining block to call the procedure */

DECLARE
i integer;
BEGIN
    demo_pr4(6,i);        -- procedure calling on passing value 100
    dbms_output.put_line('Square is :'||i);
END;

==========================================================

CREATE OR REPLACE PROCEDURE demo_pr5(x1 IN real,x2 OUT real)  -- Defining a procedure which is taking a parameter of type integer
IS
     pi constant real:= 3.14;
BEGIN
     x2 := pi * x1 *x1;
END;


DECLARE
i real;
/* Defining block to call the procedure */
BEGIN
    demo_pr5(2.1,i);        -- procedure calling on passing value 100
    dbms_output.put_line('Area of circle : '||i);
END;

===========================================================


CREATE OR REPLACE PROCEDURE demo_pr6(x1 IN OUT real)  -- Defining a procedure
IS
     pi constant real:= 3.14;
BEGIN
     x1 := pi * x1 *x1;
END;


DECLARE
i real;
/* Defining block to call the procedure */
BEGIN
    i:=2.3;
    demo_pr6(i);        -- procedure calling on passing value 100
    dbms_output.put_line('Area of circle : '||i);
END;

=========================================================================


create table mytable1(id number,name varchar2(20),city varchar2(20));

select * from mytable1;

CREATE OR REPLACE PROCEDURE InsertRecord(id IN number,name IN varchar2,city In varchar2)  -- Defining a procedure
IS
BEGIN
     insert into mytable1 values(id,name,city);
END;

CREATE OR REPLACE PROCEDURE shRecord(i IN number)  -- Defining a procedure
IS
    id mytable1.id%type;
BEGIN
     select id into id from mytable1 where id=i;
     
     dbms_output.put_line(id);
END;

DECLARE
/* Defining block to call the procedure */
BEGIN
    InsertRecord(102,'Manish','Delhi');
    InsertRecord(103,'Vishal','Mumbai');
    InsertRecord(104,'Vivek','Chennai');
    InsertRecord(105,'Ravi','Pune');
    InsertRecord(106,'Gaurav','Pune');
    InsertRecord(107,'Saloni','Mumbai');
    
    dbms_output.put_line('Data Saved successfully...');
END;

===========================================================

CREATE OR REPLACE PROCEDURE pr1
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO');
END;

=======================================================

-- 1st way to call procedure
EXEC pr1;   ---  To call procedure
EXECUTE pr1;


-- 2nd way to call procedure

begin
    pr1;       ---  To call procedure
end;

========================================================
set serveroutput on;

select * from mytable1;
DESC mytable1;

CREATE OR REPLACE PROCEDURE showRec(no IN number)
IS
   i number;
   n varchar2(20);
   cy varchar2(20);
BEGIN
    select id,name,city into i,n,cy from mytable1 where id=no;    -- copying field values from the table into variables
    dbms_output.put_line('ID : ' || i ||' Name : '||n||' City : '||cy);
END;

execute showrec(105);

============================================================

CREATE OR REPLACE FUNCTION  addition(a IN number, b IN number) RETURN number -- function definition 
AS
c number;
BEGIN
c := a+b;
return c;
END;

DECLARE
 result number;
BEGIN
    result := addition(15,19);   -- function calling statement on passing two values
    dbms_output.put_line('Sum is : '||result);
END;


===================================================================

CREATE OR REPLACE FUNCTION  Maximum(a IN number, b IN number) RETURN number -- function definition 
AS
c number;
BEGIN
    dbms_output.put_line('Calculating....');
    IF a > b then
        c :=a;
    ELSE
        c :=b;
    END IF;
return c;
END;

DECLARE
 result number;
BEGIN
    result := maximum(15,19);   -- function calling statement on passing two values
    dbms_output.put_line('Maximum is : '||result);
END;

==============================================================

select * from mytable1;

CREATE OR REPLACE FUNCTION  countRecords RETURN number -- function definition 
AS
cnt number;
BEGIN
   SELECT count(*) into cnt from mytable1;      -- counting no of records in table 
return cnt;
END;

DECLARE
 result number;
BEGIN
    result := countRecords;   -- function calling statement on passing two values
    dbms_output.put_line('Total records in table  : '||result);
END;

=========================================================================

CREATE OR REPLACE PROCEDURE showRec(no IN number)
IS
   i number;
   n varchar2(20);
   cy varchar2(20);
BEGIN
    select id,name,city into i,n,cy from mytable1 where id=no;    -- copying field values from the table into variables
    dbms_output.put_line('ID : ' || i ||' Name : '||n||' City : '||cy);
END;

execute showrec(105);

desc mytable1;

select * from mytable1;
alter table mytable1 MODIFY city varchar2(10);
execute InsertRecord(111,'ABCD','New Delhi');

execute showrec(111);

=================================================

CREATE OR REPLACE PROCEDURE showRec1(no IN number)
IS
   i number;
   n varchar2(20);
   cy varchar2(20);
BEGIN
    select id,name,city into i,n,cy from mytable1 where id=no;    -- copying field values from the table into variables
    dbms_output.put_line('ID : ' || i ||' Name : '||n||' City : '||cy);
END;

desc mytable1;

execute showrec1(101);
=================================================


CREATE OR REPLACE PROCEDURE showRec2(no IN number)
IS
   i mytable1.id%type;    -- i number    type : will sync the data type specification from the table
   n mytable1.name%type;  -- n varchar2(20)
   cy mytable1.city%type; -- cy varchar2(10)
BEGIN
    select id,name,city into i,n,cy from mytable1 where id=no;    -- copying field values from the table into variables
    dbms_output.put_line('ID : ' || i ||' Name : '||n||' City : '||cy);
END;

execute showrec2(101);

=======================================================
/* Table based record */

CREATE OR REPLACE PROCEDURE showRec3(no IN number)
IS
   v_rec mytable1%rowtype;      -- rowtype is making a record variable 
BEGIN
    select * into v_rec from mytable1 where id=no;    -- copying field values from the table into variables
    dbms_output.put_line('ID : ' || v_rec.id||'Name : '||v_rec.name||'City '||v_rec.city);
END;

desc mytable1;

execute showrec3(105);

======================================================
SELECT * FROM MYTABLE1;

DECLARE
    i mytable1.id%type :=&i;    -- Taking id value at run time
    n mytable1.name%type;
BEGIN
      
      select name into n from mytable1 where id=i;  -- entered id is matched with the id column of the table
      dbms_output.put_line('Name : '||n);
      
      
      EXCEPTION
                WHEN NO_DATA_FOUND THEN        -- Handling system defined exception : NO_DATA_FOUND  
                        dbms_output.put_line('Employee '||i||' does not exist');
END;

=============================================================================

DECLARE
    i mytable1.id%type :=&i;    -- Taking id value at run time
    n mytable1.name%type;
    
    n1 number:=10;
    n2 number:=5;
    
    str number;    
    
    c char;
BEGIN
      
      c:=10;
      select name into n from mytable1 where id <= i;  -- entered id is matched with the id column of the table
      dbms_output.put_line(n1/n2);
    
      dbms_output.put_line('Name : '||n);
      
      str:=100;
      
      EXCEPTION
                WHEN NO_DATA_FOUND THEN        -- Handling system defined exception : NO_DATA_FOUND  
                        dbms_output.put_line('Employee '||i||' does not exist');
                WHEN TOO_MANY_ROWS THEN        -- Handling system defined exception : TOO_MANY_ROWS  
                        dbms_output.put_line('Database returning many records');
                WHEN ZERO_DIVIDE THEN        -- Handling system defined exception : ZERO_DIVIDE  
                        dbms_output.put_line('Number can not be divided by zero');                
                WHEN VALUE_ERROR THEN        -- Handling system defined exception : VALUE_ERROR 
                        dbms_output.put_line('Character can not be assigned to number variable');                
                 WHEN OTHERS THEN        -- Handling system defined exception : default exception 
                        dbms_output.put_line('Unknown Exception');                                
END;

 ======================================================================================
 
 
DECLARE
    i mytable1.id%type :=&i;    -- Taking id value at run time
    n mytable1.name%type;
    
    USER_EXCEPTION EXCEPTION;    -- DECLARE USER DEFINED EXCEPTION
BEGIN
      
      IF i <= 0 THEN
        RAISE USER_EXCEPTION;       -- Raising / generating exception 
      ELSE
            select name into n from mytable1 where id = i;  -- entered id is matched with the id column of the table
            dbms_output.put_line('Name : '||n);
      END IF;
      
      EXCEPTION
                WHEN NO_DATA_FOUND THEN        -- Handling system defined exception : NO_DATA_FOUND  
                        dbms_output.put_line('Employee ID does not exists');                    
      
                WHEN USER_EXCEPTION THEN        -- Handling system defined exception : NO_DATA_FOUND  
                        dbms_output.put_line('Employee ID can not be zero');                    
END;


===================================================================================================

create table players(pid number,name varchar2(20));

select * from players;

insert into players values(1,'Ajay');
insert into players values(2,'Amit');
insert into players values(3,'vijay');
insert into players values(4,'Rohit');

truncate table players;

commit;

delete from players where pid=3;
commit;
delete from players where pid=2;

alter table players add city varchar2(20);
alter table players drop column city;

truncate table players;

drop table players;

update players set pid=4 where pid=1; 
commit;
rollback;

select * from players;

insert into players values(2,'xyz');
insert into players values(6,'xyz');

SAVEPOINT SP2;

SAVEPOINT SP1;

ROLLBACK TO SAVEPOINT SP2;

DELETE FROM players where pid=6;
DELETE FROM players where pid=2;

insert into players values(9,'ABC');

SAVEPOINT SP3;

insert into players values(10,'ABC');

SAVEPOINT SP4;

ROLLBACK TO SAVEPOINT SP3;

