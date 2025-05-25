-- Check if any values in both staging values are not in range

select price
from {{ ref('high_cost_houses') }}
where price not between 15000000 and (
    select max(price)
    from {{ ref('high_cost_houses') }}
)