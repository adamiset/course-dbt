{{ 
    config(
    materialized='table',
    post_hook= "{{ grant_select('reporting', 'dbt_adamisetucscedu', 'fact_event_type_agg_per_session') }}"
    ) 
}}

select
    session_id
    {{ event_types('stg_postgres__events', 'event_type') }}
from {{ ref('stg_postgres__events') }} 
group by session_id
