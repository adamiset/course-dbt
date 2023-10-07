Part1: 

2. Which products had their inventory change from week 3 to week 4? (SQL in README_week4_sql.md)
```
select * from inventory_snapshot  where 
date_trunc(week, dbt_valid_to) = date_trunc(week, current_date)
order by inventory asc;
```