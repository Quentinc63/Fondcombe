SELECT * FROM personnes 
JOIN occupations ON personnes.id = occupations.utilisateur_id
JOIN chambres ON occupations.chambre_id = chambres.id

SELECT COUNT(*) AS nombres_par_race , races.nom AS nom_race
FROM personnes 
JOIN races  ON personnes.idRace = races.id
GROUP BY races.nom 


SELECT *
FROM personnes 
JOIN aventuriers ON personnes.id = aventuriers.idPersonne
JOIN quetes ON aventuriers.idQuete = quetes.id
WHERE personnes.id = 4
-- placeholder pour la personne n4 (pcq il a plusieurs quetes)

SELECT * 
FROM quetes
JOIN aventuriers ON quetes.id = aventuriers.idQuete
JOIN personnes ON aventuriers.idPersonne = personnes.id
WHERE quetes.id = 1 
-- placeholder pour la quete n1


SELECT chambres.id, chambres.numero, chambres.etage, chambres.capacite
FROM chambres
LEFT JOIN occupations ON chambres.id = occupations.idChambre AND (occupations.dateFin IS NULL OR occupations.dateFin >= CURDATE())
WHERE occupations.idChambre IS NULL
ORDER BY chambres.capacite DESC
LIMIT 1;

