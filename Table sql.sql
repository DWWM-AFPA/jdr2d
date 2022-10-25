
CREATE TABLE compte_utilisateur (   
    id_compte_utilisateur COUNTER, 
    pseudo_compte VARCHAR(255) NOT NULL UNIQUE,
    courriel_compte VARCHAR(255) NOT NULL UNIQUE,
    mdp_compte VARCHAR(255) NOT NULL,
    valide VARCHAR(50), 
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
