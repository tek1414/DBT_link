with dates as (
    select distinct order_date as date
    from {{ ref('stg_orders') }}
)
select
    date,
    extract(year from date)::varchar as year,
    extract(month from date)::varchar as month,
    extract(day from date)::varchar as day,
    trim(to_char(date, 'Day')) as day_name,
    extract(quarter from date) as quarter
from dates
order by date