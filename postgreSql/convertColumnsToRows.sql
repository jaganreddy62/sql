/* Data preperation*/
/*
select
emp_id,
sum(case when salary_component_type='salary' then val end ) as salary,
sum(case when salary_component_type='bonus' then val end ) as bonus,
sum(case when salary_component_type='hike_percent' then val end ) as hike_percent
into emp_compensation_pivot
from emp_compensation
group by emp_id order by emp_id
*/
/*
select * from emp_compensation_pivot
*/
/*
emp_id	salary	bonus	hike_percent
1	10000	5000	10
2	15000	7000	8
3	12000	6000	7
*/
select emp_id,'salary' as salary_component,salary as val from emp_compensation_pivot
union all
select emp_id,'bonus' as salary_component,bonus as val from emp_compensation_pivot
union all
select emp_id,'hike_percent' as hike_percent,salary as val from emp_compensation_pivot
/* output :
emp_id	salary_component	val
1	salary	10000
1	bonus	5000
1	hike_percent	10000
2	salary	15000
2	bonus	7000
2	hike_percent	15000
3	salary	12000
3	bonus	6000
3	hike_percent	12000
*/