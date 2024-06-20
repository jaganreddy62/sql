/*find duplicates in a give table*/
select emp_id,count(1) from emp group by emp_id having count(1) >1 ;

/*delete duplicates ina given table*/
with cte as (
	select * ,row_number() over (partition by emp_id  order by emp_id ) as rn
	from emp
)
delete from cte where rn >2 ;

/* show only duplicate records*/

with cte as (
	select * ,row_number() over (partition by emp_id  order by emp_id ) as rn
	from emp
)
select * from cte where rn >2 ;

/*employyes who are not present in department */

select emp_id from emp where dept_id not in (select dept_id from dep)

/*Above query is not optimized as subquery may take time instead we can use left join */
select emp_id from (
select e.emp_id,d.dept_name from emp e left join dep d on e.dep_id=d.dept_id)
where dept_name is null ;

/* find all transactions done by jagan,Jagan,JAGAN*/
select * from orders where upper(user)='JAGAN';

/* update gender column where its female set male,where its male set female*/
/*swap genders*/
update orders set cust_gender=case when cust_gender ='male' then 'female'
                              when cust_gender ='female' then 'male'
							  end



