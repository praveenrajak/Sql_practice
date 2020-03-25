*******************************************START***********************************************

-------------------------------------------
DDL FOR TABLES
------------------------------------------

create table parent
(
parent_id int,
payments int,
month1 int
);

create table child
(
child_id int,
parent_ref int,
sold int
);

NOTE: ALL THE DDL ARE USED IN MYSQL DATABASE
----------------------------------------------
DML FOR TABLES
----------------------------------------------

insert into parent values (1,100,1);
insert into parent values (2,120,1);
insert into parent values (3,130,2);

insert into child values (1,1,20);
insert into child values (2,1,30);
insert into child values (3,2,50);
insert into child values (4,2,10);

----------------------------------------------
SAMPLE OUTPUT
----------------------------------------------
------------------------
payment| sold| month    |
------------------------
220    | 110 | 1
130    | 0   | 2




----------------------------------------------
Solution
----------------------------------------------


select sum(payments) as payments,sum(ss) as sold,month1 as month 
from parent a 
left join ( select parent_ref,sum(sold)  as ss from child group by parent_ref)b
 on a.parent_id=b.parent_ref
 group by month1;
 
 
 
 ***************************************************END*********************************************************************








