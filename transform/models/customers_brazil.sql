with source as (
    select * from {{ source('tap_s3_csv', 'customers') }}
)

select * from source where country = 'Brazil'