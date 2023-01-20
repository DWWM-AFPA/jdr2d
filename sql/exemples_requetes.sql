INSERT INTO objectif (nom_objectif,description_objectif,validation)
Values
('','Bonne brune','Mr Ohbar vous a demandé de faire de la bière brune','Quetes',0),
('','Coco bel œil','Un vampire terrorise les habitants de la ville (Iggy Pope)','Quetes',0),
('','Le voleur volé','Bernard Tappir vous demande de ramener une boubourse volée par les nains','Quetes',0),
('','Victoria secret','Victoria-Big-B vous demande d''aller chercher ses objets fétiches chez la reine Bours-La','Quetes',0),
('','Un carrosse dans le tunnel','Die Anna se sent lente, elle vous demande d''aller chercher le bipbip ','Quetes',0);



SELECT id_interaction FROM interaction WHERE nom_interaction = 'Bonne brune'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Bonne brune'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Bonne brune'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Coco bel œil'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Coco bel œil'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Coco bel œil'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Le voleur volé'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Le voleur volé'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Le voleur volé'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Victoria secret'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Le voleur volé'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Un carrosse dans le tunnel'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Le voleur volé'
SELECT id_interaction FROM interaction WHERE nom_interaction = 'Le voleur volé'
r


select * --nom_personnage, position, lieu.nom_lieu 
from
    positionne_test
        JOIN personnage 
            ON personnage.id_personnage = positionne_test.id_personnage
        JOIN lieu
            ON lieu.id_lieu = positionne_test.id_lieu
                WHERE personnage.id_personnage =1;



        JOIN interaction AS inter
            ON inter.id_interaction = d.id_interaction



            
insert into exemple (id_exemple,nom_exemple) 
values 
    (select id_lieu FROM lieu where nom_lieu = 'Bad-town',
        'tructruc')


CREATE TABLE positionne_test (
id_personnage INTEGER,
position point,
FOREIGN KEY (id_personnage) REFERENCES personnage(id_personnage));

INSERT INTO positionne_test 
VALUES 
(1,'(25,32)'),
(2,'(33,48)');

--Execute une suite d'instruction construites avec le SELECT via le \gexec
-- SELECT CONCAT('DROP TABLE ',tablename,';') FROM pg_tables WHERE tablename LIKE 'a_test%'\gexec


