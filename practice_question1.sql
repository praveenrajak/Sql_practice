Problem Statement: we need to get plan details wheather plan got upgraded or degraded or both for a customer during the 
whole subscripation time .


sample output :
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

customer_id| upgrade | downgrade
    1      |   yes   |   yes
    2      |   yes   |   No
    3      |   No    |   No
    4      |   No    |   yes
    5      |   yes   |   No
  
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Explation:
1: for customer_id(1) in sample input first plan started with 199 then upgrade to 599 on next month so upgrade will be yes 
then on the next month it got degrade to 399 from 599 to downgrade also yes.

2:For customer_id(3) in sample input there is no change in plan so in output it will be no to both upgrade and downgrade.


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Sample Input :

customer_id,plan_month,plan_value
  1        ,2020-04-10,   199
  1        ,2020-05-10,   599
  1        ,2020-06-10,   399
  2        ,2020-04-10,   199
  2        ,2020-05-10,   399
  3        ,2020-04-10,   999
  3        ,2020-05-10,   999
  3        ,2020-06-10,   999
  4        ,2020-04-10,   499
  4        ,2020-05-10,   299
  5        ,2020-04-10,   299
  5        ,2020-05-10,   399
  5        ,2020-06-10,   499

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      Problem Statement ENDS
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Solution:

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
There are many ways to solve problem one solution given below.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


select a.customer_id,
max(case when a.plan_value < b.plan_value then 'yes' else 'no' end) as upgrade ,
max(case when a.plan_value > b.plan_value then 'yes' else 'no' end) as downgrade 
from 
(select *,row_number() over(partition by customer_id order by plan_month) as rnk from dataplan)a
inner join 
(select *,row_number() over(partition by customer_id order by plan_month) as rnk1 from dataplan)b
on a.rnk=b.rnk1-1 
where a.customer_id=b.customer_id
group by a.customer_id
order by a.customer_id,b.customer_id;

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ENJOY SQL TIME!!
