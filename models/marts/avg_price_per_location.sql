-- Calculates the average price per location

-- get avg prices from both tables, so I need UNION ALL both views to keep duplicates (if there are), then GROUP BY on LOCATION.
with combined_houses as (
    SELECT location, price
    FROM {{ ref('high_cost_houses') }}

    UNION ALL

    SELECT location, price
    FROM {{ ref('low_cost_houses') }}
)

SELECT location, AVG(price) as avg_price
FROM combined_houses
GROUP BY location
ORDER BY avg_price desc
