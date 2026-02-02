select
    distinct *
from {{ ref('stg_products') }}