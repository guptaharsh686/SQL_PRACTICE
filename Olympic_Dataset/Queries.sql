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

4. 

    
