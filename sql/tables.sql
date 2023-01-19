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

CREATE TABLE position 
(id_personnage integer,
position point,
id_lieu integer,
FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu), FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage));

INSERT into position VALUES (2,(point(20,15)),1);