BEGIN;

USE hb_sql_exo_fondcombe;

-- Insertion des rôles
INSERT INTO roles (intitule) VALUES
('Héros'),
('Magicien'),
('Guerrier'),
('Archer'),
('Roi'),
('Seigneur'),
('Paysan'),
('Cavalier'),
('Espion'),
('Garde');

-- Insertion des régions
INSERT INTO regions (nom, statut) VALUES
('Gondor', TRUE),
('Rohan', TRUE),
('La Comté', TRUE),
('Fondcombe', TRUE),
('Lothlorien', TRUE),
('Mordor', FALSE),
('Isengard', FALSE),
('Moria', FALSE),
('Rhûn', FALSE),
('Harad', FALSE);

-- Insertion des quêtes
INSERT INTO quetes (titre, description, idRegion) VALUES
('Destruction de l''Anneau Unique', 'Transporter l''Anneau Unique jusqu''à la Montagne du Destin et le détruire.', 6),
('Défense du Gouffre de Helm', 'Défendre la forteresse du Gouffre de Helm contre l''armée de Saroumane.', 2),
('Bataille des Champs du Pelennor', 'Défendre Minas Tirith contre les forces de Sauron.', 1),
('Libération de la Moria', 'Reprendre le contrôle de la Moria des mains des orques et du Balrog.', 8),
('Traversée des Marais des Morts', 'Traverser les Marais des Morts pour éviter les routes principales surveillées par l''ennemi.', 6),
('Conseil d''Elrond', 'Participer au conseil d''Elrond et décider du sort de l''Anneau Unique.', 4),
('Embuscade à Amon Hen', 'Échapper à l''embuscade des Uruk-hai à Amon Hen.', 1),
('Guérison de Théoden', 'Libérer Théoden de l''emprise de Saroumane.', 2),
('Négociations avec les Ents', 'Convaincre les Ents de se joindre à la guerre contre Saroumane.', 7),
('Bataille de la Porte Noire', 'Distraire l''Œil de Sauron pour permettre à Frodon d''atteindre la Montagne du Destin.', 6);

-- Insertion des races
INSERT INTO races (nom, adjectif) VALUES
('Humain', 'Humain'),
('Elfe', 'Elfique'),
('Nain', 'Nanique'),
('Hobbit', 'Hobbitesque'),
('Orque', 'Orque'),
('Uruk-hai', 'Urukhaïenne'),
('Ent', 'Entesque'),
('Troll', 'Trollesque'),
('Gobelin', 'Gobeline'),
('Istari', 'Istari');

-- Insertion des chambres
INSERT INTO chambres (capacite, numero, etage, idRaceStyle) VALUES
(4, 101, 1, 1), 
(2, 102, 1, 2), 
(3, 103, 1, 3), 
(4, 104, 1, 4), 
(6, 201, 2, 1), 
(1, 202, 2, 2), 
(2, 203, 2, 3), 
(5, 204, 2, 4), 
(2, 301, 3, 2), 
(2, 302, 3, 10); 

-- Insertion des personnes
INSERT INTO personnes (nom, prenom, dateNaissance, idRole, idRace, idRegion) VALUES
('Sacquet', 'Frodon', '2968-09-22', 1, 4, 3),
('Gamegie', 'Samsagace', '2980-04-06', 1, 4, 3),
('Le Gris', 'Gandalf', '0001-01-01', 2, 10, 4),
('Vertefeuille', 'Legolas', '1000-06-14', 4, 2, 4),
('Fils de Glóin', 'Gimli', '2879-03-17', 3, 3, 8),
('Fils d''Arathorn', 'Aragorn', '2931-03-01', 5, 1, 1),
('Fils de Denethor', 'Boromir', '2978-07-12', 3, 1, 1),
('Brandebouc', 'Meriadoc', '2982-08-15', 1, 4, 3),
('Touque', 'Peregrin', '2990-11-28', 1, 4, 3),
('Fils de Thranduil', 'Thranduil', '0500-02-22', 5, 2, 4);

-- Insertion des occupations
INSERT INTO occupations (idChambre, idPersonne, dateDebut, dateFin) VALUES
(8, 1, '3018-10-20', '3018-10-25'), 
(8, 2, '3018-10-20', '3018-10-25'), 
(8, 8, '3018-10-20', '3018-10-25'), 
(8, 9, '3018-10-20', '3018-10-25'), 
(10, 3, '3018-10-20', '3018-10-27'), 
(2, 4, '3018-10-22', '3018-10-27'), 
(3, 5, '3018-10-22', '3018-10-27');

-- Insertion des aventuriers
INSERT INTO aventuriers (idPersonne, idQuete, dateDebut, dateFin) VALUES
(1, 1, '3018-10-25', '3019-03-25'),
(2, 1, '3018-10-25', '3019-03-25'),
(3, 1, '3018-10-25', '3019-03-25'),
(4, 1, '3018-10-25', '3019-02-26'),
(5, 1, '3018-10-25', '3019-02-26'),
(6, 1, '3018-10-25', '3019-02-26'),
(7, 1, '3018-10-25', '3019-02-26'),
(8, 1, '3018-10-25', '3019-02-26'),
(9, 1, '3018-10-25', '3019-02-26'),
(6, 2, '3019-03-03', '3019-03-04'),
(4, 2, '3019-03-03', '3019-03-04'),
(5, 2, '3019-03-03', '3019-03-04');

COMMIT;
