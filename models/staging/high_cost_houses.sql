select * 
from {{ source('h_data', 'house_for_sale') }}
where price between 15000000 and (
    select max(price)
    from {{ source('h_data', 'house_for_sale') }}
)
order by price desc