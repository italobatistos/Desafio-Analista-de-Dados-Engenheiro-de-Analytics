with
    source_details as (
        select 
            cast(order_id as int) as details_order_id
            , cast(product_id as int) as details_product_id
            , cast(discount	as numeric) as details_discount
            , cast(unit_price as numeric) as details_unt_price
            , cast(quantity as int) as details_quantity
        from {{ source('erp', 'order_details')}}
    )
    
select *
from source_details