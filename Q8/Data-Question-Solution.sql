From the login_details table, fetch the users who logged in consecutively 3 or more times.

--Table Structure:

drop table login_details;
create table login_details(
login_id int primary key,
user_name varchar(50) not null,
login_date date);

delete from login_details;
insert into login_details values
(101, 'Michael', current_date),
(102, 'James', current_date),
(103, 'Stewart', current_date+1),
(104, 'Stewart', current_date+1),
(105, 'Stewart', current_date+1),
(106, 'Michael', current_date+2),
(107, 'Michael', current_date+2),
(108, 'Stewart', current_date+3),
(109, 'Stewart', current_date+3),
(110, 'James', current_date+4),
(111, 'James', current_date+4),
(112, 'James', current_date+5),
(113, 'James', current_date+6);

select * from login_details;









--this is not for logged in consecitively this is overall
select 
user_name
from login_details
group by user_name
having count(*) >= 3


--this is for logged in consecitively

with cte as
(
	select
	distinct
	l1.user_name
	from login_details l1
	join login_Details l2
	on l2.login_id = l1.login_id + 1 and l1.user_name = l2.user_name
	join login_details l3
	on l3.login_id = l1.login_id + 2 and l1.user_name = l3.user_name
)
select user_name from cte



-----------------------------------------------------------------------------------

with cte as
	(
		select 
		 *,
		 case when user_name = lead(user_name) over(order by login_id)
			and user_name = lead(user_name, 2) over(order by login_id)
			then user_name
			else null
		end as repeated_users
		from login_details
	)
select distinct repeated_users from cte
where repeated_users is not null


