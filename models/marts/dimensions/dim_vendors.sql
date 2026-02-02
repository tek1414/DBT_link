select
    distinct *
from {{ ref('stg_vendors') }}