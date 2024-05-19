with
    shippers as (
        select *
        from {{ref('stg_erp__shippers')}}
    )

    , transformations as (
        select
            row_number() over (order by shipper_id) as sk_shippers
            , *
        from shippers
    )

select *
from transformations