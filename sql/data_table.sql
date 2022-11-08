-- TABLE RACE (id_race,nom_race,description_race,jouable)

INSERT INTO race(id_race,nom_race,description_race,jouable) 
VALUES
(1,'Humains','Ambitieux, parfois héroïques, mais toujours confiants, les humains sont capables de travailler ensemble pour atteindre des objectifs communs, ce qui fait d’eux une puissance à ne pas négliger. Ils ont une espérance de vie réduite par rapport aux autres races, mais leur énergie sans limites et leurs passions leur permettent d’accomplir beaucoup de choses malgré leur brève existence.',true),
(2,'Nains','On pense souvent que ces défenseurs des villes montagneuses petits et râblés sont sévères et dépourvus de tout sens de l’humour. Ils sont connus pour être des grand industriels dont les produit sont toujours d''une grande qualité et pour avoir une affinité particulière avec les richesses cachées dans les entrailles de la terre. Les nains ont aussi tendance à s’isoler et à se replier sur leurs traditions, au point de sombrer parfois dans la xénophobie.',true),
(3,'Elfes','Grands, nobles et souvent hautains, les elfes à la longue espérance de vie sont les maîtres subtils de la nature. Ils excellent dans les arts magiques et utilisent souvent leur lien inné avec la nature pour inventer de nouveaux sorts et fabriquer de merveilleux objets qui, comme leurs créateurs, semblent presque hors d’atteinte des ravages du temps. Les elfes forment une race secrète et souvent introvertie, qui donne parfois l’impression d’être imperméable aux suppliques d’autrui.',false),
(9,'Orques','Sauvages, brutaux et résistants, les orques sont souvent le fléau des lointaines étendues naturelles et des grottes profondes. Beaucoup deviennent de redoutables mercenaires, du fait de leur stature musculeuse et de leur tendance à entrer dans des rages sanglantes. Les quelques rares qui parviennent à contrôler leur soif de sang font d’excellents aventuriers.',true),
(14,'Rat','',false),
(15,'Chauve souris','',false);

-- TABLE LIEU (id_lieu,nom_lieu, description_lieu,carte_lieu)

INSERT INTO lieu(id_lieu,nom_lieu, description_lieu,carte_lieu)
VALUES
(1,'Bad-town','Ville des orcs','à venir …'),
(11,'la reine','Lieu de combat n°1','à venir …'),
(12,'la bête','Centre de pari sur les combats','à venir …'),
(13,'scissor palace','Un casino','à venir …'),
(14,'lennybar','La taverne, idéal pour s''amuser','à venir …'),
(2,'Profit-city','Ville des humains','à venir …'),
(21,'black market','Le marché : pour acheter, vendre et échanger','à venir …'),
(22,'lehman sisters','La banque','à venir …'),
(23,'place-2-B','La place centrale de la ville','à venir …'),
(24,'treump shop','Magasin d''armures','à venir …'),
(3,'Nainportnawak','Ville des nains','à venir …'),
(30,'maxilase','Magasin de potions','à venir …'),
(31,'flunchbar','La taverne des nains, l''alccol coule à flot !','à venir …'),
(32,'park in son','Joli parc pour ce détendre','à venir …'),
(33,'in & out','Restaurant de spécialités locales','à venir …'),
(4,'Elf village','Ville des elfes','à venir …'),
(40,'msncircus','Place pour discuter et faire des rencontres','à venir …'),
(41,'pirate search','Zone pour aller chercher de nouvelles quêtes','à venir …'),
(42,'daddy awards','Centre de récompences pour les quêtes','à venir …'),
(43,'potatoe valley','Potager de légumes','à venir …'),
(5,'La croisée','Là où tout les chemins se croisent','à venir …');
	
-- TABLE OBJET (id_objet,nom_objet,statistique_objet,equipe,ouvert,description_objet,prix,poids)

INSERT INTO objet(id_objet,nom_objet,statistique_objet,equipe,ouvert,description_objet,prix,poids)
VALUES 
(1,'fusil Lorrain','+1 force',true,true,'Fusil légendaire de Lorraine, capable d''envoyer des fuseaux a 50 km/h',50,1),		
(2,'paprik''arme','+2 force',true,true,'Le piment le plus fort de tous les héros',25,2),		
(3,'lance saucisse','+3 force',true,true,'De son vrai nom große würst',30,3),		
(4,'Patator','+4 force',true,true,'Le traditionnel lance patate Russe utiliser par Poutine en Ukraine',35,4),		
(5,'arbalais','+5 force',true,true,'Monsieur Potter, merci de ramener le balais',20,5),		
(6,'la boule de pétoncle','+6 force',true,true,'Célébre boule du comédon Cousteau',15,6),		
(7,'pestolet','+7 force',true,true,'Ajouter du basilic, de l''ail et des François pigfalse et du parmesan on obtient cette arme légendaire',60,7),		
(8,'couperet bretzel','+2 force',true,true,'Apparut en Alsace pendant la période des spaetzle du cervelas et de la choucroute en l''an 69',40,1),		
(9,'rôtisseur','+4 force',true,true,'Célèbre arme du colonel Sander',50,2),		
(10,'la pelle forte','+6 force',true,true,'Merci Berny pour votre invention autoroutiere',30,3),		
(11,'batte ail','+8 force',true,true,'Arme favorite de Blade',35,4),		
(12,'la fausse croix','+10 force',true,true,'Arme légendaire de nazareth',25,5),		
(13,'poing chope','+1 force',true,true,'Mélange entre chopine et poing ricain',10,2),		
(14,'dague Ober','+2 force',true,true,'Mais qui l''a mise à l''envers ?',15,3),		
(15,'ctruelletau','+3 force',true,true,'Crustacé qui sent la marais',20,4),		
(16,'dardvador','+4 force',true,true,'Aussi rouge que le sabre',40,5),		
(17,'porc table','+5 force',true,true,'Mi porc, mi ours, mi homme,,, Je m''égare il est seulement mi table',35,6),		
(18,'jason tatane','+8 force',true,true,'Pour les puristes de la bagarre',60,7),		
(19,'bonnet m','+1 agilité',true,true,'Le sugar daddy cool des chapias',10,1),		
(20,'casquette a pointe','+2 agilité',true,true,'Célèbre casquette germanique, utilisée dans les concours de lancer de pomme',25,2),		
(21,'k-lotte','+3 agilité',true,true,'Arme célèbre de la confrérie Lopez, 100% cuivre',30,3),		
(22,'kippab','+4 agilité',true,true,'Salade tomate oigfalse du chapeau ',25,4),		
(23,'baie raie','+5 agilité',true,true,'Le fruit qui résume bien la situation " l''abricôt"',35,5),		
(24,'plas''thon','+1 agilité',true,true,'Construite en boite de petit navire',50,2),		
(25,'plas''tèque','+2 agilité',true,true,'Manger 5 fruits et légumes par jours',40,3),		
(26,'côte de beauf','+3 agilité',true,true,'Parfait pour les soirées tuning',80,4),		
(27,'l''ainée','+4 agilité',true,true,'Allez voir sur wikipédia',65,5),		
(28,'pull ovaire','+5 agilité',true,true,'Bien mieux que le col roulé',75,6),		
(29,'gants stères','+1 agilité',true,true,'Parfait pour ramasser le bois',20,1),		
(30,'mie Teigne','+2 agilité',true,true,'Boulanger tétu de renommé',15,2),		
(31,'bollet rouge','+3 agilité',true,true,'Célébre coiffe du comédon Cousteau',25,3),		
(32,'croque mie teigne','+4 agilité',true,true,'Croque monsieur du boulanger',15,4),		
(33,'gant de toilette','+5 agilité',true,true,'Progéniture de Servietski',20,5),		
(34,'bretelle','+1 agilité',true,true,'Et porte jartelle',30,2),		
(35,'bas thon','+2 agilité',true,true,'Le leggings du comédon Cousteau',40,3),		
(36,'benne laden','+3 agilité',true,true,'Enfilez vos deux jambes dedans',55,4),		
(37,'beer muda','+4 agilité',true,true,'Mi jaune mi blanc',60,5),		
(38,'fûtal','+5 agilité',true,true,'Parfait pour protéger votre trou du fût',75,6),		
(39,'crocs','+1 agilité',true,true,'Style hollandais, chaussette claquette',15,1),		
(40,'bas bouche','+2 agilité',true,true,'Babooshka, babooshka, babooshka ja, ja',10,2),		
(41,'adaddas','+3 agilité',true,true,'Des contre façons efficaces',80,3),		
(42,'les talons','+4 agilité',true,true,'Dixit the Italian Stallion',65,4),		
(43,'musse tongue','+5 agilité',true,true,'Aussi rapide que l''original',35,5),		
(44,'pinte','+2 esquive',true,true,'Je vous remettrais bien la petite sœur?',5,2),		
(45,'tord boyaux','+50 mana / -50 pv',true,true,'Très utile pour les nœuds de huit',10,3),		
(46,'Sheba','+50 pv / -50 mana',true,true,'Alain sheba, un gros nul',10,3),		
(47,'shot','+25 pv',true,true,'Boisson chaude de charlie Sheen',8,3),		
(48,'grogs','+50 pv',true,true,'Recette mythique des mère grand',7,3),		
(49,'ukranium','+25 mana',true,true,'Très prisé en Russie actuellement',6,3),		
(50,'muscat death','-50 mana',true,true,'Tu bois tu meurts',8,3),		
(51,'houmous tache','-2 dodge',true,true,'Repas favoris de Staline',9,3),		
(52,'tsar tziki','-5 dodge',true,true,'Sauce favorite de Lenine',4,3),		
(53,'potion magique','/2 magic',true,true,'Remet les idées fixes',15,3),		
(54,'asperule','/2 pv',true,true,'C''est comme le jagermeister mais en plus mauvais',3,2),		
(55,'sauce dallas','*2 magic',true,true,'Sur les boulettes ?',6,2),		
(56,'sauce biggy','*2 force',true,true,'Avec ou sans frites ?',4,2),		
(57,'sauce hannibal','*2 pv',true,true,'Pour les Lecter vegan',5,2),		
(58,'sauce blanche','*2 dodge',true,true,'Très populaire chez les albinos du RN',3,3),		
(59,'barbie turique','poisoned',true,true,'Le Ken lubrique',4,1),		
(60,'amnesia','stunt',true,true,'A ne surtout pas fumer',7,1),		
(61,'algoflash','blind',true,true,'L''algorithme de toto',10,2),		
(62,'le sang du christ','blessed',true,true,'Tu ne trouves pas ça assez catholique ?',15,1),		
(63,'valium','sleep',true,true,'Bienvenue le marchand de sable',6,1),		
(64,'bezoard','heal poisoned',true,true,'Accumulations très denses de matière partiellement digérée ou false digérée pouvant se coincer dans l''estomac ou les intestins',7,1),		
(65,'collyre','heal blind',true,true,'Lorsque vous êtes aveugles, bien viser les yeux',5,3),		
(66,'schneck','heal stunt',true,true,'Très bon pain aux raisins de Moselle',8,1),		
(67,'epinephrine','heal sleep',true,true,'Impécable pour l''hyper tension',12,2),		
(68,'vega missile','*2 vitesse d''attaque',true,true,'Pour être satélisé',20,1),		
(69,'red boule','/2 vitesse d''attaque',true,true,'La contre façons',12,1),		
(70,'bipbip','*2 vitesse de déplacement',true,true,'A consommer dans un Saddam Usain bol',15,3),		
(71,'le coyotte','/2 vitesse de déplacement',true,true,'Le seul loup avec un frain à main',9,1),		
(72,'Boubourse','',false,true,'Contient beaucoup de pièces d''or !',1000,1),		
(73,'houblon','',false,false,'Objet pour la quête 1',1,0),		
(74,'fut','',false,false,'Objet pour la quête 1',3,0),		
(75,'sachet','',false,false,'Objet pour la quête 2',1,0),		
(76,'mur','',false,false,'Obstacle infranchissable',null,null),		
(77,'banc','',false,false,'Objet décoratif',null,null),		
(78,'table','',false,false,'Objet décoratif',null,null),		
(79,'fleurs','',false,false,'Objet décoratif',null,null),		
(80,'rochers','',false,false,'Objet décoratif',null,null),		
(81,'lampadaire','',false,false,'Objet décoratif',null,null),		
(82,'statue','',false,false,'Objet décoratif',null,null),		
(83,'tente','',false,false,'Objet décoratif',null,null),		
(84,'fontaine','',false,false,'Objet décoratif',null,null),		
(85,'petite maison','',false,false,'Objet décoratif',null,null),		
(86,'mur de berlin','',false,false,'Obstacle infranchissable avant 1991',null,null),		
(87,'seau','',false,false,'Objet décoratif',null,null),		
(88,'clôture','',false,false,'Barrière infranchissable',null,null);	


-- TABLE TYPE_OBJET (id_type_objet,nom_type_objet,emplacement_objet)

INSERT INTO type_objet(id_type_objet,nom_type_objet,emplacement_objet)
VALUES 
(1,'arme distance','inventaire'),
(2,'arme à 2 mains','inventaire'),
(3,'arme cac','inventaire'),
(4,'casque','inventaire'),
(5,'armure','inventaire'),
(6,'gants','inventaire'),
(7,'pantalons','inventaire'),
(8,'chaussures','inventaire'),
(9,'potions','inventaire'),
(10,'monnaies','inventaire'),
(11,'objet de quetes','inventaire'),
(12,'décor','sol');


-- TABLE CARACTERISE ()

INSERT INTO caracterise(id_objet,id_type_objet) 
SELECT objet.id_objet, type_objet.id_type_objet;
JOIN 

SELECT id_objet FROM objet JOIN id_objet ON caracterise = id_objet;

INSERT INTO caracterise(id_type_objet)
SELECT id_type_objet FROM type_objet;

SELECT weather.city, weather.temp_lo, weather.temp_hi,
       weather.prcp, weather.date, cities.location




       SELECT objet.nom_objet, nom_type_objet 
        FROM objet 
            JOIN type_objet 
            ON  id_type_objet = id_objet;