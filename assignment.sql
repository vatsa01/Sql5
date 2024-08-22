Problem 4 : Game Play Analysis I

# Write your MySQL query statement below
select player_id, first_login from (select player_id, event_date as first_login, 
rank() over(partition by player_id order by event_date) as rnk from Activity) as tble
where rnk = 1 
group by player_id

Problem 3 : Average Salary Department vs Company

select distinct left(pay_date, 7) as pay_month, department_id, case
                        when dept_avg > month_avg then 'higher'
                        when dept_avg = month_avg then 'same'
                        when dept_avg < month_avg then 'lower'
                        end as comparison
from (select s.pay_date, e.department_id, avg(s.amount) over(partition by s.pay_date) 
      as month_avg, avg(s.amount) over (partition by s.pay_date, e.department_id)
      as dept_avg from Salary s inner join Employee e on s.employee_id = e.employee_id)
as cte
