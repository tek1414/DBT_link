select
    distinct *
from {{ ref('stg_customers') }}