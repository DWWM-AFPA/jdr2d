
--INSERT INTO Table type_aptitude
INSERT INTO type_aptitude (id_type_aptitude, nom_type_aptitude)
VALUES (1, 'aptitude de base'),
       (2, 'habilité'),
       (3, 'maitrise des montures'),
       (4, 'sort');

--INSERT INTO Table classe
INSERT INTO classe (id_classe, nom_classe, description_classe, jouable_classe)
VALUES (1, 'guerrier', 'Certains prennent les armes en quête de gloire, de richesse, ou de vengeance. D’autres combattent pour faire leurs preuves, pour protéger des proches
        ou parce qu’ils ne savent rien faire d’autre. Et d’autres encore s’engagent sur la voie des armes pour affûter leur corps et démontrer leur courage lorsque le combat fait rage. 
        Les guerriers, ces seigneurs du champ de bataille, forment un groupe hétéroclite. Ils s’entraînent à manier de nombreuses armes ou juste une, ils apprennent à utiliser 
        les armures de manière optimale, ils suivent les enseignements martiaux de maîtres exotiques et étudient l’art de la guerre. Tout cela pour devenir de véritables armes vivantes. 
        Ces combattants exceptionnels sont plus que de simples brutes : ils révèlent la véritable puissance des armes et transforment de simples morceaux de métal en outils permettant 
        de soumettre des royaumes, de massacrer des monstres et d’unir des armées. Les guerriers sont des soldats, des chevaliers, des chasseurs, des artistes de la guerre et 
        des champions sans égal. Malheur à ceux qui oseraient s’opposer à eux.', TRUE),
       (2, 'espion', 'Pour ceux qui subsistent grâce à leur vivacité d’esprit, la vie est une aventure sans fin. Ces espions qui semblent toujours sentir le danger à l’avance comptent 
       sur leur ruse, leur habileté et leur charme pour tourner le destin à leur avantage. Comme on ne sait jamais à quoi s’attendre, ils se préparent à toutes les éventualités en 
       acquérant de nombreuses compétences et en s’entraînant à devenir de fins manipulateurs, d’agiles acrobates, des ombres discrètes ou encore des experts dans des dizaines d’autres 
       professions ou domaines. ', TRUE),
       (3, 'psyker blanc', 'Les Psykers sont considérés de bien des manières différentes sur les innombrables mondes de l’Imperium. Les planètes les plus primitives voient en eux des 
       chamans et des sorciers. Dans le cas d''un spyker blanc c''est son coté chamanisme qui a prédominé, Les sociétés les plus évoluées ont généralement conscience de leur nature et se 
       réfèrent aux Psykers sous d’autres noms, "les élus", ou les "talentueux". Mais dans presque tous les cas et sur tous les mondes, les Psykers sont craints, pour les ténèbres et le 
       Chaos qu’ils peuvent attirer vers ceux qui les entourent. En effet, les êtres à potentiel psychique tirent leurs pouvoirs des royaumes turbulents du Warp, également désignés comme 
       l’Éther, l’Immaterium ou l’Empyrean, tel qu’il l’est dit dans le Scriptorum Arcanum. Cette dimension alternative est en fait un reflet déformé de l’univers physique connu, un 
       royaume horrifiant, agité par un perpétuel changement qui défie les lois de l’univers matériel et habité par des entités malveillantes. Un Psyker qui utilise ses pouvoirs ouvre un 
       portail entre les deux domaines afin d’attirer l’énergie du Warp en lui-même. Toutefois, s’il est inexpérimenté ou mal préparé, il peut par inadvertance attirer l’attention de 
       Démons qui se jetteront sur lui comme des éphémères sur une flamme. Si l’on en croit les Codex de l’ordre énigmatique des Chasseurs de Démons de l’Ordo Malleus, ces entités du Warp 
       peuvent traverser le lien que le Psyker forme entre les deux dimensions, s’emparant de son esprit et arrachant l’âme de son corps pour la traîner vers une existence de torture 
       éternelle à l’intérieur du Warp. C’est pour cette raison que l’on se réfère parfois à cette dimension en la nommant la Mer des Âmes. Un Démon particulièrement puissant peut se 
       frayer un chemin vers le monde physique en investissant le corps d’un Psyker, puis il se met en devoir d’infliger autant de souffrances que possible à cet univers matériel dans 
       lequel nous vivons. ', TRUE),
       (4, 'psyker noir', 'Les Psykers sont considérés de bien des manières différentes sur les innombrables mondes de l’Imperium. Les planètes les plus primitives voient en eux des 
       chamans et des sorciers. Dans le cas d''un spyker blanc c''est son coté sorcier qui a prédominé, Les sociétés les plus évoluées ont généralement conscience de leur nature et se 
       réfèrent aux Psykers sous d’autres noms, "les élus", ou les "talentueux". Mais dans presque tous les cas et sur tous les mondes, les Psykers sont craints, pour les ténèbres et le 
       Chaos qu’ils peuvent attirer vers ceux qui les entourent. En effet, les êtres à potentiel psychique tirent leurs pouvoirs des royaumes turbulents du Warp, également désignés comme 
       l’Éther, l’Immaterium ou l’Empyrean, tel qu’il l’est dit dans le Scriptorum Arcanum. Cette dimension alternative est en fait un reflet déformé de l’univers physique connu, un 
       royaume horrifiant, agité par un perpétuel changement qui défie les lois de l’univers matériel et habité par des entités malveillantes. Un Psyker qui utilise ses pouvoirs ouvre un 
       portail entre les deux domaines afin d’attirer l’énergie du Warp en lui-même. Toutefois, s’il est inexpérimenté ou mal préparé, il peut par inadvertance attirer l’attention de 
       Démons qui se jetteront sur lui comme des éphémères sur une flamme. Si l’on en croit les Codex de l’ordre énigmatique des Chasseurs de Démons de l’Ordo Malleus, ces entités du Warp 
       peuvent traverser le lien que le Psyker forme entre les deux dimensions, s’emparant de son esprit et arrachant l’âme de son corps pour la traîner vers une existence de torture 
       éternelle à l’intérieur du Warp. C’est pour cette raison que l’on se réfère parfois à cette dimension en la nommant la Mer des Âmes. Un Démon particulièrement puissant peut se 
       frayer un chemin vers le monde physique en investissant le corps d’un Psyker, puis il se met en devoir d’infliger autant de souffrances que possible à cet univers matériel dans 
       lequel nous vivons. ', TRUE);

--INSERT INTO Table race
INSERT INTO race (id_race, nom_race, description_race, jouable_race)
VALUES (1, 'Humains', 'Ambitieux, parfois héroïques, mais toujours confiants, les humains sont capables de travailler ensemble pour atteindre des objectifs communs, ce qui fait d’eux 
       une puissance à ne pas négliger. Ils ont une espérance de vie réduite par rapport aux autres races, mais leur énergie sans limites et leurs passions leur permettent d’accomplir 
       beaucoup de choses malgré leur brève existence.', TRUE),																				
	   (2, 'Nains', 'On pense souvent que ces défenseurs des villes montagneuses petits et râblés sont sévères et dépourvus de tout sens de l’humour. Ils sont connus pour être des grand 
       industriels dont les produit sont toujours d''une grande qualité et pour avoir une affinité particulière avec les richesses cachées dans les entrailles de la terre. Les nains ont 
       aussi tendance à s''isoler et à se replier sur leurs traditions, au point de sombrer parfois dans la xénophobie.', TRUE),																			
	   (3, 'Elfes', 'Grands, nobles et souvent hautains, les elfes à la longue espérance de vie sont les maîtres subtils de la nature. Ils excellent dans les arts magiques et utilisent 
       souvent leur lien inné avec la nature pour inventer de nouveaux sorts et fabriquer de merveilleux objets qui, comme leurs créateurs, semblent presque hors d’atteinte des ravages 
       du temps. Les elfes forment une race secrète et souvent introvertie, qui donne parfois l’impression d’être imperméable aux suppliques d’autrui.', FALSE),																			
	   (4, 'Orques', 'Sauvages, brutaux et résistants, les orques sont souvent le fléau des lointaines étendues naturelles et des grottes profondes. Beaucoup deviennent de redoutables 
       mercenaires, du fait de leur stature musculeuse et de leur tendance à entrer dans des rages sanglantes. Les quelques rares qui parviennent à contrôler leur soif de sang font 
       d’excellents aventuriers.', TRUE);																		

--INSERT INTO Table caractérisque
INSERT INTO caracteristique (id_caracteristique, nom_caracteristique, description_caracteristique) 
VALUES (1, 'force', 'défini les dégâts, et la capacité de port de charges'),
       (2, 'agilité', 'défini le taux  de critique des attaques physique, le taux d''esquive et l''armure'),
       (3, 'concentration', 'défini les points de vie, la résistance aux effets d''état, la résistance à l''effort'),
       (4, 'perception', 'permet de percevoir des secrets révélant des endroits et des coffres cachés'),
       (5, 'intelligence', 'augmente la quantité de mana, le taux de critique des sorts, augmente la vitesse d''entrainement à l''utilisation des armes et la capacité dialectique'),
       (6, 'magie', 'défini les points de magie permettant de jeter des sort'),
       (7, 'concentration', 'augmente les chances de toucher avec les sorts'),
       (8, 'précision', 'augmente les chances de toucher avec une arme');

--INSERT INTO Table type_objet
INSERT INTO type_objet (id_type_objet, nom_type_objet, emplacement_objet)
VALUES (1, 'arme distance', 'slotArme1'),
(2, 'arme à 2 mains', 'slotArme1 & slotArme2'),
(3, 'arme cac', 'slotArme2'),
(4, 'casque', 'slotTete'),
(5, 'armure', 'slotTorse'),
(6, 'gants', 'slotMains'),
(7, 'pantalons', 'slotJambes'),
(8, 'chaussures', 'slotPieds'),
(9, 'potions', ' '),
(10, 'monnaies', ' '),
(11, 'objet de quetes', ' '),
(12, 'décor', ' '),
(13, 'types de portes', ' '),
(14, 'expériences', ' ');

--INSERT INTO Table lieu
INSERT INTO lieu (id_lieu, nom_lieu, description_lieu)
VALUES (1, 'Bad-town', 'Ville des orcs'),
       (2, 'la reine', 'Lieu de combat n°1'),
       (3, 'la bête', 'Centre de pari sur les combats'),
       (4, 'scissor palace', 'Un casino'),
       (5, 'lennybar', 'La taverne, idéal pour s''amuser'),
       (6, 'Profit-city', 'Ville des humains'),
       (7, 'black market', 'Le marché : pour acheter, vendre et échanger'),
       (8, 'lehman sisters', 'La banque'),
       (9, 'place-2-B', 'La place centrale de la ville'),
       (10, 'treump shop', 'Magasin d''armures'),
       (11, 'Nainportnawak', 'Ville des nains'),
       (12, 'maxilase', 'Magasin de potions'),
       (13, 'flunchbar', 'La taverne des nains, l''alccol coule à flot !'),
       (14, 'park in son', 'Joli parc pour ce détendre'),
       (15, 'in & out', 'Restaurant de spécialités locales'),
       (16, 'Elf village', 'Ville des elfes'),
       (17, 'msncircus', 'Place pour discuter et faire des rencontres'),
       (18, 'pirate search', 'Zone pour aller chercher de nouvelles quêtes'),
       (19, 'daddy awards', 'Centre de récompences pour les quêtes'),
       (20, 'potatoe valley', 'Potager de légumes'),
       (21, 'La croisée', 'Là où tout les chemins se croisent');

--INSERT INTO Table objectif
INSERT INTO objectif (id_objectif, nom_objectif, description_objectif, validation_objectif)
VALUES (1, ' ', 'recuperer du houblon (Alain Chichon)', FALSE),
       (2, ' ', 'recuperer un fut (Maitre Kanter)', FALSE),
       (3, ' ', 'recuperer un élement secret (Chie mi Hendrix)', FALSE),
       (4, ' ', 'Aller tuer 4 chauves souris', FALSE),
       (5, ' ', 'Aller recuperer l''arme chez Durdur', FALSE),
       (6, ' ', 'Tuer Dracula (Jean Marie le PNJ)', FALSE),
       (7, ' ', 'Aller voir Hippique-sous pour avoir des infos', FALSE),
       (8, ' ', 'Donner des sousous à Durdur pour avoir une casquette à pointe afin de récupérer une boubourse à son concours de lancer de pommes', FALSE),
       (9, ' ', 'Retourner voir Benard Tappir et lui donner la boubourse gagner au concours de lancer de pomme', FALSE),
       (10, ' ', 'Combattre à l''arene', FALSE),
       (11, ' ', 'Choisir de tuer ou non Bours-La', FALSE),
       (12, ' ', 'Aller voir Nana Moule Curry pour récuperer la potion() a vendu la derniere potion au casino) elle lui donne une musse tongue à la place', FALSE),
       (13, ' ', 'rejoindre Lost Vegas au Scissor Palace', FALSE),
       (14, ' ', 'visiter le tunnel du pont en musse tongue avec Die Anna', FALSE);

--INSERT INTO Table interaction
INSERT INTO interaction (id_interaction, prerequis_interaction, nom_interaction, description_interaction, completion_interaction)
VALUES (1, ' ', 'Bonne brune', 'Mr Ohbar vous a demandé de faire de la bière brune'),
       (2, ' ', 'Coco bel œil', 'Un vampire terrorise les habitants de la ville (Iggy Pope)'),
       (3, ' ', 'Le voleur volé', 'Bernard Tappir vous demande de ramener une boubourse volée par les nains'),
       (4, ' ', 'Victoria secret', 'Victoria-Big-B vous demande d''aller chercher ses objets fétiches chez la reine Bours-La'),
       (5, ' ', 'Un carrosse dans le tunnel', 'Die Anna se sent lente, elle vous demande d''aller chercher le bipbip' ),
       (6, ' ', 'commerce', '');

--INSERT INTO Table role_interaction
INSERT INTO role_interaction (code_role_interaction, nom_role_interaction)
VALUES ('Q', 'questeur'),
       ('D', 'donneur'),
       ('R', 'rétributeur');

--INSERT INTO Table etat_personnage
INSERT INTO etat_personnage (id_etat_personnage, nom_etat, effet_etat, pourcentage_etat_personnage, description_etat_personnage)
VALUES (1, 'empoisonnement', ' ', ' ', 'incidence sur PV'),
       (2, 'Endormi', ' ', ' ', 'empêche d’agir'),
       (3, 'aveuglé', ' ', ' ', 'baisse la précision'),
       (4, 'paralisé', ' ', ' ', 'empêche de se deplacer'),
       (5, 'bénie', ' ', ' ', 'plus fort, plus résistant');

--INSERT INTO Table objet
INSERT INTO objet (id_objet, nom_objet, statistique_objet, pourcentage_effet_objet, equipe_objet, ouvert_objet, description_objet)
VALUES (1, 'fusil Lorrain', ' ', ' ', 'TRUE', 'NULL', 'Fusil légendaire de Lorraine, capable d''envoyer des fuseaux a 50 km/h'),
       (2, 'paprik''arme', ' ', ' ', 'TRUE', 'NULL', 'Le piment le plus fort de tous les héros'),
       (3, 'lance saucisse', ' ', ' ', 'TRUE', 'NULL', 'De son vrai nom große würst'),
       (4, 'Patator', ' ', ' ', 'TRUE', 'NULL', 'Le traditionnel lance patate Russe utiliser par Poutine en Ukraine'),
       (5, 'arbalais', ' ', ' ', 'TRUE', 'NULL', 'Monsieur Potter, merci de ramener le balais'),
       (6, 'la boule de pétoncle', ' ', ' ', 'TRUE', 'NULL', 'Célébre boule du comédon Cousteau'),
       (7, 'pestolet', ' ', ' ', 'TRUE', 'NULL', 'Ajouter du basilic, de l''ail et des François pignon et du parmesan on obtient cette arme légendaire'),
       (8, 'couperet bretzel', ' ', ' ', 'TRUE', 'NULL', 'Apparut en Alsace pendant la période des spaetzle du cervelas et de la choucroute en l''an 69'),
       (9, 'rôtisseur', ' ', ' ', 'TRUE', 'NULL', 'Célèbre arme du colonel Sander'),
       (10, 'la pelle forte', ' ', ' ', 'TRUE', 'NULL', 'Merci Berny pour votre invention autoroutiere'),
       (11, 'batte ail', ' ', ' ', 'TRUE', 'NULL', 'Arme favorite de Blade'),
       (12, 'la fausse croix', ' ', ' ', 'TRUE', 'NULL', 'Arme légendaire de nazareth'),
       (13, 'poing chope', ' ', ' ', 'TRUE', 'NULL', 'Mélange entre chopine et poing ricain'),
       (14, 'dague Ober', ' ', ' ', 'TRUE', 'NULL', 'Mais qui l''a mise à l''envers ?'),
       (15, 'couilletau', ' ', ' ', 'TRUE', 'NULL', 'Crustacé qui sent la marais'),
       (16, 'dardvador', ' ', ' ', 'TRUE', 'NULL', 'Aussi rouge que le sabre'),
       (17, 'porc table', ' ', ' ', 'TRUE', 'NULL', 'Mi porc, mi ours, mi homme,,, Je m''égare il est seulement mi table'),
       (18, 'jason tatane', ' ', ' ', 'TRUE', 'NULL', 'Pour les puristes de la bagarre'),
       (19, 'bonnet m', ' ', ' ', 'TRUE', 'NULL', 'Le sugar daddy cool des chapias'),
       (20, 'casquette a pointe', ' ', ' ', 'TRUE', 'NULL', 'Célèbre casquette germanique, utilisée dans les concours de lancer de pomme'),
       (21, 'k-lotte', ' ', ' ', 'TRUE', 'NULL', 'Arme célèbre de la confrérie Lopez, 100% cuivre'),
       (22, 'kippab', ' ', ' ', 'TRUE', 'NULL', 'Salade tomate oignon du chapeau '),
       (23, 'baie raie', ' ', ' ', 'TRUE', 'NULL', 'Le fruit qui résume bien la situation "l''abricôt"'),
       (24, 'plas''thon', ' ', ' ', 'TRUE', 'NULL', 'Construite en boite de petit navire'),
       (25, 'plas''tèque', ' ', ' ', 'TRUE', 'NULL', 'Manger 5 fruits et légumes par jours'),
       (26, 'côte de beauf', ' ', ' ', 'TRUE', 'NULL', 'Parfait pour les soirées tuning'),
       (27, 'l''ainée', ' ', ' ', 'TRUE', 'NULL', 'Allez voir sur wikipédia'),
       (28, 'pull ovaire', ' ', ' ', 'TRUE', 'NULL', 'Bien mieux que le col roulé'),
       (29, 'gants stères', ' ', ' ', 'TRUE', 'NULL', 'Parfait pour ramasser le bois'),
       (30, 'mie Teigne', ' ', ' ', 'TRUE', 'NULL', 'Boulanger tétu de renommé'),
       (31, 'bollet rouge', ' ', ' ', 'TRUE', 'NULL', 'Célébre coiffe du comédon Cousteau'),
       (32, 'croque mie teigne', ' ', ' ', 'TRUE', 'NULL', 'Croque monsieur du boulanger'),
       (33, 'gant de toilette', ' ', ' ', 'TRUE', 'NULL', 'Progéniture de Servietski'),
       (34, 'bretelle', ' ', ' ', 'TRUE', 'NULL', 'Et porte jartelle'),
       (35, 'bas thon', ' ', ' ', 'TRUE', 'NULL', 'Le leggings du comédon Cousteau'),
       (36, 'benne laden', ' ', ' ', 'TRUE', 'NULL', 'Enfilez vos deux jambes dedans'),
       (37, 'beer muda', ' ', ' ', 'TRUE', 'NULL', 'Mi jaune mi blanc'),
       (38, 'fûtal', ' ', ' ', 'TRUE', 'NULL', 'Parfait pour protéger votre trou du fût'),
       (39, 'crocs', ' ', ' ', 'TRUE', 'NULL', 'Style hollandais, chaussette claquette'),
       (40, 'bas bouche', ' ', ' ', 'TRUE', 'NULL', 'Babooshka, babooshka, babooshka ja, ja'),
       (41, 'adaddas', ' ', ' ', 'TRUE', 'NULL', 'Des contre façons efficaces'),
       (42, 'les talons', ' ', ' ', 'TRUE', 'NULL', 'Dixit the Italian Stallion'),
       (43, 'musse tongue', ' ', ' ', 'TRUE', 'NULL', 'Aussi rapide que l''original'),
       (44, 'pinte', ' ', ' ', 'FALSE', 'NULL', 'Je vous remettrais bien la petite sœur?'),
       (45, 'tord boyaux', ' ', ' ', 'FALSE', 'NULL', 'Très utile pour les nœuds de huit'),
       (46, 'Sheba', ' ', ' ', 'FALSE', 'NULL', 'Alain sheba, un gros nul'),
       (47, 'shot', ' ', ' ', 'FALSE', 'NULL', 'Boisson chaude de charlie Sheen'),
       (48, 'grogs', ' ', ' ', 'FALSE', 'NULL', 'Recette mythique des mère grand'),
       (49, 'ukranium', ' ', ' ', 'FALSE', 'NULL', 'Très prisé en Russie actuellement'),
       (50, 'muscat death', ' ', ' ', 'FALSE', 'NULL', 'Tu bois tu meurts'),
       (51, 'houmous tache', ' ', ' ', 'FALSE', 'NULL', 'Repas favoris de Staline'),
       (52, 'tsar tziki', ' ', ' ', 'FALSE', 'NULL', 'Sauce favorite de Lenine'),
       (53, 'potion magique', ' ', ' ', 'FALSE', 'NULL', 'Remet les idées fixes'),
       (54, 'asperule', ' ', ' ', 'FALSE', 'NULL', 'C''est comme le jagermeister mais en plus mauvais'),
       (55, 'sauce dallas', ' ', ' ', 'FALSE', 'NULL', 'Sur les boulettes ?'),
       (56, 'sauce biggy', ' ', ' ', 'FALSE', 'NULL', 'Avec ou sans frites ?'),
       (57, 'sauce hannibal', ' ', ' ', 'FALSE', 'NULL', 'Pour les Lecter vegan'),
       (58, 'sauce blanche', ' ', ' ', 'FALSE', 'NULL', 'Très populaire chez les albinos du RN'),
       (59, 'barbie turique', ' ', ' ', 'FALSE', 'NULL', 'Le Ken lubrique'),
       (60, 'amnesia', ' ', ' ', 'FALSE', 'NULL', 'A ne surtout pas fumer'),
       (61, 'algoflash', ' ', ' ', 'FALSE', 'NULL', 'L''algorithme de toto'),
       (62, 'le sang du christ', ' ', ' ', 'FALSE', 'NULL', 'Tu ne trouves pas ça assez catholique ?'),
       (63, 'valium', ' ', ' ', 'FALSE', 'NULL', 'Bienvenue le marchand de sable'),
       (64, 'bezoard', ' ', ' ', 'FALSE', 'NULL', 'Accumulations très denses de matière partiellement digérée ou non digérée pouvant se coincer dans l''estomac ou les intestins'),
       (65, 'collyre', ' ', ' ', 'FALSE', 'NULL', 'Lorsque vous êtes aveugles, bien viser les yeux'),
       (66, 'schneck', ' ', ' ', 'FALSE', 'NULL', 'Très bon pain aux raisins de Moselle'),
       (67, 'epinephrine', ' ', ' ', 'FALSE', 'NULL', 'Impécable pour l''hyper tension'),
       (68, 'vega missile', ' ', ' ', 'FALSE', 'NULL', 'Pour être satélisé'),
       (69, 'red boule', ' ', ' ', 'FALSE', 'NULL', 'La contre façons'),
       (70, 'bipbip', ' ', ' ', 'FALSE', 'NULL', 'A consommer dans un Saddam Usain bol'),
       (71, 'le coyotte', ' ', ' ', 'FALSE', 'NULL', 'Le seul loup avec un frain à main'),
       (72, 'Boubourse', ' ', ' ', 'FALSE', 'FALSE', ' '),
       (73, 'houblon', ' ', ' ', 'FALSE', 'NULL', ' '),
       (74, 'fut', ' ', ' ', 'FALSE', 'NULL', ' '),
       (75, 'sachet', ' ', ' ', 'FALSE', 'NULL', ' '),
       (76, 'mur', ' ', ' ', 'NULL', 'NULL', ' '),
       (77, 'banc', ' ', ' ', 'NULL', 'NULL', ' '),
       (78, 'table', ' ', ' ', 'NULL', 'NULL', ' '),
       (79, 'fleurs', ' ', ' ', 'NULL', 'NULL', ' '),
       (80, 'rochers', ' ', ' ', 'NULL', 'NULL', ' '),
       (81, 'lampadaire', ' ', ' ', 'NULL', 'NULL', ' '),
       (82, 'statue', ' ', ' ', 'NULL', 'NULL', ' '),
       (83, 'tente', ' ', ' ', 'NULL', 'NULL', ' '),
       (84, 'fontaine', ' ', ' ', 'NULL', 'NULL', ' '),
       (85, 'petite maison', ' ', ' ', 'NULL', 'NULL', ' '),
       (86, 'mur de berlin', ' ', ' ', 'NULL', 'NULL', ' '),
       (87, 'seau', ' ', ' ', 'NULL', 'NULL', ' '),
       (88, 'clôture', ' ', ' ', 'NULL', 'NULL', ' '),
       (89, 'xp', ' ', ' ', 'NULL', 'NULL', ' ');

--INSERT INTO Table aptitude
INSERT INTO aptitude (id_aptitude, nom_aptitude, effet_aptitude, prerequis_aptitude, description_aptitude, id_type_aptitude)
VALUES (1, 'avancer', ' ', ' ', 'déplace le personnage vers l''avant', 1),
       (2, 'reculer', ' ', ' ', 'déplace le personnage vers l''arrière', 1),
       (3, 'esquive droite', ' ', ' ', 'effectue un déplacement latéral vers la droite', 1),
       (4, 'esquive gauche', ' ', ' ', 'effectue un déplacement latéral vers la gauche', 1),
       (5, 'vitesse de déplacement', ' ', ' ', 'défini la vitesse de déplacement', 1),
       (6, 'vitesse d' 'attaque', ' ', ' ', 'défini la vitesse d''attaque', 1),
       (7, 'poids', ' ', ' ', 'défini la charge maximal avant pénalité de mobilité', 1),
       (8, 'puissance des sorts', ' ', ' ', 'défini la puissance des sorts de dégats ou la puissance des soins ', 1),
       (9, 'ballayage tranchant', ' ', ' ', 'effectue une attaque rotative avec son arme tranchante, et applique un effet de saignement pdt 5 sec', 2),
       (10, 'martellement lourd', ' ', ' ', 'effectue une attaque contre plongeante avec une arme contondante, et applique un effet d''étourdissement pdt 2 sec', 2),
       (11, 'tir incapacitant', ' ', ' ', 'effectue un tir à l''aide d''une arme a distance, et applique un effet d''estropier', 2),
       (12, 'parade', ' ', ' ', 'pare la prochaine attaque', 2),
       (13, 'contre-attaque', ' ', ' ', 'bloque une attaque physique et riposte a l''aide de son arme en mélée (Ne peut être paré, esquivé ou bloqué)', 2),
       (14, 'aériennes', ' ', ' ', 'permet l''utilisation de montures aériennes', 3),
       (15, 'terrestres', ' ', ' ', 'permet l''utilisation de montures terrestre', 3),
       (16, 'aquatiques', ' ', ' ', 'permet l''utilisation de montures aquatique', 3),
       (17, 'boule de feu', ' ', ' ', 'lance une boule de feu sur la cible et effectue des dégats', 4),
       (18, 'graine versatile', ' ', ' ', 'plante une graine sur une cible allié et la soigne sur la durée pdt 10 sec OU une cible ennemie et lui inflige des dgt de nature sur la durée 
       pdt 5 sec', 4);

--INSERT INTO Table personnage
INSERT INTO personnage (id_personnage, nom_personnage, niveau_personnage, direction_personnage, alignement_personnage, monnaie_personnage, vivant_personnage)
VALUES (1, 'Bours-La', ' ', ' ', ' ', ' ', TRUE),
       (2, 'Bernard Tappir', ' ', ' ', ' ', ' ', TRUE),
       (3, 'Lost Vegas', ' ', ' ', ' ', ' ', TRUE),
       (4, 'Ohbar', ' ', ' ', ' ', ' ', TRUE),
       (5, 'Toutavendre', ' ', ' ', ' ', ' ', TRUE),
       (6, 'Hippique-sous', ' ', ' ', ' ', ' ', TRUE),
       (7, 'Durdur', ' ', ' ', ' ', ' ', TRUE),
       (8, 'Chie mi Hendrix', ' ', ' ', ' ', ' ', TRUE),
       (9, 'Maitre Kanter', ' ', ' ', ' ', ' ', TRUE),
       (10, 'Nana Moule Curry', ' ', ' ', ' ', ' ', TRUE),
       (11, 'Iggy Pope', ' ', ' ', ' ', ' ', TRUE),
       (12, 'Victoria-Big-B', ' ', ' ', ' ', ' ', TRUE),
       (13, 'Alain Chichon', ' ', ' ', ' ', ' ', TRUE),
       (14, 'Jean Marie le PNJ', ' ', ' ', ' ', ' ', TRUE),
       (15, 'Die Anna', ' ', ' ', ' ', ' ', TRUE);

--INSERT INTO Table dialogue
INSERT INTO dialogue (id_dialogue, contenu_dialogue)
VALUES (1, 'Bonjour mon bon monsieur, je vous mettrais bien une petite bière ?'),
       (2, 'A votre santé !'),
       (3, 'Effectivement j''ai besoin d''aide, Toi l''amateur de bière j''ai besoin que tu ailles récupérer du bon houblon chez "Alain-Chichon", un fut chez "Maitre Kanter", et le dernier 
       élement secret chez "Chie mi Hendrix"'),
       (4, 'Merci mon brave, voilà une bonne brune bien relevée. Bon chance !'),
       (5, 'Héééééé, toi la bas, tu veux de la bonne ? '),
       (6, 'Et voila mon brave, du bon houblon, n''en mets pas trop si tu veux pas planer. A bientôt. '),
       (7, 'Bon vent !'),
       (8, 'Hopla, qu''est ce que tu veux ici ?'),
       (9, 'Ca joue, voila ton fut une fois !'),
       (10, 'Ok, barre toi alors wesh'),
       (11, 'Salut fieu, j''ai concocté un gros paquet c''matin, t''en veux ?'),
       (12, 'Tiens, v''la l''sachet !'),
       (13, 'Je te comprends, peace'),
       (14, 'Bonjour mon enfant, tu veux une petite friandise ?'),
       (15, 'Tu devras aller chasser 4 chauves souris et les emener chez Durdur, pour qu''il te fabrique une Battte Ail. Ensuite, tu devras combattre le terrible Jean Marie le PNJ, vivant 
       dans le noir. Tu pourras me récuperer son œil en guise de trophée.'),
       (16, 'Si la prochaine fois, tu veux une friandise, tu viendras me voir dans le confessional.'),
       (17, 'Je vais te faire courir moi tu vas voir, n''est ce pas ?'),
       (18, 'Vous êtes ici pour le Flouze ?'),
       (19, '??'),
       (20, 'Oui mon gars , des nains pas plus haut que trois pommes m''ont volé ma bourbourse. Tu dois rencontrer Hippique-sous pour obtenir des informations.'),
       (21, 'Bonjour monsieur, venez vous delester de vos picèes ici, je vous en prie !'),
       (22, 'Et voilà la sauce du chef. Vous pourrez aller voir Durdur pour qu''il puisse vous forger une pièce rare, c''est un cadeau de Bernard. Bon courage.'),
       (23, 'Hallo ! Toi venir ici pour acheter armures ? Ja ?'),
       (24, 'Ach so, vous vouloir grosse casquette à pointe traditionnelle de mein land! Moi avoir ça derrière gros comptoir, gut gut gut ! Vous vouloir lancer apfel sur ma grosse 
       pointe ?'),
       (25, 'Super gut, si toi atteindre ma pointe moi donner grosse boubourse ach.'),
       (26, 'Ha sacré voleur de schleu, merci pour ton aide mein freund, voici un joli pull ovaire fait par ma fille.'),
       (27, 'Bonjour mon lapin, tu es la pour mes gros objets fétiches, hihihi ?'),
       (28, 'Tu devras prouver tes talents en combat singulier à l''arène, mais pas avec n''importe quelle arme mon lapin ! '),
       (29, 'Vous revenez de chez Victoria Big-B ? '),
       (30, 'Tu verras ou je vais te les mettres ses objets !'),
       (31, 'Je suis en manque de vitesse, pouvez-vous m''aider ?'),
       (32, 'J''ai besoin de récupérer une potion à Nana Moule Curry au restaurant in&out pour retrouver ma vitesse !'),
       (33, 'J''ai vendu la dernière la potion au casino Scissor Palace, vous devriez peut être y faire un tour ! Pour me faire pardonner je voulaisse ces Musse Tongue.'),
       (34, 'Tu as pu récupérer ma potion pour ma vitesse?'),
       (35, 'Super on va pouvoir aller visiter le tunnel en Musse Tongue maintenant !');

--INSERT INTO Table embranchement
INSERT INTO embranchement (id_embranchement, choix_embranchement)
VALUES (1, 'M''fois biensur, et tu me mettras la petite sœur avec !'),
       (2, 'Tu m''as pris pour qui, un alcoolique? Je déconne tu m''en mettras 3'),
       (3, 'C''est ici la bonne brune?'),
       (4, 'Non merci je préfère l''eau'),
       (5, 'J''accepte volontiers'),
       (6, 'Non merci j''ai d''autres choses à faire'),
       (7, 'J''aimerais commercer avec vous'),
       (8, 'Je suis à la recherche de houblon pour me faire une bonne brune.'),
       (9, 'Non, ça ca sent trop les fleurs ici !!'),
       (10, 'Je voudrais récuperer un fut pour brasser'),
       (11, 'Tu me remettras la petite sœur, et tu me changeras le verre, celui-ci goute le savon.'),
       (J'aime bien la mousse mais il faut pas exagerer !'),
       (12, 'Mais pas si vite, ça fait d''la mousse,'),
       (13, 'Allons y, j''ai pris mon antiémétiques ce matin.'),
       (14, 'Ohbar m''a donné ce sachet pour récuperer un ingrédient secret.'),
       (15, 'vu l''odeur, ca me ferait mal !'),
       (16, 'Il parait qu''un vampire rode dans les environs, besoin d''une croisade ?'),
       (17, 'Je voudrais parier.'),
       (18, 'J''aimerais vos conseils pour me lancer dans les affaires'),
       (19, 'C''est vous qui êtes à la recherche d''une Bourbourse ?'),
       (20, 'Yep, j''accepte la grosse quête'),
       (21, 'Non, vous avez assez de flouze je voudrais le vôtre'),
       (22, 'Non merci, je n''ai pas confiance.
       (Je viens de la part de Nanard, il recherche sa boubourse perdue au dernier match de foot, vous auriez des infos ?'),
       (23, 'Entre vous et ma femme, je vais peut-etre vous laisser mes economies,'),
       (24, 'Les frais ne sont pas assez O low cost !'),
       (25, 'Vous avez pas plutôt des schnitzel?'),
       (26, 'Jajaja, Muskatnuss herr Muller !'),
       (27, 'C''est ici qu''on peut se procurer de l''équipement pour le concours de lancer de pomme?'),
       (28, 'Jajaja, moi avoir plein de deutschmark'),
       (29, 'Jajaja'),
       (30, 'nein nein nein'),
       (31, 'Biensur, et il n''y a pas que les objets qui sont gros hahaha. Plus c''est gros plus c''est bon,'),
       (32, 'Quels objets ? Tu m''as pris pour une œuvre de Paul McCarthy !'),
       (33, 'Oui j''ai besoin de ses objets fétiches !'),
       (34, 'Non, je suis là pour me battre avec des gros durs !'),
       (35, 'Tuer la reine, et récupérer les objets'),
       (36, 'La laisser en vie et récupérer les objets de quelconque manière'),
       (37, 'Oui biensur, je suis un trè bon pilote !'),
       (38, 'Non, je n''ai pas le permis…'),
       (39, 'Oui biensur, et j''ai même des Musse Tongue en prime pour voyager sereinement !'),
       (40, 'Non, malheureusement Nana Moule Curry à vendu la dernière au Casino !');
