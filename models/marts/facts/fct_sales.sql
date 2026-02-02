-- Modèle fait : Table de faits des ventes (fct_sales)
with orders_grouped as (
    select
        order_date,
        customer_id,
        product_id,
        vendor_id,
        sum(order_qty) as order_qty
    from {{ ref('stg_orders') }}
    group by 1, 2, 3, 4
),
products as (
    select product_id, price
    from {{ ref('stg_products') }}
    group by 1, 2
),
dates as (
    select date from {{ ref('dim_dates') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['o.order_date', 'o.customer_id', 'o.product_id', 'o.vendor_id']) }} as sales_key,
    o.order_date,
    o.customer_id,
    o.product_id,
    o.vendor_id,
    o.order_qty,
    p.price,
    (o.order_qty * p.price) as amount
from orders_grouped o
inner join products p on o.product_id = p.product_id
inner join dates d on o.order_date = d.date