with
    employees as (
        select *
        from {{ref('stg_erp__employees')}}
    )

    , self_join_manage as (
        select
            employees.employee_id
            , employees.employee_manage_id
            , employees.employee_full_name
            , managers.employee_full_name as manage_name
            , employees.employee_birth_date
            , employees.employee_hire_date
            , employees.employee_address
            , employees.employee_city
            , employees.employee_region
            , employees.employee_postal_code
            , employees.employee_country
        from employees
        left join employees as managers on
            employees.employee_manage_id = managers.employee_manage_id
    )

    , transformations as (
        select
            row_number() over (order by employee_id) as sk_employees
            , *
        from self_join_manage
    )

    select *
    from transformations