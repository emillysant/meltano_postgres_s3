with source as (
    select * from {{ source('tap_s3_csv', 'customers') }}
)

select count(*) as total_customers from source