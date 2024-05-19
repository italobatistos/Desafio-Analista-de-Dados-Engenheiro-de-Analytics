with
    source_orders as (
        select 
            cast(order_id	as int) as orders_id
            , cast(employee_id	as int) as orders_employee_id
            , cast(customer_id	as string) as orders_customer_id
            , cast(ship_via	as int) as orders_ship_via
            , cast(order_date as date) as orders_date
            , cast(freight as numeric) as orders_freight
            , cast(ship_name as string) as orders_ship_name
            , cast(ship_address	as string) as orders_ship_address
            , cast(ship_postal_code	as string) as orders_ship_pcode
            , cast(ship_city as string) as orders_ship_city
            , cast(ship_region as string) as orders_ship_region
            , cast(ship_country as string) as orders_ship_country
            , cast(shipped_date	as date) as orders_shipped_date
            , cast(required_date as date) as orders_required_date
        from {{ source('erp', 'orders')}}
    )
    
select *
from source_orders