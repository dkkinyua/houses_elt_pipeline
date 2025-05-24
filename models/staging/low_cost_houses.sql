select *
from {{ source('h_data', 'house_for_sale') }}
where price between (
    select min(price)
    from {{ source('h_data', 'house_for_sale') }}
) and 15000000
order by price desc