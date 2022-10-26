--Tables indépendantes niveau 0
CREATE TABLE compte_utilisateur (
    id_compte_utilisateur SERIAL PRIMARY KEY,
    pseudo_compte VARCHAR(255) NOT NULL UNIQUE,
    mdp_compte VARCHAR(255) NOT NULL,
    courriel_compte VARCHAR(255) NOT NULL UNIQUE,
    valide_compte BOOLEAN NOT NULL DEFAULT 'f'
);

CREATE TABLE type_aptitude (
    type_aptitude SERIAL PRIMARY KEY,
    nom_type_aptitude VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE classe (
    id_classe SERIAL PRIMARY KEY,
    nom_classe VARCHAR(255) NOT NULL UNIQUE,
    description_classe TEXT NULL,
    jouable_classe BOOLEAN NOT NULL
);

CREATE TABLE race (
    id_race SERIAL PRIMARY KEY,
    nom_race VARCHAR(255) NOT NULL UNIQUE,
    description_race TEXT NULL,
    jouable_race BOOLEAN NOT NULL
);

CREATE TABLE caracteristique (
    id_caracteristique SERIAL PRIMARY KEY,
    nom_caracteristique VARCHAR(255) NOT NULL,
    description_caracteristique TEXT NULL
);

CREATE TABLE type_objet (
    id_type_objet SERIAL PRIMARY KEY,
    nom_type_objet VARCHAR(255) NOT NULL UNIQUE,
    emplacement_objet VARCHAR(255),
    poids_objet VARCHAR(255) NOT NULL
);

CREATE TABLE lieu (
    id_lieu SERIAL PRIMARY KEY,
    nom_lieu VARCHAR(255) NOT NULL,
    description_lieu TEXT NULL,
    carte_lieu VARCHAR(255) NOT NULL
);

CREATE TABLE objectif (
    id_objectif SERIAL PRIMARY KEY,
    nom_objectif VARCHAR(255) NOT NULL UNIQUE,
    description_objectif TEXT NULL,
    validation_objectif BOOLEAN NOT NULL
);

CREATE TABLE quete (
    id_quete SERIAL PRIMARY KEY,
    prerequis_quete VARCHAR(255) NULL,
    nom_quete VARCHAR(255) NOT NULL,
    description_quete TEXT NULL
);

CREATE TABLE role_quete (
    code_role_quete CHAR(2) NOT NULL UNIQUE,
    nom_role_quete VARCHAR(255) NOT NULL
);

CREATE TABLE recompense (
    id_recompense SERIAL PRIMARY KEY,
    nom_recompense VARCHAR(255) NOT NULL,
    description_recompense TEXT NULL
);

CREATE TABLE objet (
    id_objet SERIAL PRIMARY KEY,
    nom_objet VARCHAR(255) NOT NULL,
    statistique_objet VARCHAR(255) NOT NULL,
    equipe_objet BOOLEAN NOT NULL,
    ouvert_objet BOOLEAN NOT NULL,
    description_objet TEXT NULL
);

CREATE TABLE position_s (
    coordonnee POINT PRIMARY KEY
);

CREATE TABLE etat_personnage (
    id_etat_personnage SERIAL PRIMARY KEY,
    nom_etat VARCHAR(255) NOT NULL UNIQUE,
    effet_etat VARCHAR(255) NOT NULL,
    description_etat TEXT NULL
);

--Tables intermédiaires avec clés étrangères niveau 1
CREATE TABLE aptitude (
    id_aptitude SERIAL PRIMARY KEY,
    nom_aptitude VARCHAR(255) NOT NULL,
    effet_aptitude VARCHAR(255) NOT NULL,
    prerequis_aptitude VARCHAR(255) NULL,
    id_type_aptitude INT NOT NULL,
    FOREIGN KEY(id_type_aptitude)
    REFERENCES type_aptitude(id_type_aptitude)
);

CREATE TABLE personnage (
    id_personnage SERIAL PRIMARY KEY,
    nom_personnage VARCHAR(255) NOT NULL,
    niveau_personnage SMALLINT NOT NULL,
    direction_personnage VARCHAR(255) NULL,
    alignement_personnage VARCHAR(255) NULL,
    monnaie_personnage BIGINT NULL,
    vivant_personnage BOOLEAN NULL,
    id_race INT NOT NULL,
    id_compte_utilisateur INT,
    id_lieu INT NOT NULL,
    FOREIGN KEY(id_race)
    REFERENCES race(id_race),
    FOREIGN KEY(id_compte_utilisateur)
    REFERENCES compte_utilisateur(id_compte_utilisateur),
    FOREIGN KEY(id_lieu)
    REFERENCES lieu(id_lieu)
);

CREATE TABLE dialogue (
    id_dialogue SERIAL PRIMARY KEY,
    contenu_dialogue TEXT NULL,
    id_personnage INT NOT NULL,
    FOREIGN KEY(id_personnage)
    REFERENCES personnage(id_personnage)
);

--Tables intermédiaires avec clés primaires et étrangères
CREATE TABLE maitrise (
    id_personnage INT NOT NULL PRIMARY KEY,
    id_aptitude INT NOT NULL PRIMARY KEY,
    pourcentage_maitrise SMALLINT NOT NULL,
    FOREIGN KEY(id_personnage)
    REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_aptitude)
    REFERENCES aptitude(id_aptitude)
);

CREATE TABLE definit (
    id_personnage INT NOT NULL PRIMARY KEY,
    id_caracteristique INT NOT NULL PRIMARY KEY,
    valeur__definit INT NOT NULL,
    valeur_max_definit INT NOT NULL,
    FOREIGN KEY(id_personnage)
    REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_caracteristique)
    REFERENCES caracteristique(id_caracteristique)
);

CREATE TABLE considere (
    id_personnage_juger INT NOT NULL PRIMARY KEY,
    id_personnage_juge INT NOT NULL PRIMARY KEY,
    valeur_attitude VARCHAR(50) NOT NULL,
    FOREIGN KEY(id_personnage_juger)
    REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_personnage_juge)
    REFERENCES personnage(id_personnage)
);

CREATE TABLE possede (
    id_personnage INT NOT NULL PRIMARY KEY,
    id_objet INT NOT NULL PRIMARY KEY,
    quantite INT NOT NULL,
    FOREIGN KEY(id_personnage)
    REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_objet)
    REFERENCES objet(id_objet)
);

CREATE TABLE contient (
    contenant INT NOT NULL PRIMARY KEY,
    id_objet_contenu INT NOT NULL PRIMARY KEY,
    quantite VARCHAR(50) NULL,
    FOREIGN KEY()
)