DROP TABLE IF EXISTS  positionne, relir, definit, considere, mene, accorde, declenche, constitue, active, donne, contient, possede, instancemaitrise, dialogue, objet, aptitude, personnage, position_s, caracteristique, role_interaction, type_aptitude, objectif, recompense, interactions, type_objet, lieu, race, compte_utilisateur;

CREATE TABLE compte_utilisateur(
   id_compte_utilisateur SERIAL,
   pseudo_compte VARCHAR(255)  NOT NULL,
   courriel_compte VARCHAR(255)  NOT NULL,
   mdp_compte VARCHAR(255)  NOT NULL,
   valide VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_compte_utilisateur),
   UNIQUE(pseudo_compte),
   UNIQUE(courriel_compte)
);

CREATE TABLE race(
   id_race SERIAL,
   nom_race VARCHAR(255)  NOT NULL,
   description_race TEXT,
   jouable BOOLEAN NOT NULL,
   PRIMARY KEY(id_race),
   UNIQUE(nom_race)
);

CREATE TABLE lieu(
   id_lieu SERIAL,
   nom_lieu VARCHAR(255) ,
   description_lieu VARCHAR(255) ,
   carte_lieu TEXT,
   PRIMARY KEY(id_lieu)
);

CREATE TABLE type_objet(
   id_type_objet SERIAL,
   nom_type_objet VARCHAR(255)  NOT NULL,
   emplacement VARCHAR(255) ,
   PRIMARY KEY(id_type_objet),
   UNIQUE(nom_type_objet)
);

CREATE TABLE interactions(
   id_interaction SERIAL,
   prerequis_interaction VARCHAR(255) ,
   nom_interaction VARCHAR(255) ,
   description_interaction VARCHAR(255) ,
   completion_interaction SMALLINT NOT NULL >0 AND <100,
   PRIMARY KEY(id_interaction)
);

CREATE TABLE recompense(
   id_recompense SERIAL,
   nom_recompense VARCHAR(255)  NOT NULL,
   decription_recompense TEXT,
   PRIMARY KEY(id_recompense)
);

CREATE TABLE objectif(
   id_objectif SERIAL,
   nom_objectif VARCHAR(255)  NOT NULL,
   description_objectif TEXT,
   validation VARCHAR(255)  NOT NULL,
   PRIMARY KEY(id_objectif),
   UNIQUE(nom_objectif)
);

CREATE TABLE type_aptitude(
   id_type_aptitude SERIAL,
   nom_type_aptitude VARCHAR(255)  NOT NULL,
   PRIMARY KEY(id_type_aptitude),
   UNIQUE(nom_type_aptitude)
);

CREATE TABLE role_interaction(
   code_role_quete CHAR(2) ,
   nom_role_quete VARCHAR(255)  NOT NULL,
   PRIMARY KEY(code_role_quete),
   UNIQUE(nom_role_quete)
);

CREATE TABLE caracteristique(
   Id_Statistique SERIAL,
   nom_caracteristique VARCHAR(255) ,
   description_caracteristique TEXT,
   PRIMARY KEY(Id_Statistique)
);

CREATE TABLE position_s(
   coordonee GEOMETRY,
   PRIMARY KEY(coordonee)
);

CREATE TABLE personnage(
   id_personnage SERIAL,
   nom_personnage VARCHAR(255)  NOT NULL,
   niveau_personnage SMALLINT NOT NULL,
   direction VARCHAR(50)  NOT NULL,
   alignement VARCHAR(255) ,
   monnaie BIGINT,
   vivant BOOLEAN NOT NULL,
   id_lieu INTEGER NOT NULL,
   id_race INTEGER NOT NULL,
   id_compte_utilisateur INTEGER,
   PRIMARY KEY(id_personnage),
   FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu),
   FOREIGN KEY(id_race) REFERENCES race(id_race),
   FOREIGN KEY(id_compte_utilisateur) REFERENCES compte_utilisateur(id_compte_utilisateur)
);

CREATE TABLE aptitude(
   id_aptitude SERIAL,
   nom_aptitude VARCHAR(50) ,
   effet_aptitude VARCHAR(255) ,
   prerequis_aptitude VARCHAR(255) ,
   id_type_aptitude INTEGER NOT NULL,
   PRIMARY KEY(id_aptitude),
   FOREIGN KEY(id_type_aptitude) REFERENCES type_aptitude(id_type_aptitude)
);

CREATE TABLE objet(
   id_objet SERIAL,
   nom_objet VARCHAR(255)  NOT NULL,
   statistique_objet VARCHAR(255) ,
   equipe BOOLEAN,
   ouvert BOOLEAN,
   description_objet TEXT,
   prix INTEGER,
   id_type_objet INTEGER NOT NULL,
   PRIMARY KEY(id_objet),
   FOREIGN KEY(id_type_objet) REFERENCES type_objet(id_type_objet)
);

CREATE TABLE dialogue(
   id_dialogue SERIAL,
   Contenu_dialogue TEXT NOT NULL,
   id_personnage INTEGER,
   PRIMARY KEY(id_dialogue),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage)
);

CREATE TABLE maitrise(
   id_personnage INTEGER,
   id_aptitude INTEGER,
   pourcentage_maitrise SMALLINT NOT NULL,
   PRIMARY KEY(id_personnage, id_aptitude),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_aptitude) REFERENCES aptitude(id_aptitude)
);

CREATE TABLE instance(
   id_objet INTEGER,
   id_lieu INTEGER,
   coordonee GEOMETRY,
   quantite INTEGER,
   PRIMARY KEY(id_objet, id_lieu, coordonee),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
   FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu),
   FOREIGN KEY(coordonee) REFERENCES position_s(coordonee)
);

CREATE TABLE possede(
   id_personnage INTEGER,
   id_objet INTEGER,
   quantite INTEGER,
   PRIMARY KEY(id_personnage, id_objet),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet)
);

CREATE TABLE contient(
   contenant INTEGER,
   id_objet_contenu INTEGER,
   Quantite VARCHAR(50) ,
   PRIMARY KEY(contenant, id_objet_contenu),
   FOREIGN KEY(contenant) REFERENCES objet(id_objet),
   FOREIGN KEY(id_objet_contenu) REFERENCES objet(id_objet)
);

CREATE TABLE donne(
   id_interaction INTEGER,
   id_dialogue INTEGER,
   code_role_quete CHAR(2) ,
   PRIMARY KEY(id_interaction, id_dialogue, code_role_quete),
   FOREIGN KEY(id_interaction) REFERENCES interactions(id_interaction),
   FOREIGN KEY(id_dialogue) REFERENCES dialogue(id_dialogue),
   FOREIGN KEY(code_role_quete) REFERENCES role_interaction(code_role_quete)
);

CREATE TABLE active(
   id_objet INTEGER,
   id_interaction INTEGER,
   code_role_quete CHAR(2) ,
   PRIMARY KEY(id_objet, id_interaction, code_role_quete),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
   FOREIGN KEY(id_interaction) REFERENCES interactions(id_interaction),
   FOREIGN KEY(code_role_quete) REFERENCES role_interaction(code_role_quete)
);

CREATE TABLE constitue(
   id_interaction INTEGER,
   id_objectif INTEGER,
   parametre VARCHAR(255) ,
   PRIMARY KEY(id_interaction, id_objectif),
   FOREIGN KEY(id_interaction) REFERENCES interactions(id_interaction),
   FOREIGN KEY(id_objectif) REFERENCES objectif(id_objectif)
);

CREATE TABLE declenche(
   id_interaction INTEGER,
   id_recompense INTEGER,
   id_objectif INTEGER,
   PRIMARY KEY(id_interaction, id_recompense, id_objectif),
   FOREIGN KEY(id_interaction) REFERENCES interactions(id_interaction),
   FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense),
   FOREIGN KEY(id_objectif) REFERENCES objectif(id_objectif)
);

CREATE TABLE accorde(
   id_objet INTEGER,
   id_recompense INTEGER,
   quantite INTEGER,
   PRIMARY KEY(id_objet, id_recompense),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
   FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense)
);

CREATE TABLE mene(
   id_dialogue_Suivant INTEGER,
   id_dialogue_Precedent INTEGER,
   Choix TEXT NOT NULL,
   PRIMARY KEY(id_dialogue_Suivant, id_dialogue_Precedent),
   FOREIGN KEY(id_dialogue_Suivant) REFERENCES dialogue(id_dialogue),
   FOREIGN KEY(id_dialogue_Precedent) REFERENCES dialogue(id_dialogue)
);

CREATE TABLE considere(
   id_personnage_Juger INTEGER,
   id_personnage_Juge INTEGER,
   aggressif BOOLEAN NOT NULL,
   PRIMARY KEY(id_personnage_Juger, id_personnage_Juge),
   FOREIGN KEY(id_personnage_Juger) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_personnage_Juge) REFERENCES personnage(id_personnage)
);

CREATE TABLE definit(
   id_personnage INTEGER,
   Id_Statistique INTEGER,
   Valeur INTEGER,
   Valeur_max INTEGER,
   PRIMARY KEY(id_personnage, Id_Statistique),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(Id_Statistique) REFERENCES caracteristique(Id_Statistique)
);

CREATE TABLE relie(
   id_objet_porte_entre INTEGER,
   id_objet_porte_sortie INTEGER,
   PRIMARY KEY(id_objet_porte_entre, id_objet_porte_sortie),
   FOREIGN KEY(id_objet_porte_entre) REFERENCES objet(id_objet),
   FOREIGN KEY(id_objet_porte_sortie) REFERENCES objet(id_objet)
);

CREATE TABLE positionne(
   id_personnage INTEGER,
   coordonee GEOMETRY,
   PRIMARY KEY(id_personnage, coordonee),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(coordonee) REFERENCES position_s(coordonee)
);
