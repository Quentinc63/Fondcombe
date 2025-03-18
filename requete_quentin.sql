--view CLIENT + chambre
CREATE VIEW informations_clients AS	
SELECT p.nom, p.prenom, p.dateNaissance, o.dateDebut AS debut_sejour, o.dateFin AS fin_sejour, c.numero AS numero_chambre, c.etage, c.capacite, r.adjectif AS type_chambre
FROM personnes p
JOIN occupations o ON o.idPersonne =  p.id
JOIN chambres c ON  o.idChambre = c.id
JOIN races r ON r.id = c.idRaceStyle

SELECT * FROM informations_clients;  


--View quete

CREATE VIEWfos_quetes AS
SELECT * 
FROM personnes p 
JOIN aventuriers a ON p.id = a.idPersonne
AND  dateDebut > CURDATE()

SELECT * FROM  infos_quetes 


--trigger

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

--Procedure

