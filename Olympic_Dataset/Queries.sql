1. How many olympics games have been held?
  select count(distinct games) as total_olympic_games from olympics_history;

2. List down all Olympics games held so far.
  select distinct oh.year,oh.season,oh.city
    from olympics_history oh
    order by year;

3. Mention the total no of nations who participated in each olympics game?
    with all_countries as
  	        (select games, nr.region
  	        from olympics_history oh
  	        join olympics_history_noc_regions nr ON nr.noc = oh.noc
  	        group by games, nr.region)
  	    select games, count(1) as total_countries
  	    from all_countries
  	    group by games
  	    order by games
    ------------------------------------------------------------------------
    select oh.games, count(distinct noc)
  	from olympics_history oh
  	group by games

4. Which year saw the highest and lowest no of countries participating in olympics

Problem Statement: Write a SQL query to return the Olympic Games which had the highest participating countries and the lowest participating countries.

   with cte as
  (
    select
      games, count(*) as no_of_countries
    from
      (select
        games,nc.region
      from olympics_history oh
      inner join olympics_history_noc_regions nc on oh.noc = nc.noc
      group by games,nc.region) data
    group by games
  )
  select distinct
    concat(first_value(games) over(order by no_of_countries),'-',first_value(no_of_countries) over(order by no_of_countries)) as least_countries
    ,concat(first_value(games) over(order by no_of_countries desc),'-',first_value(no_of_countries) over(order by no_of_countries desc)) as most_countries
  from cte;

5.
    