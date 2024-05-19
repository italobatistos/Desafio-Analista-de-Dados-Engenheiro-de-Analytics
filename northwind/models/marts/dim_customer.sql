with
    customers as (
        select *
        from {{ref('stg_erp__customers')}}
    )

    , transformations as (
        select
            row_number() over (order by customer_id) as sk_customer
            , *
        from customers
    )

select *
from transformations