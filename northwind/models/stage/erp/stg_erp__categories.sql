with
    source_categories as (
        select 
            cast(category_id as int) as category_id
            , cast(category_name as string) as category_name
            , cast(description as  string) as description_category
        from {{ source('erp', 'categories')}}
    )
select *
from source_categories