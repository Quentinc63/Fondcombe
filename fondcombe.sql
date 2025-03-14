BEGIN;

CREATE DATABASE IF NOT EXISTS hb_sql_exo_fondcombe;
USE hb_sql_exo_fondcombe;

DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    intitule VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS regions;
CREATE TABLE regions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    statut BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS quetes;
CREATE TABLE quetes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    idRegion INT NOT NULL REFERENCES regions(id)
);

DROP TABLE IF EXISTS races;
CREATE TABLE races (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    adjectif VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS chambres;
CREATE TABLE chambres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    etage INT NOT NULL,
    capacite INT NOT NULL,
    idRaceStyle INT NOT NULL REFERENCES races(id)
);

DROP TABLE IF EXISTS personnes;
CREATE TABLE personnes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    dateNaissance DATE NOT NULL,
    idRole INT NOT NULL REFERENCES roles(id),
    idRace INT NOT NULL REFERENCES races(id),
    idRegion INT NOT NULL REFERENCES regions(id)
);

DROP TABLE IF EXISTS occupations;
CREATE TABLE occupations (
    idChambre INT NOT NULL REFERENCES chambres(id),
    idPersonne INT NOT NULL REFERENCES personnes(id),
    PRIMARY KEY (idChambre, idPersonne),
    dateDebut DATE NOT NULL,
    dateFin DATE
);

DROP TABLE IF EXISTS aventuriers;
CREATE TABLE aventuriers (
    idPersonne INT NOT NULL REFERENCES personnes(id),
    idQuete INT NOT NULL REFERENCES quetes(id),
    PRIMARY KEY (idQuete, idPersonne),
    dateDebut DATE NOT NULL,
    dateFin DATE
);

COMMIT;
