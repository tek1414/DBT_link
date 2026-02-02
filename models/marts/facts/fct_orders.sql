with orders as (
    select * from {{ ref('stg_orders') }}
),
products as (
    select * from {{ ref('stg_products') }}
)
select
    -- Clé unique pour Power BI
    {{ dbt_utils.generate_surrogate_key(['o.order_date', 'o.customer_id', 'o.product_id']) }} as sales_key,
    o.order_date,
    o.customer_id,
    o.product_id,
    o.order_qty,
    p.price,
    (o.order_qty * p.price) as amount
from orders o
join products p on o.product_id = p.product_id