-- Créer une vue pour lister toutes les personnes avec leurs informations de chambre
CREATE VIEW personnes_chambres AS (
    SELECT p.nom, p.prenom, p.dateNaissance, 
    o.dateDebut AS debut_sejour, o.dateFin AS fin_sejour, 
    c.numero AS numero_chambre, c.etage, c.capacite, 
    r.adjectif AS type_chambre
    FROM personnes p
    LEFT JOIN occupations o ON o.idPersonne =  p.id
    LEFT JOIN chambres c ON  o.idChambre = c.id
    LEFT JOIN races r ON r.id = c.idRaceStyle
);

SELECT * FROM informations_clients;  


-- Créer une vue pour lister les quêtes à venir et leurs participants
CREATE VIEW infos_quetes AS
SELECT * 
FROM personnes p 
JOIN aventuriers a ON p.id = a.idPersonne
AND  dateDebut > CURDATE()

SELECT * FROM  infos_quetes 


-- Créer un trigger qui empêche l'insertion d'un séjour avec une date de départ antérieure à sa date d'arrivée
DELIMITER //

CREATE TRIGGER date_trigger
BEFORE INSERT ON occupations
FOR EACH ROW
BEGIN
    IF NEW.dateFin <= NEW.dateDebut THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'pas de chance';
    END IF;
END//

DELIMITER ;


INSERT INTO occupations (idChambre, idPersonne, dateDebut, dateFin) VALUES
(5, 6, '3018-10-25', '3018-10-20')


-- Créer une procédure qui liste les personnes sans quête entre deux dates données
DELIMITER //
CREATE PROCEDURE get_user_without_quest(
    IN in_dateDebut DATE, 
    IN in_dateFin DATE
)
BEGIN
    SELECT p.*
    FROM personnes p
    LEFT JOIN aventuriers a 
        ON p.id = a.idPersonne
        AND a.dateDebut < in_dateDebut 
        AND a.dateFin > in_dateFin
    WHERE a.idPersonne IS NULL;
END //
DELIMITER ;

CALL get_user_without_quest('3018-10-25', '3019-02-26');



