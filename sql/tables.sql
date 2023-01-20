CREATE TABLE type_objet(
    id_type_objet COUNTER PRIMARY KEY,
    nom_type_objet VARCHAR(255) NOT NULL UNIQUE,
    emplacement_objet VARCHAR(255) NOT NULL ,
    poids_objet VARCHAR(255) NOT NULL
);

CREATE TABLE type_aptitude(
    id_type_aptitude COUNTER PRIMARY KEY,
    nom_type_aptitude VARCHAR(255) NOT NULL UNIQUE,

);

CREATE TABLE race(
    id_race COUNTER PRIMARY KEY,
    nom_race VARCHAR(255) UNIQUE NOT NULL,
    description_race BLOB,
    jouable BOOLEAN,
);

CREATE TABLE classe()
    id_classe COUNTER PRIMARY KEY,
    nom_classe NOT NULL UNIQUE,
    description_classe BLOB,
    jouable BOOLEAN,
);

CREATE TABLE etat_personnage
(id_etat_personnage COUNTER PRIMARY KEY,
);

DROP TABLE position;


ALTER TABLE personnage ADD COLUMN position point;
--remplir postion puis
ALTER TABLE personnage ADD CONSTRAINT position NOT NULL

ALTER TABLE objet ADD COLUMN position point;
--remplir postion puis
ALTER TABLE objet ADD CONSTRAINT position NOT NULL
ALTER TABLE objet ADD COLUMN id_lieu integer;
ALTER TABLE objet ADD CONSTRAINT objet_id_lieu_fkey FOREIGN KEY (id_lieu) REFERENCES lieu(id_lieu);


ALTER TABLE objet ADD CONSTRAINT objet_id_personnage_fkey FOREIGN KEY (id_personnage) REFERENCES personnage(id_personnage);

ALTER TABLE objet ADD CONSTRAINT valid_location
    CHECK (
        (id_lieu IS NULL AND position IS NULL AND id_personnage IS NOT NULL)
        OR
        (id_lieu IS NOT NULL AND position IS NOT NULL AND id_personnage IS NULL)
    );