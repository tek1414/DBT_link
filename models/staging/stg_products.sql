-- Modèle staging pour les produits
-- Nettoyage léger : garder uniquement les colonnes nécessaires
select
    product_id,
    product_name,
    model_name,
    price
from {{ source('raw', 'products') }}