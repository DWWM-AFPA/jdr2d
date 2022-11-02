
CREATE TABLE compte_utilisateur (   
    id_compte_utilisateur COUNTER, 
    pseudo_compte VARCHAR(255) NOT NULL UNIQUE,
    courriel_compte VARCHAR(255) NOT NULL UNIQUE,
    mdp_compte VARCHAR(255) NOT NULL,
    valide BOOLEAN, 
    PRIMARY KEY(id_compte_utilisateur) );

CREATE TABLE race (   
    id_race COUNTER, 
    nom_race VARCHAR(255) NOT NULL UNIQUE, 
    description_race TEXT, 
    jouable_race LOGICAL NOT NULL, 
    PRIMARY KEY(id_race) );

CREATE TABLE classe ( 
    id_classe COUNTER, 
    nom_classe VARCHAR(255) NOT NULL UNIQUE, 
    description_classe TEXT, 
    jouable_classe BOOLEAN NOT NULL, 
    PRIMARY KEY(id_classe) );

CREATE TABLE objet 
   ( id_objet COUNTER, 
   nom_objet VARCHAR(255) NOT NULL, 
   statistique_objet VARCHAR(255) , 
   equipe BOOLEAN, 
   ouvert BOOLEAN, 
   description_objet TEXT, 
   PRIMARY KEY(id_objet) );

CREATE TABLE lieu
 ( id_lieu COUNTER, 
 nom_lieu VARCHAR(255), 
 description_lieu VARCHAR(255) , 
 carte_lieu TEXT, 
 PRIMARY KEY(id_lieu) );

 CREATE TABLE type_objet 
 ( id_type_objet COUNTER, 
 nom_type_objet VARCHAR(255) NOT NULL UNIQUE, 
 emplacement_objet VARCHAR(255) NOT NULL, 
 poids_objet VARCHAR(255) NOT NULL, 
 PRIMARY KEY(id_type_objet) );

  CREATE TABLE quete 
 ( id_quete COUNTER, 
 prerequis_quete VARCHAR(255), 
 nom_quete VARCHAR(255), 
 description_quete VARCHAR(255), 
 PRIMARY KEY(id_quete) );

   CREATE TABLE recompense 
 ( id_recompense COUNTER, 
 nom_recompense VARCHAR(255) NOT NULL, 
 description_recompense TEXT, 
  PRIMARY KEY(id_recompense) );

  CREATE TABLE objectif
 ( id_objectif COUNTER, 
 nom_objectif VARCHAR(255) NOT NULL, 
 description_objectif TEXT, 
 validation_objectif VARCHAR(255) NOT NULL,
   PRIMARY KEY(id_objectif) );

 CREATE TABLE etat_personnage 
  ( id_etat_personnage COUNTER, 
 nom_etat VARCHAR(50) NOT NULL UNIQUE, 
 effet_etat VARCHAR(255) NOT NULL, 
 description_etat VARCHAR(255) , 
 PRIMARY KEY(id_etat_personnage) );

 CREATE TABLE type_aptitude 
  ( id_type_aptitude COUNTER, 
 nom_type_aptitude VARCHAR(255) NOT NULL, 
 effet_etat VARCHAR(255) NOT NULL, 
 PRIMARY KEY(id_type_aptitude) );

  CREATE TABLE role_quete 
  ( code_role_quete CHAR(2), 
 nom_role_quete VARCHAR(255) NOT NULL UNIQUE, 
  PRIMARY KEY(code_role_quete) );

    CREATE TABLE caracteristique  
  ( id_statistique COUNTER, 
    nom_caracteristique VARCHAR(255), 
    description_caracteristique TEXT,
  PRIMARY KEY(id_statistique) );

     CREATE TABLE position_s  
  ( coordonnee TEXT, 
   
  PRIMARY KEY(coordonnee) );

  CREATE TABLE personnage 
  ( id_personnage COUNTER, 
  nom_personnage VARCHAR(255),
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
  FOREIGN KEY(id_lieu) REFERENCES race(id_lieu),
   );

   CREATE TABLE aptitude 
   ( id_aptitude COUNTER,
   nom_aptitude VARCHAR(50),
   effet_aptitude VARCHAR(255),
   prerequis_aptitude VARCHAR(255),
   id_type_aptitude INT NOT NULL,
   PRIMARY KEY(id_aptitude),
   FOREIGN KEY(id_type_aptitude) REFERENCES type_aptitude(id_type_aptitude)  
   );

   CREATE TABLE dialogue (
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

CREATE TABLE caracterise(
   id_objet INT,
   id_type_objet INT,
   PRIMARY KEY(id_objet, id_type_objet),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
   FOREIGN KEY(id_type_objet) REFERENCES type_objet(id_type_objet)
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


CREATE TABLE possede (
  id_personnage INT,
  id_objet INT,
  quantite INT,
  PRIMARY KEY(id_personnage,id_objet),
  FOREIGN KEY(id_personnage) REFERENCES PERSONNAGE(id_personnage),
  FOREIGN KEY(id_objet) REFERENCES OBJET(id_objet));

CREATE TABLE contient (
  contenant INT,
  id_objet_contenu INT,
  Quantité VARCHAR(50),
   PRIMARY KEY(contenant, id_objet_contenu),
   FOREIGN KEY(contenant) REFERENCES objet(id_objet),
   FOREIGN KEY(id_objet_contenu) REFERENCES objet(id_objet)
) ;

CREATE TABLE donne(
   id_quete INT,
   id_dialogue INT,
   code_role_quete CHAR(2),
   PRIMARY KEY(id_quete, id_dialogue, code_role_quete),
   FOREIGN KEY(id_quete) REFERENCES quete(id_quete),
   FOREIGN KEY(id_dialogue) REFERENCES Dialogue(id_dialogue),
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
   quantite INT,
   PRIMARY KEY(id_objet, id_recompense),
   FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
   FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense)
);

CREATE TABLE Mene(
   id_dialogue_Suivant INT,
   id_dialogue_Precedent INT,
   Choix TEXT,
   PRIMARY KEY(id_dialogue_Suivant, id_dialogue_Precedent),
   FOREIGN KEY(id_dialogue_Suivant) REFERENCES Dialogue(id_dialogue),
   FOREIGN KEY(id_dialogue_Precedent) REFERENCES Dialogue(id_dialogue)
);

CREATE TABLE Considere(
   id_personnage_Juger INT,
   id_personnage_Juge INT,
   Valeur_attitudes VARCHAR(50),
   PRIMARY KEY(id_personnage_Juger, id_personnage_Juge),
   FOREIGN KEY(id_personnage_Juger) REFERENCES personnage(id_personnage),
   FOREIGN KEY(id_personnage_Juge) REFERENCES personnage(id_personnage)
);

CREATE TABLE definit ( 

  id_personnage INT,
  id_Statistique INT,
  Valeur INT,
  Valeur_max INT,
  PRIMARY KEY(id_personnage, id_Statistique),
  FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
  FOREIGN KEY(id_statistique) REFERENCES Caracteristique(id_Statistique)

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

























   





