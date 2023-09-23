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



Part 1 (Models):
1. Repeat rate = 80%


select  sum(num_of_users_who_placed_two_or_more_orders)/(select count(distinct orders.user_id) from stg_postgres__orders as orders) repeate_rate from (
select 
   case when total_orders_placed_by_user = 1 then '1'
   when total_orders_placed_by_user = 2 then '2'
   when total_orders_placed_by_user > 2 then '3'
   end as num_of_orders_placed_by_user, count(user_id) num_of_users_who_placed_two_or_more_orders
from 
(select 
  count(distinct(order_id)) total_orders_placed_by_user,
        user_id
    from stg_postgres__orders
    group by user_id
)
 group by  num_of_orders_placed_by_user)
where num_of_orders_placed_by_user > 1;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

2. 

User who will likely purchase:
 - User who placed repeat orders 
 - User who placed repeat orders with 'promo_id' column populated in 'orders' table
 - User with more activity in 'events' table when a 'promo_id' is active
 - Users with quite a bit of data in 'events' table mostly with 'event_type' in  ('check out', 'package shipped')
 
User who will NOT likely purchase:
 - Users with quite a bit of data in 'events' table mostly with 'event_type' = 'page view'
------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
 
3. Created two intermediate models:
 
  1. Events with product details (int_events_with_product_details.sql)
     This enables to place web event data and product data in one place (includes product name etc.)
     This data can be queried to analyse the following:
        - Views on a specific product
        - Metrics which product was added to cart, checkout etc
  
  2. Orders with product & promo details (int_orders_with_product_promo_invetory_details.sql)
     This enables to place the order data, product and promo data in one place (includes product name, promo code etc.)
     This data be queried to analyse the following 
     	- Get metrics on most often order product, most often used promo code etc
   
 Created three fact models:

  1. fact_event_traffic_by_product.sql (Metrics on the web event on each product)
  2. fact_orders_per_product.sql  (Metrics on number of orders on each product)
  3. fact_page_views_on_products.sql (Data to analyse page views the product)
  

Created one dimensional model:

  1. dim_user_and_address.sql (Users and address details data combined in one place)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Part 2 (Tests):

- Each test assumed for uniqueness of the record and not NULL
- my_first_dbt_model failed due to null value (fixed the sql to not pick up null)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Part3 (dbt snap shots):

Inventory on the below 4 product changed:
  	Philodendron,
	Monstera,
	Pothos,
	String of pearls

