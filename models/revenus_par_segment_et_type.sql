WITH trajets_clean AS (
  SELECT
    t.id_trajet,
    t.id_client,
    t.id_lieu,
    t.id_date,
    t.id_vehicule,
    t.id_chauffeur,
    t.montant_total,
    t.distance_km,
    t.duree_min,
  FROM `vtc-paris-440209.trajets_data.trajets_data` t
)
SELECT
  sc.id_segment,
  tv.id_type_vehicule,
  COUNT(tc.id_trajet) AS nombre_trajets,
  SUM(tc.montant_total) AS total_revenus
FROM trajets_clean tc
JOIN {{ ref('stg_clients') }} sc ON tc.id_client = sc.id_client
JOIN {{ ref('stg_vehicules') }} tv ON tc.id_vehicule = tv.id_vehicule
GROUP BY sc.id_segment, tv.id_type_vehicule
ORDER BY total_revenus DESC