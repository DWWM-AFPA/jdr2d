--Tables indépendantes niveau 0
CREATE TABLE compte_utilisateur (
    id_compte_utilisateur SERIAL PRIMARY KEY,
    pseudo_compte VARCHAR(255) NOT NULL UNIQUE,
    mdp_compte VARCHAR(255) NOT NULL,
    courriel_compte VARCHAR(255) NOT NULL UNIQUE,
    valide_compte BOOLEAN NOT NULL DEFAULT 'f'
);

CREATE TABLE type_aptitude (
    id_type_aptitude SERIAL PRIMARY KEY,
    nom_type_aptitude VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE classe (
    id_classe SERIAL PRIMARY KEY,
    nom_classe VARCHAR(255) NOT NULL UNIQUE,
    description_classe TEXT,
    jouable_classe BOOLEAN NOT NULL
);

CREATE TABLE race (
    id_race SERIAL PRIMARY KEY,
    nom_race VARCHAR(255) NOT NULL UNIQUE,
    description_race TEXT,
    jouable_race BOOLEAN NOT NULL
);

CREATE TABLE caracteristique (
    id_caracteristique SERIAL PRIMARY KEY,
    nom_caracteristique VARCHAR(255) NOT NULL,
    description_caracteristique TEXT
);

CREATE TABLE type_objet (
    id_type_objet SERIAL PRIMARY KEY,
    nom_type_objet VARCHAR(255) NOT NULL UNIQUE,
    emplacement_objet VARCHAR(255),
    poids_objet VARCHAR(255)
);

CREATE TABLE lieu (
    id_lieu SERIAL PRIMARY KEY,
    nom_lieu VARCHAR(255) NOT NULL,
    description_lieu TEXT,
    carte_lieu VARCHAR(255)
);

CREATE TABLE objectif (
    id_objectif SERIAL PRIMARY KEY,
    nom_objectif VARCHAR(255),
    description_objectif TEXT,
    validation_objectif BOOLEAN NOT NULL
);

CREATE TABLE interaction (
    id_interaction SERIAL PRIMARY KEY,
    prerequis_interaction VARCHAR(255),
    nom_interaction VARCHAR(255) NOT NULL,
    description_interaction TEXT,
    completion_interaction INT CHECK(completion_interaction > 0 AND completion_interaction < 100)
);

CREATE TABLE role_interaction (
    code_role_interaction CHAR(2) NOT NULL UNIQUE PRIMARY KEY,
    nom_role_interaction VARCHAR(255) NOT NULL
);

CREATE TABLE recompense (
    id_recompense SERIAL PRIMARY KEY,
    nom_recompense VARCHAR(255) NOT NULL,
    description_recompense TEXT
);

CREATE TABLE position_s (
    id_position SERIAL PRIMARY KEY, 
    x INT,
    y INT
);

CREATE TABLE etat_personnage (
    id_etat_personnage SERIAL PRIMARY KEY,
    nom_etat VARCHAR(255) NOT NULL UNIQUE,
    effet_etat VARCHAR(255),
    pourcentage_etat_personnage INT CHECK(pourcentage_etat_personnage > 0 AND pourcentage_etat_personnage < 100),
    description_etat_personnage TEXT
);

--Tables intermédiaires avec clés étrangères niveau 1
CREATE TABLE objet (
    id_objet SERIAL PRIMARY KEY,
    nom_objet VARCHAR(255) NOT NULL,
    statistique_objet VARCHAR(255),
    pourcentage_effet_objet CHECK(pourcentage_effet_objet > 0 AND pourcentage_effet_objet < 100),
    equipe_objet BOOLEAN NOT NULL,
    ouvert_objet BOOLEAN DEFAULT 'NULL',
    description_objet TEXT,
    prix_objet INT,
    id_type_objet INT,
    FOREIGN KEY(id_type_objet) REFERENCES type_objet(id_type_objet)
);

CREATE TABLE aptitude (
    id_aptitude SERIAL PRIMARY KEY,
    nom_aptitude VARCHAR(255) NOT NULL,
    effet_aptitude VARCHAR(255),
    prerequis_aptitude VARCHAR(255),
    description_aptitude TEXT,
    id_type_aptitude INT,
    FOREIGN KEY(id_type_aptitude) REFERENCES type_aptitude(id_type_aptitude)
);

CREATE TABLE personnage (
    id_personnage SERIAL PRIMARY KEY,
    nom_personnage VARCHAR(255) NOT NULL,
    niveau_personnage SMALLINT,
    direction_personnage VARCHAR(255),
    alignement_personnage VARCHAR(255),
    monnaie_personnage BIGINT,
    vivant_personnage BOOLEAN NOT NULL,
    id_race INT,
    id_compte_utilisateur INT,
    id_lieu INT,
    FOREIGN KEY(id_race) REFERENCES race(id_race),
    FOREIGN KEY(id_compte_utilisateur) REFERENCES compte_utilisateur(id_compte_utilisateur),
    FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu)
);

CREATE TABLE dialogue (
    id_dialogue SERIAL PRIMARY KEY,
    contenu_dialogue TEXT NULL,
    id_personnage INT,
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage)
);

CREATE TABLE embranchement (
    id_embranchement SERIAL PRIMARY KEY,
    choix_embranchement VARCHAR(50),
    id_dialogue INT,
    FOREIGN KEY(id_dialogue) REFERENCES dialogue(id_dialogue)
);

--Tables intermédiaires avec à la fois des clés primaires et étrangères
CREATE TABLE maitrise (
    id_personnage INT,
    id_aptitude INT,
    pourcentage_maitrise SMALLINT CHECK(pourcentage_maitrise > 0 AND pourcentage_maitrise < 100),
    PRIMARY KEY(id_personnage, id_aptitude),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_aptitude) REFERENCES aptitude(id_aptitude)
);

CREATE TABLE definit (
    id_personnage INT,
    id_caracteristique INT,
    valeur__definit INT,
    valeur_max_definit INT,
    PRIMARY KEY(id_personnage, id_caracteristique),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_caracteristique) REFERENCES caracteristique(id_caracteristique)
);

CREATE TABLE considere (
    id_personnage_juger INT,
    id_personnage_juge INT,
    agressif BOOLEAN,
    PRIMARY KEY(id_personnage_juger, id_personnage_juge),
    FOREIGN KEY(id_personnage_juger) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_personnage_juge) REFERENCES personnage(id_personnage)
);

CREATE TABLE possede (
    id_personnage INT,
    id_objet INT,
    quantite INT,
    PRIMARY KEY(id_personnage, id_objet),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet)
);

CREATE TABLE contient (
    contenant INT,
    id_objet_contenu INT,
    quantite VARCHAR(50),
    PRIMARY KEY(contenant, id_objet_contenu),
    FOREIGN KEY(contenant) REFERENCES objet(id_objet),
    FOREIGN KEY(id_objet_contenu) REFERENCES objet(id_objet)
);

CREATE TABLE accorde (
    id_objet INT,
    id_recompense INT,
    quantite INT,
    PRIMARY KEY(id_objet, id_recompense),
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense)
);

CREATE TABLE instance (
    id_objet INT,
    id_lieu INT,
    id_position iNT,
    quantite_instance INT,
    PRIMARY KEY(id_objet, id_lieu, id_position),
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu),
    FOREIGN KEY(id_position) REFERENCES position_s(id_position)
);

--Tables contenants que des clés à la fois primaires et étrangères
CREATE TABLE appartient (
    id_personnage INT,
    id_classe INT,
    PRIMARY KEY(id_personnage, id_classe),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE relie (
    id_objet_porte_entre INT,
    id_objet_porte_sortie INT,
    PRIMARY KEY(id_objet_porte_entre, id_objet_porte_sortie),
    FOREIGN KEY(id_objet_porte_entre) REFERENCES objet(id_objet),
    FOREIGN KEY(id_objet_porte_sortie) REFERENCES objet(id_objet)
);

CREATE TABLE affecte (
    id_personnage INT,
    id_etat_personnage INT,
    PRIMARY KEY(id_personnage, id_etat_personnage),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_etat_personnage) REFERENCES etat_personnage(id_etat_personnage)
);

CREATE TABLE donne (
    id_interaction INT,
    id_dialogue INT,
    code_role_interaction CHAR(2),
    PRIMARY KEY(id_interaction, id_dialogue, code_role_interaction),
    FOREIGN KEY(id_interaction) REFERENCES interaction(id_interaction),
    FOREIGN KEY(id_dialogue) REFERENCES dialogue(id_dialogue),
    FOREIGN KEY(code_role_interaction) REFERENCES role_interaction(code_role_interaction)
);

CREATE TABLE active (
    id_objet INT,
    id_interaction INT,
    code_role_interaction CHAR(2),
    PRIMARY KEY(id_objet, id_interaction, code_role_interaction),
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    FOREIGN KEY(id_interaction) REFERENCES interaction(id_interaction),
    FOREIGN KEY(code_role_interaction) REFERENCES role_interaction(code_role_interaction)
);

CREATE TABLE declenche (
    id_interaction INT,
    id_recompense INT,
    id_objectif INT,
    PRIMARY KEY(id_interaction, id_recompense, id_objectif),
    FOREIGN KEY(id_interaction) REFERENCES interaction(id_interaction),
    FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense),
    FOREIGN KEY(id_objectif) REFERENCES objectif(id_objectif)
);

CREATE TABLE positionne (
    id_personnage INT,
    id_position INT,
    PRIMARY KEY(id_personnage, id_position),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_position) REFERENCES position_s(id_position)
);

CREATE TABLE precede (
    id_dialogue INT,
    id_embranchement INT,
    PRIMARY KEY(id_dialogue, id_embranchement),
    FOREIGN KEY(id_dialogue) REFERENCES dialogue(id_dialogue),
    FOREIGN KEY(id_embranchement) REFERENCES embranchement(id_embranchement)
);