select *
from {{ source('h_data', 'house_for_sale') }}
where price >= 50000000
order by price desc