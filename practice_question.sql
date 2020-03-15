**************************************************START*****************************************************************

*****************************************
Table DDL MYSQL
******************************************

create table store_data
(
id int,
revenue int,
category varchar(100)
)
;
*******************************************
Table DML MYSQL
*******************************************

insert into store_data values (1,60,'Toy');
insert into store_data values (2,50,'Food');
insert into store_data values (3,40,'Food');
insert into store_data values (1,6,'Drinks');
insert into store_data values (1,5,'Drinks');

********************************************
Problem Output
********************************************
Toy_Revenue	|Food_Revenue	|Drinks Revenue
    60	    |     90	    |    11
    
 ********************************************
 Note: Look into answer after sufficent try
 Answer Mentioned below 
 ********************************************
 
 
select sum(case when category='Toy' then revenue else null end )as toy_revenue,
       sum(case when category='Food' then revenue else null end )as Food_revenue,
       sum(case when category='Drinks' then revenue else null end) as Drinks_revenue
from store_data;
 
 

****************************************************END***********************************************************************






