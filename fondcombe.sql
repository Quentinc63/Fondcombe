BEGIN; 

CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE regions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    statut BOOLEAN NOT NULL
);

CREATE TABLE quetes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    region_id INT NOT NULL REFERENCES regions(id)
);

CREATE TABLE races (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    adjectif VARCHAR(100) NOT NULL
);

CREATE TABLE chambres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    capacite_chambre INT NOT NULL,
    numero_chambre INT NOT NULL,
    etage_chambre INT NOT NULL,
    race_id INT NOT NULL REFERENCES races(id)
);

CREATE TABLE personnes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    date_naissance DATE NOT NULL,
    role_id INT NOT NULL REFERENCES roles(id)
);

CREATE TABLE occupations (
    chambre_id INT NOT NULL REFERENCES chambres(id),
    utilisateur_id INT NOT NULL REFERENCES personnes(id),
    date_debut DATE NOT NULL,
    date_fin DATE
);

CREATE TABLE personnes_quetes (
    personne_id INT NOT NULL REFERENCES personnes(id),
    quete_id INT NOT NULL REFERENCES quetes(id),
    date_debut DATE NOT NULL,
    date_fin DATE
);

COMMIT;
