with
    orders as (
        select *
        from {{ref('stg_erp__orders')}}
    )

    , details as (
        select *
        from {{ref('stg_erp__orders_details')}}
    )

    , joined_orders_details as (
        select
            orders.orders_id
            , orders.orders_employee_id
            , orders.orders_customer_id
            , orders.orders_ship_via
            , details.details_product_id
            , details.details_discount
            , details.details_unt_price
            , details.details_quantity
            , orders.orders_freight
            , orders.orders_date
            , orders.orders_shipped_date
            , orders.orders_required_date
            , orders.orders_ship_name
            , orders.orders_ship_address
            , orders.orders_ship_pcode
            , orders.orders_ship_city
            , orders.orders_ship_region
            , orders.orders_ship_country
        from details
        left join orders on
            details.details_order_id = orders.orders_id
    )

    , transformations as (
        select
            *
            , count(orders_freight) over (partition by orders_id) as freight_qnt_per_id
        from joined_orders_details
    )

select *
from transformations