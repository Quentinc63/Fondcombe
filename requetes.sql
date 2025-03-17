-- Lister toutes les personnes séjournant à Fondcombe avec leurs informations de chambre.
SELECT * FROM personnes 
JOIN occupations ON personnes.id = occupations.utilisateur_id
JOIN chambres ON occupations.chambre_id = chambres.id

-- 	Trouver le nombre total de personnes pour chaque statut
SELECT COUNT(*) AS nombres_par_race , races.nom AS nom_race
FROM personnes 
JOIN races  ON personnes.idRace = races.id
GROUP BY races.nom 

--	Rechercher toutes les quêtes assignées à une personne spécifique.
SELECT *
FROM personnes 
JOIN aventuriers ON personnes.id = aventuriers.idPersonne
JOIN quetes ON aventuriers.idQuete = quetes.id
WHERE personnes.id = 4
-- placeholder pour la personne n4 (pcq il a plusieurs quetes)


--	Rechercher toutes les personnes assignées à une quête spécifique.
SELECT * 
FROM quetes
JOIN aventuriers ON quetes.id = aventuriers.idQuete
JOIN personnes ON aventuriers.idPersonne = personnes.id
WHERE quetes.id = 1 
-- placeholder pour la quete n1


--	Identifier la chambre disponible ayant la plus grande capacité à Fondcombe.
SELECT chambres.id, chambres.numero, chambres.etage, chambres.capacite
FROM chambres
LEFT JOIN occupations ON chambres.id = occupations.idChambre AND (occupations.dateFin IS NULL OR occupations.dateFin >= CURDATE())
WHERE occupations.idChambre IS NULL
ORDER BY chambres.capacite DESC
LIMIT 1;


SELECT * 
FROM quetes q
JOIN aventuriers a ON q.id = a.idQuete 
JOIN personnes p ON p.id = a.idPersonne
WHERE a.dateDebut > CURDATE()	