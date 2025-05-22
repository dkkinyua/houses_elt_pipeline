select *
from {{ source('h_data', 'house_for_sale') }}
where price between 500000 and 10000000
order by price desc