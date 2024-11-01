SELECT
  sc.nom_segment,
  tv.nom_type_vehicule,
  COUNT(t.id_trajet) AS nombre_trajets,
  SUM(t.montant_total) AS total_revenus
FROM `vtc-paris-440209.trajets_data.trajets_data` t
JOIN `vtc-paris-440209.trajets_data.clients` c ON t.id_client = c.id_client
JOIN `vtc-paris-440209.trajets_data.segments_clients` sc ON c.id_segment = sc.id_segment
JOIN `vtc-paris-440209.trajets_data.vehicules` v ON t.id_vehicule = v.id_vehicule
JOIN `vtc-paris-440209.trajets_data.types_vehicule` tv ON v.id_type_vehicule = tv.id_type_vehicule
GROUP BY sc.nom_segment, tv.nom_type_vehicule
ORDER BY total_revenus DESC