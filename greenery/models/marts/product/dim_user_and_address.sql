-- Fetch user data along with the address details

{{ 
    config(
    materialized='table'
    ) 
}}

select
    users.user_id,
    users.first_name,
    users.last_name,
    users.email,
    users.phone_number,
    users.created_at,
    users.updated_at,
    users.address_id 
from {{ ref('stg_postgres__users') }} as users
left join {{ ref('stg_postgres__addresses') }} as addresses
on users.address_id = addresses.address_id
