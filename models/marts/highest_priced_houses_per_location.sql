-- Highest priced houses per location

with highest_priced as (
    select name, location, description, price
    from {{ ref('high_cost_houses') }}

    union all

    select name, location, description, price
    from {{ ref('low_cost_houses') }}
),

ranked_houses as (
    select *, ROW_NUMBER() over (partition by location order by price desc) as rank
    from highest_priced
)

select name, location, description, price as max_price
from ranked_houses
where rank = 1
order by max_price desc