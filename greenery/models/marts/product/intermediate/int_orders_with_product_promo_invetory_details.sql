{{ 
    config(
    materialized='table'
    ) 
}}

select

  	orders.order_id,
	orders.user_id,
	orders.promo_id,
	orders.address_id,
	convert_timezone('UTC', orders.created_at ) as order_created_at_utc,
	orders.order_cost,
	orders.shipping_cost,
	orders.order_total,
	orders.tracking_id,
	orders.shipping_service,
	convert_timezone('UTC', orders.estimated_delivery_at) as stimated_delivery_at_utc,
	convert_timezone('UTC', orders.delivered_at) as order_delivered_at_utc,
    orders.status as order_status,
    order_items.quantity as order_item_quantity,
    products.name as product_name,
 	products.product_id,
    products.price as product_price,
    products.inventory as product_inventory

from {{ ref('stg_postgres__orders') }} as orders
left join {{ ref('stg_postgres__order_items') }} as order_items
on orders.order_id = order_items.order_id
left join {{ ref('stg_postgres__products') }} as products
on order_items.product_id = products.product_id
   