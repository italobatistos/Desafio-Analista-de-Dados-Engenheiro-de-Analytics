with
    customer as (
        select *
        from {{ ref('dim_customer') }}
    )

    , employees as (
        select *
        from {{ ref('dim_employees') }}
    )

    , products as (
        select *
        from {{ ref('dim_products') }}
    )

    , shippers as (
        select *
        from {{ ref('dim_shippers') }}
    )

    , sales_orders as (
        select *
        from {{ ref('int_sales__orders') }}
    )

    , joined_tables as (
        select
            sales_orders.orders_id
            , customer.sk_customer as fk_customers
            , employees.sk_employees as fk_employees
            , products.sk_products as fk_products
            , sales_orders.orders_ship_via
            , sales_orders.details_discount
            , sales_orders.details_unt_price
            , sales_orders.details_quantity
            , sales_orders.orders_freight
            , sales_orders.freight_qnt_per_id
            , sales_orders.orders_date
            , sales_orders.orders_shipped_date
            , sales_orders.orders_required_date
            , shippers.shippers_name
            , sales_orders.orders_ship_name
            , sales_orders.orders_ship_address
            , sales_orders.orders_ship_pcode
            , sales_orders.orders_ship_city
            , sales_orders.orders_ship_region
            , sales_orders.orders_ship_country
            , customer.customer_conname
            , employees.employee_full_name
            , employees.manage_name
            , products.product_name
            , products.category_name
            , products.supplier_conname
            , products.is_discontinued 
        from sales_orders
        left join customer on
            sales_orders.orders_customer_id = customer.customer_id
        left join employees on
            sales_orders.orders_employee_id = employees.sk_employees
        left join products on
            sales_orders.details_product_id = products.sk_products
        left join shippers on
            sales_orders.orders_ship_via = shippers.sk_shippers
    )

    , transformations as (
        select
            {{ dbt_utils.generate_surrogate_key(['orders_id', 'fk_products' ]) }} as sk_sales
            , *
            , details_unt_price * details_quantity as sales_total
            , (1 - details_discount) * details_unt_price * details_quantity as sales_liquid
            , (orders_freight/freight_qnt_per_id) as orders_freight_partition
            , case 
                when details_discount > 0 then true
                when details_discount = 0 then false
                else false
                end as is_discount
        from joined_tables
    )

select *
from transformations