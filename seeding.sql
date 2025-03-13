-- Script de seeding pour la base de données du Seigneur des Anneaux
BEGIN;

-- Insertion des rôles
INSERT INTO roles (nom) VALUES
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
INSERT INTO quetes (titre, description, region_id) VALUES
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
INSERT INTO chambres (capacite_chambre, numero_chambre, etage_chambre, race_id) VALUES
(4, 101, 1, 1), -- Chambre humaine
(2, 102, 1, 2), -- Chambre elfique
(3, 103, 1, 3), -- Chambre naine
(4, 104, 1, 4), -- Chambre hobbit
(6, 201, 2, 1), -- Grande chambre humaine
(1, 202, 2, 2), -- Chambre elfique individuelle
(2, 203, 2, 3), -- Chambre naine double
(5, 204, 2, 4), -- Grande chambre hobbit
(2, 301, 3, 2), -- Chambre elfique VIP
(2, 302, 3, 10); -- Chambre pour Istari

-- Insertion des personnes
INSERT INTO personnes (nom, prenom, date_naissance, role_id) VALUES
('Sacquet', 'Frodon', '2968-09-22', 1),
('Gamegie', 'Samsagace', '2980-04-06', 1),
('Le Gris', 'Gandalf', '0001-01-01', 2),
('Vertefeuille', 'Legolas', '1000-06-14', 4),
('Fils de Glóin', 'Gimli', '2879-03-17', 3),
('Fils d''Arathorn', 'Aragorn', '2931-03-01', 5),
('Fils de Denethor', 'Boromir', '2978-07-12', 3),
('Brandebouc', 'Meriadoc', '2982-08-15', 1),
('Touque', 'Peregrin', '2990-11-28', 1),
('Fils de Thranduil', 'Thranduil', '0500-02-22', 5),
('Le Blanc', 'Saroumane', '0001-01-02', 2),
('Éomundsson', 'Éomer', '2991-03-04', 8),
('Fils de Thengel', 'Théoden', '2948-04-16', 5),
('Éomundsdotter', 'Éowyn', '2995-05-21', 3),
('Sacquet', 'Bilbon', '2890-09-22', 1);

-- Insertion des occupations
INSERT INTO occupations (chambre_id, utilisateur_id, date_debut, date_fin) VALUES
(8, 1, '3018-10-20', '3018-10-25'), -- Frodon dans la grande chambre hobbit
(8, 2, '3018-10-20', '3018-10-25'), -- Sam dans la même chambre
(8, 8, '3018-10-20', '3018-10-25'), -- Merry dans la même chambre
(8, 9, '3018-10-20', '3018-10-25'), -- Pippin dans la même chambre
(10, 3, '3018-10-20', '3018-10-27'), -- Gandalf dans la chambre Istari
(2, 4, '3018-10-22', '3018-10-27'), -- Legolas dans la chambre elfique
(3, 5, '3018-10-22', '3018-10-27'), -- Gimli dans la chambre naine
(1, 6, '3018-10-22', '3018-10-27'), -- Aragorn dans la chambre humaine
(1, 7, '3018-10-22', '3018-10-27'), -- Boromir dans la même chambre humaine
(5, 13, '3018-12-01', '3019-03-15'), -- Théoden dans la grande chambre humaine
(5, 12, '3018-12-01', '3019-03-15'), -- Éomer dans la même chambre
(5, 14, '3018-12-01', '3019-03-15'); -- Éowyn dans la même chambre

-- Insertion des personnes_quetes
INSERT INTO personnes_quetes (personne_id, quete_id, date_debut, date_fin) VALUES
(1, 1, '3018-10-25', '3019-03-25'), -- Frodon dans la quête de l'Anneau
(2, 1, '3018-10-25', '3019-03-25'), -- Sam dans la quête de l'Anneau
(3, 1, '3018-10-25', '3019-03-25'), -- Gandalf dans la quête de l'Anneau
(4, 1, '3018-10-25', '3019-02-26'), -- Legolas dans la quête de l'Anneau
(5, 1, '3018-10-25', '3019-02-26'), -- Gimli dans la quête de l'Anneau
(6, 1, '3018-10-25', '3019-02-26'), -- Aragorn dans la quête de l'Anneau
(7, 1, '3018-10-25', '3019-02-26'), -- Boromir dans la quête de l'Anneau
(8, 1, '3018-10-25', '3019-02-26'), -- Merry dans la quête de l'Anneau
(9, 1, '3018-10-25', '3019-02-26'), -- Pippin dans la quête de l'Anneau
(6, 2, '3019-03-03', '3019-03-04'), -- Aragorn dans la défense du Gouffre de Helm
(4, 2, '3019-03-03', '3019-03-04'), -- Legolas dans la défense du Gouffre de Helm
(5, 2, '3019-03-03', '3019-03-04'), -- Gimli dans la défense du Gouffre de Helm
(13, 2, '3019-03-03', '3019-03-04'), -- Théoden dans la défense du Gouffre de Helm
(12, 2, '3019-03-03', '3019-03-04'), -- Éomer dans la défense du Gouffre de Helm
(6, 3, '3019-03-15', '3019-03-16'), -- Aragorn dans la bataille des Champs du Pelennor
(4, 3, '3019-03-15', '3019-03-16'), -- Legolas dans la bataille des Champs du Pelennor
(5, 3, '3019-03-15', '3019-03-16'), -- Gimli dans la bataille des Champs du Pelennor
(12, 3, '3019-03-15', '3019-03-16'), -- Éomer dans la bataille des Champs du Pelennor
(14, 3, '3019-03-15', '3019-03-16'); -- Éowyn dans la bataille des Champs du Pelennor

COMMIT;