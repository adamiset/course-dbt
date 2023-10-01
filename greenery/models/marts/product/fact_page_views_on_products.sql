{{ 
    config(
    materialized='table'
    ) 
}}
-- This fetches page views on a various products

select
    events.event_id,
    events.session_id,
    events.user_id,
    events.page_url,
    events.created_at,
    events.event_type,
    events.order_id,
    events.product_id,
    events.product_name,
    events.product_price,
    events.inventory
from {{ ref('int_events_with_product_details') }} as events
where events.event_type = 'page_view'
and   events.product_id is not null