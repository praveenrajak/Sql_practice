*********************************************************START*************************************************

Question: We need to Get the Data where it is present for all Dates.

**************************************
Table DDL:
**************************************
create table unique_value
(
id int,
data varchar(10),
present_date date
);

****************************************
Table DML:
****************************************

insert into unique_value values (1,'a','2020-03-01');
insert into unique_value values (2,'a','2020-03-02');
insert into unique_value values (3,'a','2020-03-03');
insert into unique_value values (4,'a','2020-03-04');
insert into unique_value values (5,'b','2020-03-01');
insert into unique_value values (6,'b','2020-03-02');
insert into unique_value values (7,'b','2020-03-03');
insert into unique_value values (8,'b','2020-03-04');
insert into unique_value values (9,'c','2020-03-01');
insert into unique_value values (10,'c','2020-03-02');
insert into unique_value values (11,'c','2020-03-03');
insert into unique_value values (12,'d','2020-03-04');


*******************************************
SAMPLE OUTPUT:
*******************************************

SNO  |  DATA
1.   |   a
2.   |   b

*********************************************


SOLUTION:

**********************************************

select * from unique_value;
select data from (
select data,count(data) as datacnt from unique_value group by data ) a,
(select count(distinct present_date ) as cnt  from unique_value) b
where a.datacnt=b.cnt;

*******************************************************************END****************************************************










