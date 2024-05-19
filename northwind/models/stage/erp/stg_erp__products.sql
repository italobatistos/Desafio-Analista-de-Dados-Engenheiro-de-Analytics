with
    source_product as (
        select 
            cast(product_id	as int) as product_id
            , cast(supplier_id as int) as product_supplier_id
            , cast(category_id as int) as product_category_id
            , cast(product_name as string) as product_name
            , cast(quantity_per_unit as string) as product_qnt_per_unit
            , cast(unit_price as numeric) as product_unit_price
            , cast(units_in_stock as string) as product_unt_in_stock
            , cast(units_on_order as string) as product_unt_on_ord
            , cast(reorder_level	as string) as product_reorder_lvl
            , case
                when discontinued = 1 then true
                else false
            end as is_discontinued
        from {{ source('erp', 'products')}}
    )
select *
from source_product