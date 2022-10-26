CREATE TABLE etat_personnage(
    id_etat_personnage SERIAL PRIMARY KEY, 
    nom_etat VARCHAR (50) NOT NULL,
    effet_etat VARCHAR (255) NOT NULL,
    description_etat VARCHAR (255) 
);

CREATE TABLE lieu(
    id_lieu SERIAL PRIMARY KEY,
    nom_lieu VARCHAR (255) NOT NULL,
    description_lieu VARCHAR (255) NOT NULL,
    carte_lieu TEXT 
);

CREATE TABLE OBJECTIF(
    id_objectif SERIAL PRIMARY KEY
    nom_objectif VARCHAR(255) NOT NULL,
    description_objectif TEXT,
    validation_  VARCHAR (255) NOT NULL,
);

CREATE TABLE RECOMPENSE(
    id_recompense SERIAL PRIMARY KEY
    nom_recompense VARCHAR (255) NOT NULL,
    description_recompense (255) NOT NULL,
);

CREATE TABLE POSITION_S(
    coordonee TEXT,
    PRIMARY KEY(coordone)
)

CREATE TABLE QUETE(
    id_quete SERIAL PRIMARY KEY
    prerequis_quete VARCHAR (255) NOT NULL,
    nom_quete VARCHAR (255) NOT NULL,
    description_quete VARCHAR (255) NOT NULL,
);

CREATE TABLE ROLE_QUETE(
    code role_quete SERIAL PRIMARY KEY,
    nom_role_quete VARCHAR (255) NOT NULL

);


CREATE TABLE COMPTE_UTILISTEUR(
    id_compte_utiisateur SERIAL PRIMARY KEY,
    pseudo_compte VARCHAR (255) NOT NULL UNIQUE,
    courriel_compte VARCHAR(255) NOT NULL UNIQUE,
    mdp_compte VARCHAR (255) NOT NULL,
    valide VARCHAR (255) NOT NULL
);

CREATE TABLE instance_commerce(
    id_instance_commerce VARCHAR(255),
    PRIMARY KEY(instance commerce),
);

CREATE TABLE RACE(
    id_race SERIAL PRIMARY KEY
    nom_race VARCHAR(255) NOT NULL,
    description_race VARCHAR (255) NOT NULL,
    jouable BOOLEAN NOT NULL 
);

CREATE TABLE CARACTERISTIQUE(
    id_statistique SERIAL PRIMARY KEY
    nom_caracteristique
    description_caracteristique
);

CREATE TABLE OBJET(
    id_objet SERIAL PRIMARY KEY
    nom_objet VARCHAR (255) NOT NULL,
    statistique_objet VARCHAR (255) NOT NULL,
    equipe BOOLEAN,
    ouvert BOOLEAN,
    description_objet VARCHAR (255) NOT NULL,
    Prix INT,
);

CREATE TABLE type_aptitude(
    id-statistique SERIAL PRIMARY KEY
    nom_type_aptitude VARCHAR (255) NOT NULL,

);

CREATE TABLE classe(
    id_classe SERIAL PRIMARY KEY
    nom_classe VARCHAR (255) NOT NULL,
    description_classe VARCHAR (255) NOT NULL,
    jouable BOOLEAN?

);

CREATE TABLE type_objet(
    id_type_objet SERIAL PRIMARY KEY
    nom_type_objet VARCHAR (255) NOT NULL,
    emplacement_objet VARCHAR (255) NOT NULL,
    poids_objet VARCHAR (255) NOT NULL,
);








