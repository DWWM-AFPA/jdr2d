-- tbale de niveau 0

CREATE TABLE compte_utilisateur(
    id_compte_utilisateur SERIAL,
    pseudo_compte VARCHAR(255) UNIQUE NOT NULL,
    courriel_compte VARCHAR(255) UNIQUE NOT NULL,
    mdp_compte VARCHAR(255) NOT NULL,
    valide VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_compte_utilisateur)
);

CREATE TABLE race(
    id_race SERIAL,
    nom_race VARCHAR(255) UNIQUE NOT NULL,
    description_race text,
    jouable boolean NOT NULL,
    PRIMARY KEY(id_race)
);

CREATE TABLE classe(
    id_classe SERIAL,
    nom_classe VARCHAR(255) UNIQUE NOT NULL,
    description_classe text,
    jouable boolean NOT NULL,
    PRIMARY KEY(id_classe)
);

