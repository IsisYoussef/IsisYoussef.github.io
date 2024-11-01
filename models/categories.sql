{{ config(materialized='table') }}

WITH unique_categories AS (
    SELECT DISTINCT categorie_produit
    FROM {{ ref('produits') }}
)

SELECT 
    ROW_NUMBER() OVER (ORDER BY categorie_produit) AS id_categorie,
    categorie_produit
FROM unique_categories