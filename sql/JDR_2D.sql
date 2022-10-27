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
    description_quete TEXT NULL,
    completion_quete INT NOT NULL CHECK(completion_quete > 0 AND completion_quete < 100),
);

CREATE TABLE role_quete (
    code_role_quete CHAR(2) NOT NULL UNIQUE PRIMARY KEY,
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
    pourcentage_effet_objet INT NULL CHECK(pourcentage_effet_objet > 0 AND pourcentage_effet_objet < 100),
    equipe_objet BOOLEAN NOT NULL,
    ouvert_objet BOOLEAN NOT NULL,
    description_objet TEXT NULL,
    prix_objet INT NOT NULL
);

CREATE TABLE position_s (
    coordonnee POINT PRIMARY KEY
);

CREATE TABLE etat_personnage (
    id_etat_personnage SERIAL PRIMARY KEY,
    nom_etat VARCHAR(255) NOT NULL UNIQUE,
    effet_etat VARCHAR(255) NOT NULL,
    pourcentage_etat_personnage INT NOT NULL CHECK(pourcentage_etat_personnage > 0 AND pourcentage_etat_personnage < 100),
    description_etat TEXT NULL
);

--Tables intermédiaires avec clés étrangères niveau 1
CREATE TABLE aptitude (
    id_aptitude SERIAL PRIMARY KEY,
    nom_aptitude VARCHAR(255) NOT NULL,
    effet_aptitude VARCHAR(255) NOT NULL,
    prerequis_aptitude VARCHAR(255) NULL,
    id_type_aptitude INT NOT NULL,
    FOREIGN KEY(id_type_aptitude) REFERENCES type_aptitude(id_type_aptitude)
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
    FOREIGN KEY(id_race) REFERENCES race(id_race),
    FOREIGN KEY(id_compte_utilisateur) REFERENCES compte_utilisateur(id_compte_utilisateur),
    FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu)
);

CREATE TABLE dialogue (
    id_dialogue SERIAL PRIMARY KEY,
    contenu_dialogue TEXT NULL,
    id_personnage INT NOT NULL,
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage)
);

--Tables intermédiaires avec à la fois des clés primaires et étrangères
CREATE TABLE maitrise (
    id_personnage INT PRIMARY KEY,
    id_aptitude INT PRIMARY KEY,
    pourcentage_maitrise SMALLINT NOT NULL CHECK(pourcentage_maitrise > 0 AND pourcentage_maitrise < 100),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_aptitude) REFERENCES aptitude(id_aptitude)
);

CREATE TABLE definit (
    id_personnage INT PRIMARY KEY,
    id_caracteristique INT PRIMARY KEY,
    valeur__definit INT NOT NULL,
    valeur_max_definit INT NOT NULL,
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_caracteristique) REFERENCES caracteristique(id_caracteristique)
);

CREATE TABLE considere (
    id_personnage_juger INT PRIMARY KEY,
    id_personnage_juge INT PRIMARY KEY,
    agressif BOOLEAN NOT NULL,
    FOREIGN KEY(id_personnage_juger) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_personnage_juge) REFERENCES personnage(id_personnage)
);

CREATE TABLE possede (
    id_personnage INT PRIMARY KEY,
    id_objet INT PRIMARY KEY,
    quantite INT NOT NULL,
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet)
);

CREATE TABLE contient (
    contenant INT PRIMARY KEY,
    id_objet_contenu INT PRIMARY KEY,
    quantite VARCHAR(50) NULL,
    FOREIGN KEY(contenant) REFERENCES objet(id_objet),
    FOREIGN KEY(id_objet_contenu) REFERENCES objet(id_objet)
);

CREATE TABLE constitue (
    id_quete INT PRIMARY KEY,
    id_objectif INT PRIMARY KEY,
    parametre VARCHAR(255) NOT NULL,
    FOREIGN KEY(id_quete) REFERENCES quete(id_quete),
    FOREIGN KEY(id_objectif) REFERENCES objectif(id_objectif)
);

CREATE TABLE accorde (
    id_objet INT PRIMARY KEY,
    id_recompense INT PRIMARY KEY,
    quantite INT NULL,
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense)
);

CREATE TABLE instance (
    id_objet INT PRIMARY KEY,
    id_lieu INT PRIMARY KEY,
    coordonnee POINT PRIMARY KEY,
    quantite_instance INT NULL,
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu),
    FOREIGN KEY(coordonnee) REFERENCES position_s(coordonnee)
);

CREATE TABLE mene (
    id_dialogue_suivant INT PRIMARY KEY,
    id_dialogue_precedent INT PRIMARY KEY,
    choix TEXT NULL,
    FOREIGN KEY(id_dialogue_suivant) REFERENCES dialogue(id_dialogue_suivant)
    FOREIGN KEY(id_dialogue_precedent) REFERENCES dialogue(id_dialogue_precedent)
);

--Tables contenants que des clés à la fois primaires et étrangères
CREATE TABLE appartient (
    id_personnage INT PRIMARY KEY,
    id_classe INT PRIMARY KEY,
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE caracterise (
    id_objet INT PRIMARY KEY,
    id_type_objet INT PRIMARY KEY,
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    FOREIGN KEY(id_type_objet) REFERENCES type_objet(id_type_objet)
);

CREATE TABLE relie (
    id_objet_porte_entre INT PRIMARY KEY,
    id_objet_porte_sortie INT PRIMARY KEY,
    FOREIGN KEY(id_objet_porte_entre) REFERENCES objet(id_objet),
    FOREIGN KEY(id_objet_porte_sortie) REFERENCES objet(id_objet)
);

CREATE TABLE affecte (
    id_personnage INT PRIMARY KEY,
    id_etat_personnage INT PRIMARY KEY,
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_etat_personnage) REFERENCES etat_personnage(id_etat_personnage)
);

CREATE TABLE donne (
    id_quete INT PRIMARY KEY,
    id_dialogue INT PRIMARY KEY,
    code_role_quete CHAR(2) PRIMARY KEY,
    FOREIGN KEY(id_quete) REFERENCES quete(id_quete),
    FOREIGN KEY(id_dialogue) REFERENCES dialogue(id_dialogue),
    FOREIGN KEY(code_role_quete) REFERENCES role_quete(code_role_quete)
);

CREATE TABLE active (
    id_objet INT PRIMARY KEY,
    id_quete INT PRIMARY KEY,
    code_role_quete CHAR(2) PRIMARY KEY,
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    FOREIGN KEY(id_quete) REFERENCES quete(id_quete),
    FOREIGN KEY(code_role_quete) REFERENCES role_quete(code_role_quete)
);

CREATE TABLE declenche (
    id_quete INT PRIMARY KEY,
    id_recompense INT PRIMARY KEY,
    id_objectif INT PRIMARY KEY,
    FOREIGN KEY(id_quete) REFERENCES quete(id_quete),
    FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense),
    FOREIGN KEY(id_objectif) REFERENCES objectif(id_objectif)
);

CREATE TABLE positionne (
    id_personnage INT PRIMARY KEY,
    coordonnee POINT PRIMARY KEY,
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(coordonnee) REFERENCES position_s(coordonnee)
);