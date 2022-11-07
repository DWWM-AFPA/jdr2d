--FOREIGN KEY 0

CREATE TABLE compte_utilisateur(
        id_compte_utilisateur SERIAL PRIMARY KEY, 
        pseudo_compte VARCHAR(255) NOT NULL UNIQUE, 
        mdp_compte VARCHAR(255) NOT NULL, 
        courriel_compte VARCHAR(255) NOT NULL UNIQUE, 
        valid BOOLEAN NOT NULL DEFAULT 'f'
);

CREATE TABLE type_aptitude(
        id_type_aptitude SERIAL PRIMARY KEY,
        nom_type_aptitude VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE classe(
        id_classe SERIAL PRIMARY KEY,
        nom_classe VARCHAR(255) NOT NULL UNIQUE?
        jouable BOOLEAN NOT NULL 't'
);

CREATE TABLE id_type_objet(
        id_type_objet SERIAL PRIMARY KEY,
        nom_type_objet VARCHAR(255) NOT NULL UNIQUE,
        emplacement_objet VARCHAR(255) NOT NULL UNIQUE,
        poids_objet VARCHAR(255) NOT NULL
); 

CREATE TABLE objet(
        id_objet SERIAL PRIMARY KEY,
        nom_objet VARCHAR(255) NOT NULL,
        statistique_objet VARCHAR(255),
        equipe BOOLEAN,
        ouvert BOOLEAN,
        description_objet TEXT,
        prix INT
);

CREATE TABLE caracteristique(
        id_statistique SERIAL PRIMARY KEY,
        nom_caracteristique VARCHAR(255),
        description_caracteristique TEXT
);

CREATE TABLE race(
        id_race SERIAL PRIMARY KEY,
        nom_race VARCHAR(255) NOT NULL UNIQUE,
        description_race TEXT,
        jouable BOOLEAN NOT NULL
);

CREATE TABLE instance commerce(
        id_instance_commerce VARCHAR(50) PRIMARY KEY
);

CREATE TABLE etat_personnage(
        id_etat_personnage SERIAL PRIMARY KEY,
        nom_etat VARCHAR(50) NOT NULL UNIQUE,
        effet_etat VARCHAR(255) NOT NULL UNIQUE,
        description_etat VARCHAR(255)
);

CREATE TABLE role_quete(
        code_role_quete CHAR(2) PRIMARY KEY,
        nom_role_quete VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE position_s(
        coordonee TEXT PRIMARY KEY
);

CREATE TABLE lieu(
        id_lieu SERIAL PRIMARY KEY,
        nom_lieu VARCHAR(255),
        description_lieu VARCHAR(255),
        carte_lieu TEXT
);

CREATE TABLE quete(
        id_quete SERIAL PRIMARY KEY,
        prerequis_quete VARCHAR(255),
        nom_quete VARCHAR(255),
        description_quete VARCHAR(255)  
);

CREATE TABLE objectif(
        id_objectif SERIAL PRIMARY KEY,
        nom_objectif VARCHAR(255) NOT NULL UNIQUE,
        description_objectif TEXT,
        validation_objectif VARCHAR(255) NOT NULL
);

CREATE TABLE recompense(
        id_recompense SERIAL PRIMARY KEY,
        nom_recompense VARCHAR(255) NOT NULL UNIQUE,
        description_recompense TEXT
);

--FOREIGN KEY 1

CREATE TABLE dialogue(
        id_dialogue SERIAL PRIMARY KEY,
        contenu_dialogue TEXT,
        FOREIGN KEY(id_personnage),
        REFERENCES personnage(id_personnage)
)

CREATE TABLE aptitude(
        id_aptitude SERIAL PRIMARY KEY,
        nom_aptitude VARCHAR(255) NOT NULL UNIQUE,
        effet_aptitude VARCHAR(255),
        prerequis_aptitude VARCHAR(255),
        id_type_aptitude INT NOT NULL,
        FOREIGN KEY(id_type_aptitude)
        REFERENCES type_aptitude(id_type_aptitude)
);

--FOREIGN KEY 2

CREATE TABLE maitrise(
        (id_personnage, id_aptitude) PRIMARY KEY,
        id_personnage INT,
        id_aptitude INT,
        pourcentage_maitrise BYTE NOT NULL,
        FOREIGN KEY(id_personnage), 
        REFERENCES personnage(id_personnage),
        FOREIGN KEY(id_aptitude), 
        REFERENCES aptitude(id_aptitude)
);

CREATE TABLE appartient(
        (id_personnage, id_classe) PRIMARY KEY,
        id_personnage INT,
        id_classe INT,
        FOREIGN KEY(id_personnage), 
        REFERENCES personnage(id_personnage),
        FOREIGN KEY(id_classe), 
        REFERENCES classe(id_classe)
);

CREATE TABLE definit(
        (id_personnage, id_statistique) PRIMARY KEY,
        id_personnage INT,
        id_Statistique INT,
        valeur INT,
        valeur_max INT,
        FOREIGN KEY(id_personnage), 
        REFERENCES personnage(id_personnage),
        FOREIGN KEY(id_statistique), 
        REFERENCES Caractéristique(id_statistique)
);

CREATE TABLE considere(
        (id_personnage_juger, id_personnage_juge) PRIMARY KEY,
        id_personnage_juger INT,
        id_personnage_juge INT,
        valeur_attitudes VARCHAR(50),
        FOREIGN KEY(id_personnage_juger), 
        REFERENCES personnage(id_personnage),
        FOREIGN KEY(id_personnage_juge), 
        REFERENCES personnage(id_personnage)
);

CREATE TABLE possede(
        (id_personnage, id_objet) PRIMARY KEY,
        id_personnage INT,
        id_objet INT,
        quantite INT,
        FOREIGN KEY(id_personnage),
        REFERENCES personnage(id_personnage),
        FOREIGN KEY(id_objet),
        REFERENCES objet(id_objet)
);

CREATE TABLE caracterise(
        (id_objet, id_type_objet) PRIMARY KEY,
        id_objet INT,
        id_type_objet INT,
        FOREIGN KEY(id_objet), 
        REFERENCES objet(id_objet),
        FOREIGN KEY(id_type_objet), 
        REFERENCES type_objet(id_type_objet)
);

CREATE TABLE contient(
        (contenant, id_objet_contenu) PRIMARY KEY,
        contenant INT,
        id_objet_contenu INT,
        Quantite VARCHAR(50),
        FOREIGN KEY(contenant),
        REFERENCES objet(id_objet),
        FOREIGN KEY(id_objet_contenu),
        REFERENCES objet(id_objet)
);

CREATE TABLE relie(
        (id_objet_porte_entre, id_objet_porte_sortie) PRIMARY KEY,
        id_objet_porte_entre INT,
        id_objet_porte_sortie INT,
        FOREIGN KEY(id_objet_porte_entre),
        REFERENCES objet(id_objet),
        FOREIGN KEY(id_objet_porte_sortie),
        REFERENCES objet(id_objet)
);

CREATE TABLE affecte(
        (id_personnage, id_etat_personnage) PRIMARY KEY,
        id_personnage INT,
        id_etat_personnage INT,
        FOREIGN KEY(id_personnage),
        REFERENCES personnage(id_personnage),
        FOREIGN KEY(id_etat_personnage),
        REFERENCES etat_personnage(id_etat_personnage)
);

CREATE TABLE mene(
        (id_dialogue_suivant, id_dialogue_precedent) PRIMARY KEY,
        id_dialogue_suivant INT,
        id_dialogue_precedent INT,
        choix TEXT,
        FOREIGN KEY(id_dialogue_suivant),
        REFERENCES dialogue(id_dialogue),
        FOREIGN KEY(id_dialogue_precedent),
        REFERENCES dialogue(id_dialogue)
);

CREATE TABLE initialise(
        (id_dialogue, id_instance_commerce) PRIMARY KEY,
        id_dialogue INT,
        id_instance_commerce VARCHAR(50),
        FOREIGN KEY(id_dialogue),
        REFERENCES dialogue(id_dialogue),
        FOREIGN KEY(id_instance_commerce),
        REFERENCES instance_commerce(id_instance_commerce)
);

CREATE TABLE positionne(
        (id_personnage, coordonee) PRIMARY KEY,
        id_personnage INT,
        coordonee TEXT,
        FOREIGN KEY(id_personnage),
        REFERENCES personnage(id_personnage),
        FOREIGN KEY(coordonee),
        REFERENCES position_s(coordonee)
);

CREATE TABLE accorde(
        (id_objet, id_recompense) PRIMARY KEY,
        id_objet INT,
        id_recompense INT,
        quantite INT,
        FOREIGN KEY(id_objet),
        REFERENCES objet(id_objet),
        FOREIGN KEY(id_recompense),
        REFERENCES recompense(id_recompense)
);

CREATE TABLE constitue(
        (id_quete, id_objectif) PRIMARY KEY,
        id_quete INT,
        id_objectif INT,
        parametre VARCHAR(255),
        FOREIGN KEY(id_quete),
        REFERENCES quete(id_quete),
        FOREIGN KEY(id_objectif),
        REFERENCES objectif(id_objectif)
);

--FOREIGN KEY 3

CREATE TABLE personnage(
        PRIMARY KEY(id_personnage),
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
        FOREIGN KEY(id_race),
        REFERENCES race(id_race),
        FOREIGN KEY(id_compte_utilisateur),
        REFERENCES compte_utilisateur(id_compte_utilisateur),
        FOREIGN KEY(id_lieu),
        REFERENCES lieu(id_lieu)
);

CREATE TABLE achete(
        (id_personnage, id_objet, id_instance_commerce) PRIMARY KEY,
        id_personnage INT,
        id_objet INT,
        id_instance_commerce VARCHAR(50),
        quantite INT,
        FOREIGN KEY(id_personnage),
        REFERENCES personnage(id_personnage),
        FOREIGN KEY(id_objet),
        REFERENCES objet(id_objet),
        FOREIGN KEY(id_instance_commerce),
        REFERENCES instance_commerce(id_instance_commerce)
);

CREATE TABLE vend(
        (id_personnage, id_objet, id_instance_commerce) PRIMARY KEY,
        id_personnage INT,
        id_objet INT,
        id_instance_commerce VARCHAR(50),
        quantite INT,
        FOREIGN KEY(id_personnage),
        REFERENCES personnage(id_personnage),
        FOREIGN KEY(id_objet),
        REFERENCES objet(id_objet),
        FOREIGN KEY(id_instance_commerce),
        REFERENCES instance_commerce(id_instance_commerce)
);

CREATE TABLE donne(
        id_quete INT,
        id_dialogue INT,
        code_role_quete CHAR(2),
        PRIMARY KEY(id_quete, id_dialogue, code_role_quete),
        FOREIGN KEY(id_quete) REFERENCES quete(id_quete),
        FOREIGN KEY(id_dialogue) REFERENCES dialogue(id_dialogue),
        FOREIGN KEY(code_role_quete) REFERENCES role_quete(code_role_quete)
);

CREATE TABLE active(
        (id_objet, id_quete, code_role_quete) PRIMARY KEY,
        id_objet INT,
        id_quete INT,
        code_role_quete CHAR(2),
        FOREIGN KEY(id_objet),
        REFERENCES objet(id_objet),
        FOREIGN KEY(id_quete),
        REFERENCES quete(id_quete),
        FOREIGN KEY(code_role_quete),
        REFERENCES role_quete(code_role_quete)
);

CREATE TABLE declenche(
        (id_quete, id_recompense, id_objectif) PRIMARY KEY,
        id_quete INT,
        id_recompense INT,
        id_objectif INT,
        FOREIGN KEY(id_quete),
        REFERENCES quete(id_quete),
        FOREIGN KEY(id_recompense),
        REFERENCES recompense(id_recompense),
        FOREIGN KEY(id_objectif),
        REFERENCES objectif(id_objectif)
);







