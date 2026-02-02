-- Modèle staging pour les vendeurs
select
    vendor_id,
    vendor_name
from {{ source('raw', 'vendors') }}