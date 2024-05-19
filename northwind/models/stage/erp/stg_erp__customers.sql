with
    source_customer as (
        select 
            cast(customer_id as string) as customer_id
            , cast(contact_name as string) as customer_conname
            , cast(company_name as string) as customer_comname
            , cast(address as string) as customer_address
            , cast(postal_code as string) as customer_pcode
            , cast(city as string) as customer_city
            , cast(region as string) as customer_region
            , cast(country as string) as customer_country
        from {{ source('erp', 'customers')}}
    )
select *
from source_customer