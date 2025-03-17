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

--	Lister toutes les quêtes à venir et les personnes y participant.
SELECT * 
FROM quetes q
JOIN aventuriers a ON q.id = a.idQuete 
JOIN personnes p ON p.id = a.idPersonne
WHERE a.dateDebut > CURDATE()	


-- Rechercher le nombre de personnes dans chaque type de chambre
SELECT COUNT(*) AS nombre_personne ,r.nom FROM occupations o 
JOIN  chambres c ON c.id = o.idChambre
JOIN races r ON c.idRaceStyle = r.id
GROUP BY r.nom

-- Trouver la personne séjournant le plus longtemps à Fondcombe.
SELECT p.nom, p.prenom, o.dateDebut, o.dateFin, 
       DATEDIFF(o.dateFin, o.dateDebut) AS duree_sejour
FROM personnes p
JOIN occupations o ON p.id = o.idPersonne
WHERE o.dateFin IS NOT NULL
ORDER BY duree_sejour DESC
LIMIT 1;

-- Lister toutes les personnes qui participent à plus de 2 quêtes.
SELECT p.nom, p.prenom, COUNT(*) AS "nombre de quetes"
FROM aventuriers a
JOIN personnes p ON a.idPersonne = p.id
GROUP BY idPersonne
HAVING COUNT(*) > 2
