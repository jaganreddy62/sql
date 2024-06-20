/*Table DDL*/
/*create table emp_compensation (
emp_id int,
salary_component_type varchar(20),
val int
);
*/
/*input values*/
/*insert into emp_compensation
values (1,'salary',10000),(1,'bonus',5000),(1,'hike_percent',10)
, (2,'salary',15000),(2,'bonus',7000),(2,'hike_percent',8)
, (3,'salary',12000),(3,'bonus',6000),(3,'hike_percent',7);
*/
/*table out put/
select * from emp_compensation;
emp_id	salary_component_type	val
1	salary	10000
1	bonus	5000
1	hike_percent	10
2	salary	15000
2	bonus	7000
2	hike_percent	8
3	salary	12000
3	bonus	6000
3	hike_percent	7
*/

/* query to convert to rows to column */
select
emp_id,
sum(case when salary_component_type='salary' then val end ) as salary,
sum(case when salary_component_type='bonus' then val end ) as bonus,
sum(case when salary_component_type='hike_percent' then val end ) as hike_percent
from emp_compensation
group by emp_id order by emp_id

/*output:
emp_id	salary	bonus	hike_percent
3	12000	6000	7
2	15000	7000	8
1	10000	5000	10
*/
