-- Modèle staging pour les clients
-- Concaténation prénom + nom
select
    customer_id,
    "FirstName" || ' ' || "LastName" as customer_name
from {{ source('raw', 'customers') }}