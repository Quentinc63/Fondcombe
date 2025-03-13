SELECT * FROM personnes 
JOIN occupations ON personnes.id = occupations.utilisateur_id
JOIN chambres ON occupations.chambre_id = chambres.id

