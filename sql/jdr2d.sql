CREATE TABLE compte_utilisateur(
   id_compte_utilisateur COUNTER,
   pseudo_compte VARCHAR(255) NOT NULL,
   courriel_compte VARCHAR(255) NOT NULL,
   mdp_compte VARCHAR(255) NOT NULL,
   valide VARCHAR(50) NOT NULL,
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
   emplacement VARCHAR(255),
   PRIMARY KEY(id_type_objet),
   UNIQUE(nom_type_objet)
);

CREATE TABLE interactions(
   id_interaction COUNTER,
   prerequis_interaction VARCHAR(255),
   nom_interaction VARCHAR(255),
   description_interaction VARCHAR(255),
   completion_interaction BYTE NOT NULL >0 AND <100,
   PRIMARY KEY(id_interaction)
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
   PRIMARY KEY(id_etat_personnage),
   UNIQUE(nom_etat)
);

CREATE TABLE type_aptitude(
   id_type_aptitude COUNTER,
   nom_type_aptitude VARCHAR(255) NOT NULL,
   PRIMARY KEY(id_type_aptitude),
   UNIQUE(nom_type_aptitude)
);

CREATE TABLE role_interaction(
   code_role_quete CHAR(2),
   nom_role_quete VARCHAR(255) NOT NULL,
   PRIMARY KEY(code_role_quete),
   UNIQUE(nom_role_quete)
);

CREATE TABLE Caractéristique(
   Id_Statistique COUNTER,
   nom_caracteristique VARCHAR(255),
   description_caracteristique TEXT,
   PRIMARY KEY(Id_Statistique)
);

CREATE TABLE position_s(
   coordonee TEXT,
   PRIMARY KEY(coordonee)
);

CREATE TABLE personnage(
   id_personnage COUNTER,
   nom_personnage VARCHAR(255) NOT NULL,
   niveau_personnage BYTE NOT NULL,
   direction VARCHAR(50) NOT NULL,
   alignement VARCHAR(255),
   monnaie BIGINT,
   vivant LOGICAL NOT NULL,
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
   effet_aptitude VARCHAR(255),
   prerequis_aptitude VARCHAR(255),
   id_type_aptitude INT NOT NULL,
   PRIMARY KEY(id_aptitude),
   FOREIGN KEY(id_type_aptitude) REFERENCES type_aptitude(id_type_aptitude)
);

CREATE TABLE objet(
   id_objet COUNTER,
   nom_objet VARCHAR(255) NOT NULL,
   statistique_objet VARCHAR(255),
   equipe LOGICAL,
   ouvert LOGICAL,
   description_objet TEXT,
   prix INT,
   id_type_objet INT NOT NULL,
   PRIMARY KEY(id_objet),
   FOREIGN KEY(id_type_objet) REFERENCES type_objet(id_type_objet)
);

CREATE TABLE Dialogue(
   id_dialogue COUNTER,
   Contenu_dialogue TEXT NOT NULL,
   id_personnage INT,
   PRIMARY KEY(id_dialogue),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage)
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

CREATE TABLE instance(
   id_objet INT,
   id_lieu INT,
   coordonee TEXT,
   quantite INT,
   PRIMARY KEY(id_objet, id_lieu, coordonee),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
   FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu),
   FOREIGN KEY(coordonee) REFERENCES position_s(coordonee)
);

CREATE TABLE possede(
   id_personnage INT,
   id_objet INT,
   quantite INT,
   PRIMARY KEY(id_personnage, id_objet),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet)
);

CREATE TABLE contient(
   contenant INT,
   id_objet_contenu INT,
   Quantite VARCHAR(50),
   PRIMARY KEY(contenant, id_objet_contenu),
   FOREIGN KEY(contenant) REFERENCES objet(id_objet),
   FOREIGN KEY(id_objet_contenu) REFERENCES objet(id_objet)
);

CREATE TABLE donne(
   id_interaction INT,
   id_dialogue INT,
   code_role_quete CHAR(2),
   PRIMARY KEY(id_interaction, id_dialogue, code_role_quete),
   FOREIGN KEY(id_interaction) REFERENCES interactions(id_interaction),
   FOREIGN KEY(id_dialogue) REFERENCES Dialogue(id_dialogue),
   FOREIGN KEY(code_role_quete) REFERENCES role_interaction(code_role_quete)
);

CREATE TABLE active(
   id_objet INT,
   id_interaction INT,
   code_role_quete CHAR(2),
   PRIMARY KEY(id_objet, id_interaction, code_role_quete),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
   FOREIGN KEY(id_interaction) REFERENCES interactions(id_interaction),
   FOREIGN KEY(code_role_quete) REFERENCES role_interaction(code_role_quete)
);

CREATE TABLE constitue(
   id_interaction INT,
   id_objectif INT,
   parametre VARCHAR(255),
   PRIMARY KEY(id_interaction, id_objectif),
   FOREIGN KEY(id_interaction) REFERENCES interactions(id_interaction),
   FOREIGN KEY(id_objectif) REFERENCES objectif(id_objectif)
);

CREATE TABLE declenche(
   id_interaction INT,
   id_recompense INT,
   id_objectif INT,
   PRIMARY KEY(id_interaction, id_recompense, id_objectif),
   FOREIGN KEY(id_interaction) REFERENCES interactions(id_interaction),
   FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense),
   FOREIGN KEY(id_objectif) REFERENCES objectif(id_objectif)
);

CREATE TABLE accorde(
   id_objet INT,
   id_recompense INT,
   quantite INT,
   PRIMARY KEY(id_objet, id_recompense),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
   FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense)
);

CREATE TABLE Mene(
   id_dialogue_Suivant INT,
   id_dialogue_Precedent INT,
   Choix TEXT NOT NULL,
   PRIMARY KEY(id_dialogue_Suivant, id_dialogue_Precedent),
   FOREIGN KEY(id_dialogue_Suivant) REFERENCES Dialogue(id_dialogue),
   FOREIGN KEY(id_dialogue_Precedent) REFERENCES Dialogue(id_dialogue)
);

CREATE TABLE Considere(
   id_personnage_Juger INT,
   id_personnage_Juge INT,
   aggressif LOGICAL NOT NULL,
   PRIMARY KEY(id_personnage_Juger, id_personnage_Juge),
   FOREIGN KEY(id_personnage_Juger) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_personnage_Juge) REFERENCES personnage(id_personnage)
);

CREATE TABLE definit(
   id_personnage INT,
   Id_Statistique INT,
   Valeur INT,
   Valeur_max INT,
   PRIMARY KEY(id_personnage, Id_Statistique),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(Id_Statistique) REFERENCES Caractéristique(Id_Statistique)
);

CREATE TABLE relie(
   id_objet_porte_entre INT,
   id_objet_porte_sortie INT,
   PRIMARY KEY(id_objet_porte_entre, id_objet_porte_sortie),
   FOREIGN KEY(id_objet_porte_entre) REFERENCES objet(id_objet),
   FOREIGN KEY(id_objet_porte_sortie) REFERENCES objet(id_objet)
);

CREATE TABLE positionne(
   id_personnage INT,
   coordonee TEXT,
   PRIMARY KEY(id_personnage, coordonee),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
   FOREIGN KEY(coordonee) REFERENCES position_s(coordonee)
);
