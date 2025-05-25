-- Average price per housing capacity

select
    case
        when description ilike '%2 bedroom%' then '2 Bdrm'
        when description ilike '%3 bedroom%' then '3 Bdrm'
        when description ilike '%4 bedroom%' then '4 Bdrm'
        when description ilike '%5 bedroom%' then '5 Bdrm'
        when description ilike '%6 bedroom%' then '6 Bdrm'
        when description ilike '%7 bedroom%' then '7 Bdrm'
        else description
    end as house_capacity,
    count(id) as house_count,
    avg(price) as avg_price_per_capacity
from
    {{ source('h_data', 'house_for_sale') }}
group by house_capacity
order by avg_price_per_capacity desc