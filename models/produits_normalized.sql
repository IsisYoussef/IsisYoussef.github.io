{{ config(materialized='table') }}

SELECT
    p.id_produit,
    p.nom_produit,
    p.prix,
    c.id_categorie
FROM 
    {{ ref('produits') }} AS p
JOIN 
    {{ ref('categories') }} AS c
ON 
    p.categorie_produit = c.categorie_produit