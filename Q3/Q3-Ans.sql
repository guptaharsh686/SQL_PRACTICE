select * from teams

-- each team plays other team twice
select t1.team_code as team,t2.team_code as opponent
FROM teams t1
inner join teams t2
ON t1.team_code != t2.team_code



-- each team plays with other team once
with matches as
	(select row_number() over(order by team_name) as Id,
	team_code,
	team_name
	from teams t)
select team.team_name as team, opponent.team_name as opponent
from matches team
join matches opponent 
on team.id < opponent.id;
