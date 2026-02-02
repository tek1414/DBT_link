-- Modèle staging pour les commandes
select
    customer_id,
    product_id,
    vendor_id,
    o."OrderDate"::date as order_date,
    o."OrderQty"::int as order_qty
from {{ source('raw', 'orders') }} as o