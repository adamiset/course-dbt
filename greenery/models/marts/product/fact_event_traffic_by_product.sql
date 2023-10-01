-- Gather event metrics by each product

{{ 
    config(
    materialized='table'
    ) 
}}

select
    events.product_name,
    events.product_id,
    count(events.event_id) as num_of_web_events_on_this_product
from {{ ref('int_events_with_product_details') }} as events
where events.product_id is not null
group by all
