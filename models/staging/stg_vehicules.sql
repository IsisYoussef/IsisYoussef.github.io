SELECT
  id_vehicule,
  modele_vehicule,
  id_type_vehicule,
  immatriculation
FROM `vtc-paris-440209.trajets_data.vehicules`
WHERE immatriculation IS NOT NULL