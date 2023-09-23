-- This is a breakdown of orders on each product

{{ 
    config(
    materialized='table'
    ) 
}}

select
    order_detail.product_name,
    order_detail.product_id, order_detail.d
    count(distinct order_detail.order_id) as num_of_orders_for_this_product
from {{ ref('int_orders_with_product_promo_invetory_details') }} as order_detail
group by all