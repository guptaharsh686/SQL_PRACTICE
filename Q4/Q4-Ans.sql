
with cte as
	(
		select 
		row_number() over(partition by user_name order by user_id) as rnk,
		user_id
		,user_name
		,email
		from users
		order by user_id
	)
select * from cte
where rnk > 1
