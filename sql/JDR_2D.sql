-- TABLE DE NIVEAU 0 (vert)

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
    description_race TEXT,
    jouable BOOLEAN NOT NULL,
    PRIMARY KEY(id_race)
);

CREATE TABLE classe(
    id_classe SERIAL,
    nom_classe VARCHAR(255) UNIQUE NOT NULL,
    description_classe TEXT,
    jouable BOOLEAN NOT NULL,
    PRIMARY KEY(id_classe)
);

CREATE TABLE objet(
    id_objet SERIAL,
    nom_objet VARCHAR(255) NOT NULL,
    statistique_objet VARCHAR(255),
    equipe BOOLEAN,
    ouvert BOOLEAN,
    description_objet TEXT,
    prix INTEGER,
    PRIMARY KEY(id_objet)
);

CREATE TABLE type_objet(
    id_type_objet SERIAL,
    nom_type_objet VARCHAR(255) UNIQUE NOT NULL,
    emplacement_objet VARCHAR(255) NOT NULL,
    poids_objet VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_type_objet)
);

CREATE TABLE lieu(
    id_lieu SERIAL,
    nom_lieu VARCHAR(255) UNIQUE NOT NULL,
    description_lieu TEXT,
    carte_lieu TEXT,
    PRIMARY KEY(id_lieu)
);

CREATE TABLE etat_personnage(
    id_etat_personnage SERIAL,
    nom_etat VARCHAR(255) UNIQUE NOT NULL,
    effet_etat VARCHAR(255) NOT NULL,
    description_etat TEXT,
    PRIMARY KEY(id_etat_personnage)
);

CREATE TABLE type_aptitude(
    id_type_aptitude SERIAL,
    nom_type_aptitude VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY(id_type_aptitude)
);

CREATE TABLE objectif(
    id_objectif SERIAL,
    nom_objectif VARCHAR(255) NOT NULL,
    description_objectif TEXT,
    valide BOOLEAN NOT NULL,
    PRIMARY KEY(id_objectif)
);

CREATE TABLE recompense(
    id_recompense SERIAL,
    nom_recompense VARCHAR(255) NOT NULL,
    description_recompense TEXT,
    PRIMARY KEY(id_recompense)
);

CREATE TABLE caracteristique(
    id_caracteristique SERIAL,
    nom_caracteristique VARCHAR(255) UNIQUE NOT NULL,
    description_caracteristique TEXT,
    PRIMARY KEY(id_caracteristique)
);

CREATE TABLE interaction(
    id_interaction SERIAL,
    prerequis_interaction VARCHAR(255),
    nom_interaction VARCHAR(255) NOT NULL,
    description_interaction TEXT,
    completion_interaction SMALLINT CHECK(completion_interaction>0 AND completion_interaction<100) NOT NULL,
    PRIMARY KEY(id_interaction)
);

CREATE TABLE role_interaction(
    code_role_quete CHAR(2),
    nom_role_quete VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY(code_role_quete)
);

CREATE TABLE position_s(
    coordonee VARCHAR(255),
    PRIMARY KEY(coordonee)
);

-- TABLE DE NIVEAU 1 (cyan)

CREATE TABLE aptitude(
    id_aptitude SERIAL,
    nom_aptitude VARCHAR(255) UNIQUE NOT NULL,
    effet_aptitude VARCHAR(255) NOT NULL,
    prerequis_aptitude VARCHAR(255),
    PRIMARY KEY(id_aptitude),
    -- clé étrangère
    id_type_aptitude INTEGER NOT NULL,
    FOREIGN KEY(id_type_aptitude) REFERENCES type_aptitude(id_type_aptitude)
);

-- TABLE DE NIVEAU 2 (jaune)

CREATE TABLE caracterise(
    id_objet INTEGER NOT NULL,
    id_type_objet INTEGER NOT NULL,
    PRIMARY KEY(id_objet,id_type_objet),
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    FOREIGN KEY(id_type_objet) REFERENCES type_objet(id_type_objet)
);

CREATE TABLE relie(
    id_objet_porte_entree INTEGER,
    id_objet_porte_sortie INTEGER,
    PRIMARY KEY(id_objet_porte_entree,id_objet_porte_sortie),
    FOREIGN KEY(id_objet_porte_entree) REFERENCES objet(id_objet),
    FOREIGN KEY(id_objet_porte_sortie) REFERENCES objet(id_objet)
);

CREATE TABLE contient(
    id_objet_contenu INTEGER,
    contenant INTEGER,
    quantite INTEGER,
    PRIMARY KEY(id_objet_contenu,contenant),
    FOREIGN KEY(id_objet_contenu) REFERENCES objet(id_objet),
    FOREIGN KEY(contenant) REFERENCES objet(id_objet)
);

CREATE TABLE accorde(
    id_objet INTEGER NOT NULL,
    id_recompense INTEGER NOT NULL,
    quantite INTEGER,
    PRIMARY KEY(id_objet, id_recompense),
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense)
);

CREATE TABLE constitue(
    id_interaction INTEGER,
    id_objectif INTEGER,
    parametre VARCHAR(255),
    PRIMARY KEY(id_interaction, id_objectif),
    FOREIGN KEY(id_interaction) REFERENCES interaction(id_interaction),
    FOREIGN KEY(id_objectif) REFERENCES objectif(id_objectif)
);

-- TABLE DE NIVEAU 3 (orange)

CREATE TABLE personnage(
    id_personnage SERIAL,
    nom_personnage VARCHAR(255) NOT NULL,
    niveau_personnage INTEGER NOT NULL,
    direction VARCHAR(255) NOT NULL,
    alignement VARCHAR(255),
    monnaie INTEGER,
    vivant BOOLEAN NOT NULL,
    PRIMARY KEY(id_personnage),
    -- clés étrangères
    id_lieu INTEGER NOT NULL,
    id_race INTEGER NOT NULL,
    id_compte_utilisateur INTEGER,
    FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu),
    FOREIGN KEY(id_race) REFERENCES race(id_race),
    FOREIGN KEY(id_compte_utilisateur) REFERENCES compte_utilisateur(id_compte_utilisateur)
);

CREATE TABLE declenche(
    id_interaction INTEGER,
    id_recompense INTEGER,
    id_objectif INTEGER,
    PRIMARY KEY(id_interaction,id_recompense,id_objectif),
    FOREIGN KEY(id_interaction) REFERENCES interaction(id_interaction),
    FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense),
    FOREIGN KEY(id_objectif) REFERENCES objectif(id_objectif)
);

CREATE TABLE instance(
    id_objet INTEGER NOT NULL,
    id_lieu INTEGER NOT NULL,
    coordonee VARCHAR(255),
    quantite INTEGER,
    PRIMARY KEY(id_objet,id_lieu,coordonee),
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu),
    FOREIGN KEY(coordonee) REFERENCES position_s(coordonee)
);

CREATE TABLE active(
    id_objet INTEGER NOT NULL,
    id_interaction INTEGER NOT NULL,
    code_role_quete CHAR(2),
    PRIMARY KEY(id_objet,id_interaction,code_role_quete),
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    FOREIGN KEY(id_interaction) REFERENCES interaction(id_interaction),
    FOREIGN KEY(code_role_quete) REFERENCES role_interaction(code_role_quete)
);


-- TABLE DE NIVEAU 4 : TABLE DE NIVEAU [1+3]
-- TABLE DE NIVEAU 1 avec une DEPENDANCE à une TABLE DE NIVEAU 3 (bleu)

CREATE TABLE dialogue(
    id_dialogue SERIAL,
    contenu_dialogue TEXT NOT NULL,
    PRIMARY KEY(id_dialogue),
    id_personnage INTEGER NOT NULL,
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage)
);

-- TABLE DE NIVEAU 5 : TABLE DE NIVEAU [2+3]
-- TABLE DE NIVEAU 2 avec une DEPENDANCE à une TABLE DE NIVEAU 3 (rose)

CREATE TABLE affecte(
    id_personnage INTEGER,
    id_etat_personnage INTEGER,
    PRIMARY KEY(id_personnage,id_etat_personnage),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_etat_personnage) REFERENCES etat_personnage(id_etat_personnage)
);

CREATE TABLE positionne(
    id_personnage INTEGER,
    coordonee VARCHAR(255),
    PRIMARY KEY(id_personnage,coordonee),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(coordonee) REFERENCES position_s(coordonee)
);

CREATE TABLE maitrise(
    id_personnage INTEGER,
    id_aptitude INTEGER,
    pourcentage_maitrise INTEGER NOT NULL,
    PRIMARY KEY(id_personnage,id_aptitude),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_aptitude) REFERENCES aptitude(id_aptitude)
);

CREATE TABLE appartient(
    id_personnage INTEGER,
    id_classe INTEGER,
    PRIMARY KEY(id_personnage,id_classe),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE définit(
    id_personnage INTEGER,
    id_caracteristique INTEGER,
    valeur INTEGER,
    valeur_max INTEGER,
    PRIMARY KEY(id_personnage,id_caracteristique),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_caracteristique) REFERENCES caracteristique(id_caracteristique)
);

CREATE TABLE considère(
    id_personnage_juge INTEGER,
    id_personnage_juger INTEGER,
    aggressif BOOLEAN NOT NULL,
    PRIMARY KEY(id_personnage_juge,id_personnage_juger),
    FOREIGN KEY(id_personnage_juge) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_personnage_juger) REFERENCES personnage(id_personnage)
);

CREATE TABLE possede(
    id_personnage INTEGER,
    id_objet INTEGER,
    quantite INTEGER,
    PRIMARY KEY(id_personnage,id_objet),
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet)
);

-- TABLE DE NIVEAU 6 : TABLE DE NIVEAU [2+4]
-- TABLE DE NIVEAU 2 avec une DEPENDANCE à une TABLE DE NIVEAU 4 (violet)

CREATE TABLE mene(
    id_dialogue_precedent INTEGER,
    id_dialogue_suivant INTEGER,
    choix TEXT NOT NULL,
    PRIMARY KEY(id_dialogue_precedent,id_dialogue_suivant),
    FOREIGN KEY(id_dialogue_precedent) REFERENCES dialogue(id_dialogue),
    FOREIGN KEY(id_dialogue_suivant) REFERENCES dialogue(id_dialogue)
);

-- TABLE DE NIVEAU 7 : TABLE DE NIVEAU [3+4]
-- TABLE DE NIVEAU 3 avec une DEPENDANCE à une TABLE DE NIVEAU 4 (rouge)

CREATE TABLE donne(
    id_interaction INTEGER,
    id_dialogue INTEGER,
    code_role_quete CHAR(2),
    PRIMARY KEY(id_interaction,id_dialogue,code_role_quete),
    FOREIGN KEY(id_interaction) REFERENCES interaction(id_interaction),
    FOREIGN KEY(id_dialogue) REFERENCES dialogue(id_dialogue),
    FOREIGN KEY(code_role_quete) REFERENCES role_interaction(code_role_quete)
);
