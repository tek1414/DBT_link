select
product_id,
product_name,
model_name,
price
from {{ source('raw', 'products') }}