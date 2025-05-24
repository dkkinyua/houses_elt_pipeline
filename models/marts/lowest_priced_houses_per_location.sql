-- Lowest priced houses per location
with lowest_priced as (
    select name, location, price, description
    from {{ ref('high_cost_houses') }}

    union all

    select name, location, price, location
    from {{ ref('low_cost_houses') }}
),

low_ranked as (
    select *, ROW_NUMBER() over (partition by location order by price desc) as rank
    from lowest_priced
)

select name, description, price as min_price
from low_ranked
where rank = 1
order by price asc