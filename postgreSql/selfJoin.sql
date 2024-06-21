/* find employees whose salary is greater than that of managers*/
/*DDl : */
/*create table emp_manager(emp_id int,emp_name varchar(50),salary int,manager_id int);
insert into emp_manager values(	1	,'Ankit',	10000	,4	);
insert into emp_manager values(	2	,'Mohit',	15000	,5	);
insert into emp_manager values(	3	,'Vikas',	10000	,4	);
insert into emp_manager values(	4	,'Rohit',	5000	,2	);
insert into emp_manager values(	5	,'Mudit',	12000	,6	);
insert into emp_manager values(	6	,'Agam',	12000	,2	);
insert into emp_manager values(	7	,'Sanjay',	9000	,2	);
insert into emp_manager values(	8	,'Ashish',	5000	,2	);

select * from emp_manager;
emp_id	emp_name	salary	manager_id
1	Ankit	10000	4
2	Mohit	15000	5
3	Vikas	10000	4
4	Rohit	5000	2
5	Mudit	12000	6
6	Agam	12000	2
7	Sanjay	9000	2
8	Ashish	5000	2

*/

/* using self join we can solve*/
select e.emp_id,e.emp_name,e.salary from emp_manager e join emp_manager m
on e.manager_id = m.emp_id and e.salary > m.salary;
/*output
"emp_id"	"emp_name"	"salary"
1	"Ankit"	10000
2	"Mohit"	15000
3	"Vikas"	10000 */

/*similary we can get managers name*/
select e.emp_id,e.emp_name,e.salary,m.emp_name as manager_name,m.salary as manager_salar
from emp_manager e join emp_manager m
on e.manager_id = m.emp_id;
/*output 
"emp_id"	"emp_name"	"salary"	"manager_name"	"manager_salar"
1	"Ankit"	10000	"Rohit"	5000
2	"Mohit"	15000	"Mudit"	12000
3	"Vikas"	10000	"Rohit"	5000
4	"Rohit"	5000	"Mohit"	15000
5	"Mudit"	12000	"Agam"	12000
6	"Agam"	12000	"Mohit"	15000
7	"Sanjay"	9000	"Mohit"	15000
8	"Ashish"	5000	"Mohit"	15000
*/