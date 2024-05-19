with
    source_employees as (
        select 
            cast(employee_id as int) as employee_id
            , cast(reports_to as int) as employee_manage_id
            , cast((first_name || " " || last_name) as  string) as employee_full_name 
            , cast(birth_date as string) as employee_birth_date
            , cast(hire_date as string) as employee_hire_date
            , cast(address	as string) as employee_address
            , cast(city	as string) as employee_city
            , cast(region as string) as employee_region
            , cast(postal_code	as string) as employee_postal_code
            , cast(country	as string) as employee_country
        from {{ source('erp', 'employees')}}
    )
select *
from source_employees