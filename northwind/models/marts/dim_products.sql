with
    products as (
        select *
        from {{ref('stg_erp__products')}}
    )

    , categories as (
        select *
        from {{ref('stg_erp__categories')}}
    )

    , suppliers as (
        select *
        from {{ref('stg_erp__suppliers')}}
    )

    , join_tables as (
        select
            products.product_id
            , products.product_supplier_id
            , products.product_category_id
            , products.product_name
            , products.product_qnt_per_unit
            , products.product_unit_price
            , products.product_unt_in_stock
            , products.product_unt_on_ord
            , products.product_reorder_lvl
            , products.is_discontinued
            , categories.category_name
            , categories.description_category
            , suppliers.supplier_conname
            , suppliers.supplier_comname
            , suppliers.supplier_address
            , suppliers.supplier_pcode
            , suppliers.supplier_city
            , suppliers.supplier_region
            , suppliers.supplier_country
        from products
        left join categories on
            products.product_category_id = categories.category_id
        left join suppliers on
            products.product_supplier_id = suppliers.supplier_id
    )

    , transformations as (
        select
            row_number() over (order by product_id) as sk_products
            , *
        from join_tables
    )

select *
from transformations