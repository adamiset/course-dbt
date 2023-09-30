- Week 3 submission Part 1 SQLS:


-- Overall conversion rate    
select
    count(distinct events.session_id) /(
        select
            count(distinct events.session_id)
        from
            stg_postgres__events events
    ) * 100 as conversion_rate_pct
from
    stg_postgres__events events
where
    events.event_type = 'checkout';
select
    count(distinct events.session_id) /(
        select
            count(distinct events.session_id)
        from
            int_events_with_product_details events
    ) * 100 as conversion_rate_percent
from
    int_events_with_product_details events
where
    events.event_type = 'checkout';


-- Conversion rate by product
select
    (
        count(distinct events_with_orders.session_id) /(
            select
                count(distinct events.session_id)
            from
                stg_postgres__events events
            where
                events.event_type = 'page_view'
                and events.product_id = events_with_orders.product_id
        )
    ) * 100 as conversion_rate_by_product_percent,
    products.name,
    events_with_orders.product_id
from
    fact_events_with_product_orders as events_with_orders,
    stg_postgres__products as products
where
    products.product_id = events_with_orders.product_id
    and events_with_orders.event_type = 'checkout'
group by
    products.name,
 events_with_orders.product_id
 order by products.name;
    