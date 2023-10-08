{{ 
    config(
    materialized='table'
    ) 
}}
-- This fetches page views on a various products


select
    session_id
  , sum(case when event_type = 'page_view' then 1 else 0 end) as total_page_view
  , sum(case when event_type = 'add_to_cart' then 1 else 0 end) as total_add_to_cart
  , sum(case when event_type = 'checkout' then 1 else 0 end) as total_checkout
  , sum(case when event_type = 'package_shipped' then 1 else 0 end) as total_package_shipped
from {{ ref('stg_postgres__events') }} 
group by session_id