-- Average house price per capacity
select
    case
        when location ilike '%karen%' then 'Karen'
        when location ilike '%runda%' then 'Runda'
        when location ilike '%westlands%' then 'Westlands'
        when location ilike '%muthaiga%' then 'Muthaiga'
        when location ilike '%garden estate%' then 'Garden Estate'
        when location ilike '%kilimani%' then 'Kilimani'
        when location ilike '%kitusuru%' then 'Kitusuru'
        when location ilike '%athi river%' then 'Athi River'
        when location ilike '%lavington%' then 'Lavington'
        when location ilike '%nyali%' then 'Nyali'
        when location ilike '%thika road%' then 'Thika Rd'
        when location ilike '%kitengela%' then 'Kitengela'
        when location ilike '%mombasa%' then 'Mombasa'
        when location ilike '%malindi%' then 'Malindi'
        when location ilike '%kisumu%' then 'Kisumu'
        when location ilike '%kikuyu%' then 'Kikuyu'
        else location
    end as formatted_location,
    count(id) as house_count,
    avg(price) as avg_price
from 
    {{ source('h_data', 'house_for_sale') }}
group by formatted_location
order by avg_price desc