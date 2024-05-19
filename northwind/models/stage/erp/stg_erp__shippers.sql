with
    source_shippers as (
        select 
            cast(shipper_id as int) as shipper_id
            ,cast(company_name as string) as shippers_name
        from {{ source('erp', 'shippers')}}
    )
select *
from source_shippers