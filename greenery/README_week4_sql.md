Part1: 

2. Which products had their inventory change from week 3 to week 4? (SQL in README_week4_sql.md)
```
select * from inventory_snapshot  where 
date_trunc(week, dbt_valid_to) = date_trunc(week, current_date)
order by inventory asc;
```

3. 
```
  - Products had the most fluctuations in inventory?
    select snap2.product_id, (max(snap2.inventory) - min(snap2.inventory)) as inventory_change from inventory_snapshot snap2
    where  snap2.product_id in(
    select snap1.product_id from inventory_snapshot snap1
    group by snap1.product_id 
    having count(1) > 1)
    group by snap2.product_id
    order by  inventory_change asc;

  - Products that went out of stock:
    select snap2.* from inventory_snapshot snap2
    where snap2.inventory = 0 and snap2.product_id in(
    select snap1.product_id from inventory_snapshot snap1
    group by snap1.product_id 
    having count(1) > 1)
    order by snap2.product_id, snap2.inventory;

    Pothos
    String of pearls
```
