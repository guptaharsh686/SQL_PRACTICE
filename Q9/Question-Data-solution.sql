From the students table, write a SQL query to interchange the adjacent student names.

Note: If there are no adjacent student then the student name should stay the same.

--Table Structure:

drop table students;
create table students
(
id int primary key,
student_name varchar(50) not null
);
insert into students values
(1, 'James'),
(2, 'Michael'),
(3, 'George'),
(4, 'Stewart'),
(5, 'Robin');

select * from students;

---------------------------------------------------------------SOLUTION--------------------------------------------------------------


with cte as
(
	select
	*,
	case
		when id % 2 <> 0 
			then COALESCE(lead(student_name) over(order by id),student_name)
		else
			COALESCE(lag(student_name) over(order by id),student_name)
	end as new_stud_name
	from students
)
select * from cte



-----------------------------------------------------------------------------------------------------------------------------------------------


select id,student_name,
case when id%2 <> 0 then lead(student_name,1,student_name) over(order by id)
when id%2 = 0 then lag(student_name) over(order by id) end as new_student_name
from students;


