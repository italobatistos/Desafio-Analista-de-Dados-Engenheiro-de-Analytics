with
    source_suppliers as (
        select 
            cast(supplier_id as int) as supplier_id
            , cast(contact_name as string) as supplier_conname
            , cast(company_name as string) as supplier_comname
            , cast(address as string) as supplier_address
            , cast(postal_code as string) as supplier_pcode
            , cast(city as string) as supplier_city
            , cast(region as string) as supplier_region
            , cast(country as string) as supplier_country
        from {{ source('erp', 'suppliers')}}
    )
select *
from source_suppliers