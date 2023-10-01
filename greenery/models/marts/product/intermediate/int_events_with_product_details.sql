{{ 
    config(
    materialized='table'
    ) 
}}

select
    events.event_id,
    events.session_id,
    events.user_id,
    events.page_url,
    events.created_at,
    events.event_type,
    events.order_id,
    events.product_id, 
    products.name as product_name,
    products.price as product_price,
    products.inventory
from {{ ref('stg_postgres__events') }} as events
left join {{ ref('stg_postgres__products') }} as products
on events.product_id = products.product_id