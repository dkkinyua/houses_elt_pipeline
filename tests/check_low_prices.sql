select price
from {{ ref('low_cost_houses') }}
where price not between (
    select min(price)
    from {{ ref('low_cost_prices') }}
) and 15000000