with source_customers as (
    select * from {{ source('tap_s3_csv', 'customers') }}
),
source_orders as (
    select * from {{ source('tap_s3_csv', 'orders') }}
),
source_order_details as (
    select * from {{ source('tap_s3_csv', 'order_details') }}
),
orders_brazil as (
    select order_id
    from source_orders
    where customer_id in (
        select customer_id
        from source_customers
        where country = 'Brazil'
    )
)

select
    ob.order_id,
    count(od.order_id) as sales_quantity,
from
    orders_brazil ob
join
    source_order_details od on ob.order_id = od.order_id
group by
    ob.order_id