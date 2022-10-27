CREATE TABLE compte_utilisateur(
   id_compte_utilisateur COUNTER,
   pseudo_compte VARCHAR(255) NOT NULL,
   mdp_compte VARCHAR(255) NOT NULL,
   courriel_compte VARCHAR(255) NOT NULL,
   valid LOGICAL NOT NULL DEFAULT FALSE,
   PRIMARY KEY(id_compte_utilisateur),
   UNIQUE(pseudo_compte),
   UNIQUE(courriel_compte)
);

CREATE TABLE race(
   id_race COUNTER,
   nom_race VARCHAR(255) NOT NULL,
   description_race TEXT,
   jouable LOGICAL NOT NULL,
   PRIMARY KEY(id_race),
   UNIQUE(nom_race)
);

CREATE TABLE classe(
   id_classe COUNTER,
   nom_classe VARCHAR(255) NOT NULL,
   description_classe TEXT,
   jouable LOGICAL NOT NULL,
   PRIMARY KEY(id_classe),
   UNIQUE(nom_classe)
);

CREATE TABLE lieu(
   id_lieu COUNTER,
   nom_lieu VARCHAR(255),
   description_lieu VARCHAR(255),
   carte_lieu TEXT,
   PRIMARY KEY(id_lieu)
);

CREATE TABLE type_objet(
   id_type_objet COUNTER,
   nom_type_objet VARCHAR(255) NOT NULL,
   emplacement_objet VARCHAR(255) NOT NULL,
   poids_objet VARCHAR(255) NOT NULL,
   PRIMARY KEY(id_type_objet),
   UNIQUE(nom_type_objet)
);

CREATE TABLE quete(
   id_quete COUNTER,
   prerequis_quete VARCHAR(255),
   nom_quete VARCHAR(255),
   description_quete VARCHAR(255),
   PRIMARY KEY(id_quete)
);

CREATE TABLE recompense(
   id_recompense COUNTER,
   nom_recompense VARCHAR(255) NOT NULL,
   decription_recompense TEXT,
   PRIMARY KEY(id_recompense)
);

CREATE TABLE objectif(
   id_objectif COUNTER,
   nom_objectif VARCHAR(255) NOT NULL,
   description_objectif TEXT,
   validation VARCHAR(255) NOT NULL,
   PRIMARY KEY(id_objectif),
   UNIQUE(nom_objectif)
);

CREATE TABLE etat_personnage(
   id_etat_personnage COUNTER,
   nom_etat VARCHAR(50) NOT NULL,
   effet_etat VARCHAR(255) NOT NULL,
   description_etat VARCHAR(255),
   duree_effet VARCHAR(255),
   PRIMARY KEY(id_etat_personnage),
   UNIQUE(nom_etat)
);

CREATE TABLE type_aptitude(
   id_type_aptitude COUNTER,
   nom_type_aptitude VARCHAR(255) NOT NULL,
   PRIMARY KEY(id_type_aptitude),
   UNIQUE(nom_type_aptitude)
);

CREATE TABLE role_quete(
   code_role_quete CHAR(2),
   nom_role_quete VARCHAR(255) NOT NULL,
   PRIMARY KEY(code_role_quete),
   UNIQUE(nom_role_quete)
);

CREATE TABLE dialogue(
   id_dialogue COUNTER,
   texte TEXT NOT NULL,
   PRIMARY KEY(id_dialogue)
);

CREATE TABLE personnage(
   id_personnage COUNTER,
   nom_personnage VARCHAR(255) NOT NULL,
   niveau_personnage BYTE NOT NULL,
   point_de_vie INT,
   point_de_vie_max INT,
   point_de_mana INT,
   point_de_mana_max INT,
   point_xp INT,
   vivant LOGICAL NOT NULL,
   alignement VARCHAR(255),
   coordonnee_x DECIMAL(4,2) NOT NULL,
   coordonnee_y DECIMAL(4,2) NOT NULL,
   monnaie BIGINT,
   id_race INT NOT NULL,
   id_compte_utilisateur INT,
   id_lieu INT NOT NULL,
   PRIMARY KEY(id_personnage),
   FOREIGN KEY(id_race) REFERENCES race(id_race),
   FOREIGN KEY(id_compte_utilisateur) REFERENCES compte_utilisateur(id_compte_utilisateur),
   FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu)
);

CREATE TABLE aptitude(
   id_aptitude COUNTER,
   nom_aptitude VARCHAR(50),
   effet_aptitude VARCHAR(50),
   prerequis_aptitude VARCHAR(255),
   id_type_aptitude INT NOT NULL,
   PRIMARY KEY(id_aptitude),
   FOREIGN KEY(id_type_aptitude) REFERENCES type_aptitude(id_type_aptitude)
);

CREATE TABLE objet(
   id_objet COUNTER,
   nom_objet VARCHAR(255) NOT NULL,
   statistique_objet VARCHAR(255),
   description_objet TEXT,
   contenant INT,
   idutilisateur INT,
   idproprietaire INT,
   id_lieu INT,
   PRIMARY KEY(id_objet),
   FOREIGN KEY(contenant) REFERENCES objet(id_objet),
   FOREIGN KEY(idutilisateur) REFERENCES personnage(id_personnage),
   FOREIGN KEY(idproprietaire) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu)
);

CREATE TABLE affecte(
   id_personnage INT,
   id_etat_personnage INT,
   PRIMARY KEY(id_personnage, id_etat_personnage),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_etat_personnage) REFERENCES etat_personnage(id_etat_personnage)
);

CREATE TABLE maitrise(
   id_personnage INT,
   id_aptitude INT,
   pourcentage_maitrise BYTE NOT NULL,
   PRIMARY KEY(id_personnage, id_aptitude),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_aptitude) REFERENCES aptitude(id_aptitude)
);

CREATE TABLE appartient(
   id_personnage INT,
   id_classe INT,
   PRIMARY KEY(id_personnage, id_classe),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE caracterise(
   id_objet INT,
   id_type_objet INT,
   PRIMARY KEY(id_objet, id_type_objet),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
   FOREIGN KEY(id_type_objet) REFERENCES type_objet(id_type_objet)
);

CREATE TABLE donne(
   id_personnage INT,
   id_quete INT,
   code_role_quete CHAR(2),
   PRIMARY KEY(id_personnage, id_quete, code_role_quete),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_quete) REFERENCES quete(id_quete),
   FOREIGN KEY(code_role_quete) REFERENCES role_quete(code_role_quete)
);

CREATE TABLE active(
   id_objet INT,
   id_quete INT,
   code_role_quete CHAR(2),
   PRIMARY KEY(id_objet, id_quete, code_role_quete),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
   FOREIGN KEY(id_quete) REFERENCES quete(id_quete),
   FOREIGN KEY(code_role_quete) REFERENCES role_quete(code_role_quete)
);

CREATE TABLE constitue(
   id_quete INT,
   id_objectif INT,
   parametre VARCHAR(255),
   PRIMARY KEY(id_quete, id_objectif),
   FOREIGN KEY(id_quete) REFERENCES quete(id_quete),
   FOREIGN KEY(id_objectif) REFERENCES objectif(id_objectif)
);

CREATE TABLE declenche(
   id_quete INT,
   id_recompense INT,
   id_objectif INT,
   PRIMARY KEY(id_quete, id_recompense, id_objectif),
   FOREIGN KEY(id_quete) REFERENCES quete(id_quete),
   FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense),
   FOREIGN KEY(id_objectif) REFERENCES objectif(id_objectif)
);

CREATE TABLE accorde(
   id_objet INT,
   id_recompense INT,
   PRIMARY KEY(id_objet, id_recompense),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
   FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense)
);

CREATE TABLE mene(
   IdPrecedent INT,
   IdSuivant INT,
   choix TEXT NOT NULL,
   PRIMARY KEY(IdPrecedent, IdSuivant),
   FOREIGN KEY(IdPrecedent) REFERENCES dialogue(id_dialogue),
   FOREIGN KEY(IdSuivant) REFERENCES dialogue(id_dialogue)
);
