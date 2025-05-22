select *
from {{ source('h_data', 'house_for_sale') }}
where price between 10000000 and 50000000
order by price desc