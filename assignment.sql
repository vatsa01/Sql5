Problem 4 : Game Play Analysis I

# Write your MySQL query statement below
select player_id, first_login from (select player_id, event_date as first_login, 
rank() over(partition by player_id order by event_date) as rnk from Activity) as tble
where rnk = 1 
group by player_id

