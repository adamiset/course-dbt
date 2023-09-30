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
    order_items.product_id as product_id,
    order_items.quantity as quantity_ordered
from {{ ref('stg_postgres__events') }} as events
left join {{ ref('stg_postgres__order_items') }} as order_items
on events.order_id = order_items.order_id