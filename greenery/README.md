Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices



1 User count: 130
select count(distinct user_id) user from dbt_adamisetucscedu.stg_users ;


2. Around 7.78 orders per hour

select count(distinct a.order_id)/(select datediff(hour, min(b.created_at) , max(b.created_at) ) from dbt_adamisetucscedu.stg_orders b ) as avg_orders_per_hour 
 from  dbt_adamisetucscedu.stg_orders a;

3. Around 3.891803 day for order to be delivered after ordering
select  (SUM(datediff(day, a.created_at, a.delivered_at)))/count(a.order_id) as time_to_deliver_days from stg_orders a where delivered_at is not null;
OR
select  AVG(datediff(day, a.created_at, a.delivered_at)) as time_to_deliver_days from stg_orders a where delivered_at is not null;


4.
25 user with 1 order
SELECT COUNT(*) FROM (select a.user_id from stg_orders a group by a.user_id having count(a.order_id) = 1) AS users_with_one_order;


28 user with 1 order
SELECT COUNT(*) FROM (select a.user_id from stg_orders a group by a.user_id having count(a.order_id) = 2) AS users_with_two_order;


71 user with 1 order
SELECT COUNT(*) FROM (select a.user_id from stg_orders a group by a.user_id having count(a.order_id) >= 3) AS users_with_threeOrmore_order;
 


5. .0986 sessions/hr
select (datediff(hour, min(b.created_at) , max(b.created_at)) ) / (select count(distinct a.session_id) from stg_events a ) as unique_sessions_per_hr from stg_events b ;


