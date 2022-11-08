/*
Insertion pour la table compte_utilisateur.
*/

INSERT INTO compte_utilisateurs ("pseudo_compte", "mdp_compte", "courriel_compte", "valid")
    VALUES
    ('un', '1001', 'un@myJdr2D.com', 1),
    ('deux', '1002', 'deux@myJdr2D.com', 1),
    ('trois', '1003', 'trois@myJdr2D.com', 1),
    ('quatre', '1004', 'quatre@myJdr2D.com', 1),
    ('cinq', '1005', 'cinq@myJdr2D.com', 1),
    ('six', '1006', 'six@myJdr2D.com', 1),
    ('sept', '1007', 'sept@myJdr2D.com', 1),
    ('huit', '1008', 'huit@myJdr2D.com', 1),
    ('neuf', '1009', 'neuf@myJdr2D.com', 1),
    ('dix', '1010', 'dix@myJdr2D.com', 1),
    ('onze', '1011', 'onze@myJdr2D.com', 1)
;

/*
Insertion pour la table  race.
*/

INSERT INTO race ("id_race", "nom_race", "description_race", "jouable") 
    VALUES 
    (1,'Humains', 'Ambitieux, parfois héroïques, mais toujours confiants, les humains sont capables de travailler ensemble pour atteindre des objectifs communs, ce qui fait d’eux une puissance à ne pas négliger. Ils ont une espérance de vie réduite par rapport aux autres races, mais leur énergie sans limites et leurs passions leur permettent d’accomplir beaucoup de choses malgré leur brève existence.', 1),
    (2, 'Nains', 'On pense souvent que ces défenseurs des villes montagneuses petits et râblés sont sévères et dépourvus de tout sens de l’humour. Ils sont connus pour être des grand industriels dont les produit sont toujours d''une grande qualité et pour avoir une affinité particulière avec les richesses cachées dans les entrailles de la terre. Les nains ont aussi tendance à s’isoler et à se replier sur leurs traditions, au point de sombrer parfois dans la xénophobie.', 1),
    (3, 'Elfes', 'Grands, nobles et souvent hautains, les elfes à la longue espérance de vie sont les maîtres subtils de la nature. Ils excellent dans les arts magiques et utilisent souvent leur lien inné avec la nature pour inventer de nouveaux sorts et fabriquer de merveilleux objets qui, comme leurs créateurs, semblent presque hors d’atteinte des ravages du temps. Les elfes forment une race secrète et souvent introvertie, qui donne parfois l’impression d’être imperméable aux suppliques d’autrui.', 0),
    (4, 'Orques', 'Sauvages, brutaux et résistants, les orques sont souvent le fléau des lointaines étendues naturelles et des grottes profondes. Beaucoup deviennent de redoutables mercenaires, du fait de leur stature musculeuse et de leur tendance à entrer dans des rages sanglantes. Les quelques rares qui parviennent à contrôler leur soif de sang font d’excellents aventuriers.', 1),
    (5, 'Rat', 'Petite bête terrestre nuisible, qui se gave des déchets des habitants', 0),
    (6, 'Chauves Souris', 'Petite bête volante nuisible, qui sort qu''une fois la nuit tombée !', 0)
;

/*
Insertion pour la table lieu
*/

INSERT INTO lieu ("id_lieu", "nom_lieu", "description_lieu", "carte_lieu")
    VALUES
    (1, 'Bad-town', 'Ville centrale du peuple Orc', 'bad-town.jpg'),
    (11, 'La Reine', 'Arène du peuple Orc', 'arena-orc.jpg'),
    (12, 'La Bête', 'Betting-Center du peuple Orc', 'betting-center.jpg'),
    (13, 'Scissor Palace, Casino du pleuple Orc',' casino-orc.jpg'),
    (14, 'Lennybar', 'La taverne du peuple Orc', 'taverne-orc.jpg'),
    (2, 'Profit-city', 'Ville principale du peuple Nain', 'profit-city.jpg'),
    (21, 'Black-Market', 'Place commerçante du peuple Nain', 'market-nains.jpg'),
    (22, 'Lehman-Sisters', 'La banque centrale du peuple Nain', 'bank-nains.jpg'),
    (23, 'Place-2-B', 'Place centrale du peuple Nain', 'place-nains.jpg'),
    (24, 'Treump-Shop', 'Magasin du peuple Nain', 'place-amory-nains.jpg'),
    (3, 'Nain-port-nawak', 'Contrairement a ce que l''on pourrait penser, il s''agit de la ville principale du peuple Humain', 'nainport-nawak.jpg'),
    (31, 'Maxilase', 'Magasins de potions du peuple Humain', 'shop-potion-humain.jpg'),
    (32, 'Flunchbar', 'La taverne du peuple Humain', 'taverne-humain.jpg'),
    (33, 'Park In Son', 'Parc du pleuple Humain', 'park-humain.jpg'),
    (34, 'Resto-In&Out', 'Restaurant du peuple Humain', 'restauI&O-humain.jpg'),
    (4, 'Elf-village', 'Ville principale du peuple Elfe', 'Elf_village.jpg'),
    (41, 'Msncircus', 'Place-1 du pleuple Elfe', 'arena-elfe.jpg'),
    (42, 'Pirate Search', 'Place-2 du pleuple Elfe', 'quest-center-elfe.jpg'),
    (43, 'Daddy Awards', 'Place-3 du pleuple Elfe', 'podium-center-elfe.jpg'),
    (44, 'Potatoes Valley', 'Place-4 du pleiuple Elfe', 'agri-elfe.jpg')
;

/*
Insertion pour la table type_objet.
*/

INSERT INTO type_objet ("id_type_objet", "nom_type_objet", "emplacement")
    VALUES
    (1, 'arme_distance', 'slotArme'),
    (2, 'arme_2_mains', 'slotArme1 & slotArme'),
    (3, 'arme_cac', 'slotArme'),
    (4, 'casque', 'tete'),
    (5, 'armure', 'torse'),
    (6, 'gant', 'main'),
    (7, 'pantalon', 'jambe'),
    (8, 'chaussures', 'pied'),
    (9, 'potion', 'consommable'),
    (10, 'objet_de_quetes', ),
    (11, 'decor', ),
    (12, 'monnaies', ),
    (13, 'xp', ),
    (14, 'porte', )
;

/*
Insertion pour la table interactions.
*/

INSERT INTO interactions ("id_interaction","prerequis_interaction", "nom_interaction", "description_interaction", "completion_interaction")
    VALUES
    (1, '', 'bonne brune', 'Mr OhBar vous a demandé de faire de la bière brune', ''),
    (2, 'avoir la batte ail', 'coco bel oeil', 'Un Vampire terrorise les habitants de la ville', ''),
    (3, '', 'le voleur volé', 'Bernard Tappir vous demande de ramener une boubourse volée par les nains', ''),
    (4, '', 'victoria secret', 'Victoria Big-B vous demande d''aller chercher ses objets fétiches chez la reine Bours-La', ''),
    (5, '', 'un carosse dans un tunnel', 'Die Anna se sens lente, elle vous demande d''aller chercher le bipbip', '')
;

/*
Insertion pour la table recompense.
*/

INSERT INTO recompense ( "id_recompense","nom_recompense", "description_recompense")
    VALUES
    (1, 'Une bonne brune !', 'Vous gagnez 1 pinte, 500xp, 20 pièces d''or et 1 arme : la pelle forte'),
    (2, 'L''arme', 'Chose promise, chose dûe, voici votre arme : batte ail'),
    (3, 'Alléluia !', 'Grâce à Dieu nous sommes sauvés... Bon d''accord grâce à vous aussi et pour ce, vous gagnez 50 pièces d''or, 750xp et la potion : Sang du Christ'),
    (4, 'Une bonne saucée !', 'Voici pour vous, une potion pour plus d''esquive... Vous en aurez surement besoin tôt ou tard !'),
    (5, 'Une pièce rare !', 'Vous avez acheter un casque : la casquette à pointe.'),
    (6, 'Bravo !', 'Vous avez gagner une armure : le pull ovaire.'),
    (7, 'Z''êtes bien battu', 'Vous gagnez une arme : couilletau'),
    (8, 'Une bouchée de la reine', 'Vous gagnez une arme : dardvador'),
    (9, 'Plus vite !', 'Vous gagnez une paire de chaussure rapide : musse tongue'),
    (10, 'Encore plus vite !', 'Vous gagnez une potion de vitesse : bipbip'),
    (11, 'La visite', 'Vous gagner une armure : la côte de Beauf')
;

/*
Insertion pour la table objectif.
*/

INSERT INTO objectif ("id_objectif", "nom_objectif", "description_objectif", "validation")
    VALUES
    (1, '', 'Récupérer du houblon', 1),
    (2, '', 'Récupérer un fut', 1),
    (3, '', 'Récupérer un élément secret', 1),
    (4, '', 'Aller tuer 4 chauve-souris', 1),
    (5, '', 'Aller récupérer l''arme chez Durdur', 1),
    (6, '', 'Tuer Dracula', 1),
    (7, '', 'Aller voir Hippique-sous pour avoir des infos', 1),
    (8, '', 'Donner des sousous à Durdur pour avoir une casquette à pointe afin de récupérer une boubourse à son concours de lancer de pomme', 1),
    (9, '', 'Retourner voir Bernard Tappir et lui donner la boubourse gagner au concours de lancer de pomme', 1),
    (10, '', 'Combattre à l''arène', 1),
    (11, '', 'Choisir de tuer ou non Bours-La', 1),
    (12, '', 'Aller voir Nana Moule Curry pour récupérer la potion, elle a vendue la dernière au Casino, prenez une Musse Tongue à la place', 1),
    (13, '', 'Rejoindre Lost Vegas au Scisso Palace', 1),
    (14, '', 'Visiter le tunnel de pont en Musse Tongue avec Die Anna', 1)
;

/*
Insertion pour la table type_aptitude.
*/

INSERT INTO type_aptitude ("nom_type_aptitude")
    VALUES
    ('Déplacement'),
    ('Habilité')
;

/*
Insertion pour la table role_interaction.
*/

INSERT INTO role_interaction ("code_role_quete", "nom_role_quete")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table caracteristique.
*/

INSERT INTO caracteristique ("nom_caracteristique", "description_caracteristique")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table personnage.
*/

INSERT INTO personnage ("id_personnage", "nom_personnage", "niveau_personnage", "direction", "alignement", "monnaie", "vivant", "id_lieu", "id_race", "id_compte_utilisateur")
    VALUES
    (1, 'Bours-La', '', '', '', '', 1, 11, 4, '' ),
    (2, 'Bernard Tappir', '', '', '', '', 1, 12, 4, '' ),
    (3, 'Lost Vegas', '', '', '', '', 1, 13, 4, '' ),
    (4, 'Ohbar', '', '', '', '', 1, 14, 4, '' ),
    (5, 'Touavendre', '', '', '', 1, 21, 2, ''),
    (6, 'Hippique-sous', '', '', '', 1, 22, 2, ''),
    (7, 'Durdur', '', '', '', 1, 24, 2, ''),
    (8, 'Chie-mi Hendrix', '', '', '', 1, 31, 1, ''),
    (9, 'Maitre Kanter', '', '', '', 1, 32, 1, ''),
    (10, 'Nana Moule Curry', '', '', '', 1, 34, 1, ''),
    (11, 'Iggy Pope', '', '', '', 1, 42, 3, ''),
    (12, 'Victoria Big-B', '', '', '', 1, 43, 3, ''),
    (13, 'Alain Chichon', '', '', '', 1, 44, 3, ''),
    (14, 'Die Anna', '', '', '', 1, '', '', ''),
    (15, 'Jean-Marie LE PNJ', '', '', '', 1, '', '', '')
;

/*
Insertion pour la table aptitude.
*/

INSERT INTO aptitude ("nom_aptitude", "effet_aptitude", "prerequis_aptitude", "id_type_aptitude")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table objet.
*/

INSERT INTO objet ("id_objet", "nom_objet", "statistique_objet", "equipe", "ouvert", "description_objet", "prix", "id_type_objet")
    VALUES
    (1, 'fusil Lorrain', '+1 force', 1, '', 'Fusil légendaire de Lorraine, capable d''envoyer des fuseaux a 50 km/h', '', 1),
    (2, 'paprik''arme', '+2 force', 1, '', 'Le piment le plus fort de tous les héros', '', 1),
    (3, 'lance saucisse', '+3 force', 1, '', 'De son vrai nom große würst', '', 1),
    (4, 'patator', '+4 force', 1, '', 'Le traditionnel lance patate Russe utiliser par Poutine en Ukraine', '', 1),
    (5, 'arbalais', '+5 force', 1, '', 'Monsieur Potter, merci de ramener le balais', '', 1),
    (6, 'la boule de pétoncle', '+6 force', 1, '', 'Célébre boule du comédon Cousteau', '', 1),
    (7, 'pestolet', '+7 force', 1, '', 'Ajouter du basilic, de l''ail et des François pignon et du parmesan on obtient cette arme légendaire', '', 1),
    (8, 'couperet bretzel', '+2 force', 1, '', 'Apparut en Alsace pendant la période des spaetzle du cervelas et de la choucroute en l''an 69', '', 2),
    (9, 'rôtisseur', '+4 force', 1, '', 'Célèbre arme du colonel Sander', '', 2),
    (10, 'la pelle forte', '+6 force', 1, '', 'Merci Berny pour votre invention autoroutiere', '', 2),
    (11, 'batte ail', '+8 force', 1, '', 'Arme favorite de Blade', '', 2),
    (12, 'la fausse croix', '+10 force', 1, '', 'Arme légendaire de nazareth', '', 2),
    (13, 'poing chope', '+1 force', 1, '', 'Mélange entre chopine et poing ricain', '', 3),
    (14, 'dague Ober', '+2 force', 1, '', 'Mais qui l''a mise à l''envers ?', '', 3),
    (15, 'couilletau', '+3 force', 1, '', 'Crustacé qui sent la marais', '', 3),
    (16, 'dardvador', '+4 force', 1, '', 'Aussi rouge que le sabre', '', 3),
    (17, 'porc table', '+5 force', 1, '', 'Mi porc, mi ours, mi homme,,, Je m''égare il est seulement mi table', '', 3),
    (18, 'jason tatane', '+8 force', 1, '', 'Pour les puristes de la bagarre', '', 3),
    (19, 'bonnet m', '+2 agilité', 1, '', 'Le sugar daddy cool des chapias', '', 4),
    (20, 'casquette a pointe', '+2 agilité', 1, '', 'Célèbre casquette germanique, utilisée dans les concours de lancer de pomme', '', 4),
    (21, 'k-lotte', '+2 agilité', 1, '', 'Arme célèbre de la confrérie Lopez, 100% cuivre', '', 4),
    (22, 'kippab', '+2 agilité', 1, '', 'Salade tomate oignon du chapeau ', '', 4),
    (23, 'baie raie', '+2 agilité', 1, '', 'Le fruit qui résume bien la situation " l''abricôt"', '', 4),
    (24, 'plas''thon',  '+1 agilité', 1, '', 'Construite en boite de petit navire', '', 5)
    (25, 'plas''tèque',  '+2 agilité', 1, '', 'Manger 5 fruits et légumes par jours', '', 5)
    (26, 'côte de beauf',  '+3 agilité', 1, '', 'Parfait pour les soirées tuning', '', 5),
    (27, 'l''ainée',  '+4 agilité', 1, '', 'Allez voir sur wikipédia', '', 5),
    (28, 'pull ovaire',  '+5 agilité', 1, '', 'Bien mieux que le col roulé', '', 5),
    (29, 'gants stères',  '+1 agilité', 1, '', 'Parfait pour ramasser le bois', '', 6),
    (30, 'mie Teigne',  '+2 agilité', 1, '', 'Boulanger tétu de renommé', '', 6),
    (31, 'bollet rouge',  '+3 agilité', 1, '', 'Célébre coiffe du comédon Cousteau', '', 6),
    (32, 'croque mie teigne',  '+4 agilité', 1, '', 'Croque monsieur du boulanger', '', 6),
    (33, 'gant de toilette',  '+5 agilité', 1, '', 'Progéniture de Servietski', '', 6),
    (34, 'bretelle',  '+1 agilité', 1, '', 'Et porte jartelle', '', 7),
    (35, 'bas thon',  '+2 agilité', 1, '', 'Le leggings du comédon Cousteau', '', 7),
    (36, 'benne laden',  '+3 agilité', 1, '', 'Enfilez vos deux jambes dedans', '', 7),
    (37, 'beer muda',  '+4 agilité', 1, '', 'Mi jaune mi blanc', '', 7),
    (38, 'fûtal',  '+5 agilité', 1, '', 'Parfait pour protéger votre trou du fût', '', 7),
    (39, 'crocs',  '+1 agilité', 1, '', 'Style hollandais, chaussette claquette', '', 8),
    (40, 'bas bouche',  '+2 agilité', 1, '', 'Babooshka, babooshka, babooshka ja, ja', '', 8),
    (41, 'adaddas',  '+3 agilité', 1, '', 'Des contre façons efficaces', '', 8),
    (42, 'les talons',  '+4 agilité', 1, '', 'Dixit the Italian Stallion', '', 8),
    (43, 'musse tongue',  '+5 agilité', 1, '', 'Aussi rapide que l''original', '', 8),
    (44, 'pinte',  '+2 esquive', 1, '', 'Je vous remettrais bien la petite sœur?', '', 9),
    (45, 'tord boyaux',  '+50 mana / -50 pv', 1, '', 'Très utile pour les nœuds de huit', '', 9),
    (46, 'sheba',  '+50 pv / -50 mana', 1, '', 'Alain sheba, un gros nul', '', 9),
    (47, 'shot',  '+25 pv', 1, '', 'Boisson chaude de charlie Sheen', '', 9),
    (48, 'grogs',  '+50 pv', 1, '', 'Recette mythique des mère grand', '', 9),
    (49, 'ukranium',  '+25 mana', 1, '', 'Très prisé en Russie actuellement', '', 9),
    (50, 'muscat death',  '-50 mana', 1, '', 'Tu bois tu meurts', '', 9),
    (51, 'houmous tache',  '-2 dodge', 1, '', 'Repas favoris de Staline', '', 9),
    (52, 'tsar tziki',  '-5 dodge', 1, '', 'Sauce favorite de Lenine', '', 9),
    (53, 'potion magique',  '/2 magic', 1, '', 'Remet les idées fixes', '', 9),
    (54, 'asperule',  '/2 pv', 1, '', 'C''est comme le jagermeister mais en plus mauvais', '', 9),
    (55, 'sauce dallas',  '*2 magic', 1, '', 'Sur les boulettes ?', '', 9),
    (56, 'sauce biggy',  '*2 force', 1, '', 'Avec ou sans frites ?', '', 9),
    (57, 'sauce hannibal',  '*2 pv', 1, '', 'Pour les Lecter vegan', '', 9),
    (58, 'sauce blanche',  '*2 dodge', 1, '', 'Très populaire chez les albinos du RN', '', 9),
    (59, 'barbie turique',  'poisoned', 1, '', 'Le Ken lubrique', '', 9),
    (60, 'amnesia',  'stunt', 1, '', 'A ne surtout pas fumer', '', 9),
    (61, 'algoflash',  'blind', 1, '', 'L''algorithme de toto', '', 9),
    (62, 'le sang du christ',  'blessed', 1, '', 'Tu ne trouves pas ça assez catholique ?', '', 9),
    (63, 'valium',  'sleep', 1, '', 'Bienvenue le marchand de sable', '', 9),
    (64, 'bezoard',  'heal poisoned', 1, '', 'Accumulations très denses de matière partiellement digérée ou non digérée pouvant se coincer dans l''estomac ou les intestins', '', 9),
    (65, 'collyre',  'heal blind', 1, '', 'Lorsque vous êtes aveugles, bien viser les yeux', '', 9),
    (66, 'schneck',  'heal stunt', 1, '', 'Très bon pain aux raisins de Moselle', '', 9),
    (67, 'epinephrine',  'heal sleep', 1, '', 'Impécable pour l''hyper tension', '', 9),
    (68, 'vega missile',  '*2 vitesse d''attaque', 1, '', 'Pour être satélisé', '', 9),
    (69, 'red boule',  '/2 vitesse d''attaque', 1, '', 'La contre façons', '', 9),
    (70, 'bipbip',  '*2 vitesse de déplacement', 1, '', 'A consommer dans un Saddam Usain bol', '', 9),
    (71, 'le coyotte',  '/2 vitesse de déplacement', 1, '', 'Le seul loup avec un frain à main', '', 9),
    (72, 'boubourse',  'stock money', 0, '', '', '', 12),
    (73, 'houblon',  '', 0, '', '', '', 10),
    (74, 'fut',  '', 0, '', '', '', 10),
    (75, 'sachet',  '', 0, '', '', '', 10),
    (76, 'mur',  '', 0, '', '', '', 11),
    (77, 'banc',  '', 0, '', '', '', 11),
    (78, 'table',  '', 0, '', '', '', 11),
    (79, 'fleurs',  '', 0, '', '', '', 11),
    (80, 'rochers',  '', 0, '', '', '', 11),
    (81, 'lampadaire',  '', 0, '', '', '', 11),
    (82, 'statue',  '', 0, '', '', '', 11),
    (83, 'tente',  '', 0, '', '', '', 11),
    (84, 'fontaine',  '', 0, '', '', '', 11),
    (85, 'petite maison',  '', 0, '', '', '', 11),
    (86, 'mur de berlin',  '', 0, '', '', '', 11),
    (87, 'seau',  '', 0, '', '', '', 11),
    (88, 'clôture',  '', 0, '', '', '', 11),
    (89, 'xp', '', '', '', '', '', 13),
    (90, 'pont', '', '', '', '', '', 14),
    (91, 'île', '', '', '', '', '', 14),
    (92, 'teleporteur', '', '', '', '', '', 14),
    (93, 'porte', '', '', '', '', '', 14)
;

/*
Insertion pour la table dialogue.
*/

INSERT INTO dialogue ("id_dialogue","contenu_dialogue", "id_personnage")
    VALUES
    (1, 'Bonjour mon bon Monsieur, je vous mettrais bien une petite bière ?', 4),
    (2, 'A votre santé !', 4),
    (3, 'Effectivement j''ai besoin d''aide, Toi l''amateur de bière, j''ai besoin que tu ailles récupérer du bon houblon chez Alain-Chichon, 1 fut chez Maitre-Kanter et le dernier élément secret chez Chie-mi Hendrix', 4),
    (4, 'Merci mon brave, voilà une bonne brune bien relevée. Bonne chance !', 4),
    (5, 'Hééééé, toi là-bas, tu veux de la bonne ?', 13),
    (6, 'Et voilà mon brave, du bon hublon, n''en mets pas trop si tu ne veux pas planer. A bientôt.', 13),
    (7, 'Bon vent !', 13),
    (8, 'Hopla, qu''est ce que tu veux, ici ?', 9),
    (9, 'Ça joue, voilà ton fut une fois !', 9),
    (10, 'Ok, barre toi alors wesh', 9),
    (11, 'Salut Fieu, j''ai concocté un gros paquet c''matin, t''en veux ?', 8),
    (12, 'Tiens, v''là l''sachet !', 8),
    (13, 'Je te comprends, peace !', 8),
    (14, 'Bonjour mon enfant, tu veux une petite friandise ?', 11),
    (15, 'Tu devras aller chasser 4 chauves-souris et les emener chez Durdur, pour qu''il te fabrique une Batte-Ail ! Ensuite, tu devras combattre le terrible Jean Marie le PNJ, vivant dans le noir. Tu pourras me récupérer son oeil en guise de trophée.', 11),
    (16, 'Si la prochaine fois, tu veux une friandise, tu viendras me voir dans le confessionnal.', 11),
    (17, 'Je vais te faire courir moi tu vas voir, n''est ce pas ?', 15),
    (18, 'Vous êtes ici pour le flouze ?', 2),
    (19, '??', 2),
    (20, 'Oui mon gars, des nains pas plus haut que trois pommes m''ont volé ma boubourse. Tu dois rencontrer Hippique-sous pour obtenir des informations', 2),
    (21, 'Bonjour Monsieur, venez-vous délester de vos pièces ici, je vous en prie !', 6),
    (22, 'Et voilà la sauce du chef ! Vous pourrez aller voir Durdur pour qu''il puisse vous forger une pièce rare, c''est un cadeau de Bernard. Bon courage !', 6),
    (23, 'Hallo ! Toi venir ici pour acheter armures ? Ja ?', 7),
    (24, 'Arch so ! Vous vouloir grosse casquette à pointe traditionnelle de mein land ! Moi avoir ça derrière gros comptoir, gut gut gut ! Vous vouloir lancer apfel sur ma grosse pointe ?', 7),
    (25, 'Super gut, si toi atteindre ma pointe, moi donner toi grosse boubourse ach !', 7),
    (26, 'Ha sacré voleur de schleu, merci pour ton aide mein freund, voici un joli pull ovaire fait par ma fille.', 2),
    (27, 'Bonjour mon lapin, tu es là pour mes gros objets fétiches, hihihi ?', 12),
    (28, 'Tu devras prouver tes talents en combat singulier à l''arène, mais pas avec n''importe quelle arme mon lapin !', 12),
    (29, 'Vous revenez de chez Victoria Big-B ?', 1),
    (30, 'Tu verras où je vais te les mettre ses objets !', 1),
    (31, 'Je suis en manque de vitesse, pouvez-vous m''aider ?', 14),
    (32, 'J''ai besoin de récupérer une potion à Nana Moule Curry au restaurant In&Out pour retrouver ma vitesse !', 14),
    (33, 'J''ai vendu la dernière potion au casino Scissor Palace, vous devriez peut être y faire un tour ! Pour me faire pardonner, je vous laisse ces Musse Tongue !', 10),
    (34, 'Tu as pu récupérer ma potion pour ma vitesse ?', 14),
    (35, 'Super ! On va pouvoir aller visiter le tunnel en Musse Tongue maintenant !', 14),
;

/*
Insertion pour la table maitrise.
*/

INSERT INTO maitrise ("id_personnage", "id_aptitude", "pourcentage_maitrise")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table instance.
*/

INSERT INTO instance ("id_objet", "id_lieu", "coordonnee", "quantite")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table possede.
*/

INSERT INTO possede ("id_personnage", "id_objet", "quantite")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table contient.
*/

INSERT INTO contient ("contenant", "id_objet_contenu", "quantite")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table donne.
*/

INSERT INTO donne ("id_interaction", "id_dialogue", "code_role_quete")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table active.
*/

INSERT INTO active ("id_objet", "id_interaction", "code_role_quete")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table constitue.
*/

INSERT INTO constitue ("id_interaction", "id_objectif", "parametre")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table declenche.
*/

INSERT INTO declenche ("id_interaction", "id_recompense", "id_objectif")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table accorde.
*/

INSERT INTO accorde ("id_objet", "id_recompense", "quantite")
    VALUES
    ('44', '', 1),
    ('89', '', 500),
    ('72', '', 20),
    ('10', '', 1),
    ('11', '', 1),
    ('72', '', 50),
    ('89', '', 750),
    ('62', '', 1),
    ('58', '', 1),
    ('20', '', 1),
    ('28', '', 1),
    ('15', '', 1),
    ('16', '', 1),
    ('18', '', 1),
    ('43', '', 1),
    ('70', '', 1),
    ('26', '', 1)

;

/*
Insertion pour la table mene.
*/

INSERT INTO mene ("id_dialogue_suivant", "id_dialogue_precedant", "choix")
    VALUES
    (2, 1, 'M''fois biensur et tu me mettras la petite soeur avec !'),
    (2, 1, 'Tu m''as pris pour qui ? Un alcoolique ? Je déconne tu m''en mettras 3 !'),
    (3, 1, 'C''est ici la bonne brune ?'),
    (2, 1, 'Non merci je préfère de l''eau'),
    (1, 3, 'J''accepte volontiers !'),
    (2, 3, 'Non merci j'' d''autres choses à faire'),
    (2, 5, 'J''aimerais commencer avec vous'),
    (3, 5, 'Je suis à la recherche de houblon pour me faire une bonne brune.'),
    (4, 5, 'Non, ça ça sent trop les fleurs ici !!'),
    (2, 8, 'Je voudrais récupérer un fut pour brasser'),
    (3, 8, 'Tu me remettras la petite soeur et tu me changeras le verre, celui-ci goute le savon, j''aime bien la mousse mais il ne faut pas exagérer !'),
    (3, 8, 'Mais pas si vite, ça fait d''la mousse !'),
    (2, 11, 'Allons''y, j''ai pris mon antiémétiques ce matin.'),
    (3, 11, 'OhBar m''a donné ce sachet pour récupérer un ingrédiant secret.'),
    (4, 11, 'Vu l''odeur, ça me ferait mal !'),
    (2, 14, 'Il parait qu''un vampire rode dans les environs, besoin d''une croisade ?'),
    (2, 18, 'Je voudrais parier !'),
    (2, 18, 'J''aimerais vos conseils pour me lancer dans les affaires'),
    (3, 18, 'C''est vous, qui êtes à la recherche d''une boubourse ?'),
    (4, 20, 'Yep, j''accepte la grosse quête'),
    (4, 20, 'Non, vous avez assez de flouze, je voudrais le vôtre'),
    (1, 21, 'Non, merci, je n''ai pas confiance. Je viens de la part de Nanard, il recherche sa boubourse perdue au dernier match de foot, vous auriez de infos ?'),
    (2, 21, 'Entre vous et ma femme, je vais peut être vous laisser mes économies !'),
    (3, 21, 'Les frais ne sont pas assez O Low Cost !'),
    (2, 23, 'Vous n''auriez pas plutôt des Schnitzel ?'),
    (2, 23, 'Jajaja, Muskatnuss herr Muller !'),
    (3, 23, 'C''est ici qu''on peut se procurer de l''équipement pour le concours de lancer de pommes ?'),
    (4, 23, 'Jajaja, moi avoir plein de Deutchmark'),
    (2, 24, 'Jajaja'),
    (2, 24, 'Nein nein nein'),
    (2, 27, 'Biensur et il n''y a pas que les objets qui sont gros ahaha. Plus c''est gros plus c''est bon !'),
    (2, 29, 'Quels objets ? Tu m''as pris pour une oeuvre de Paul McCarthy ?'),
    (2, 29, 'Oui j''ai besoin de ses objets fétiches !'),
    (2, 30, 'Non, je suis là pour me battre avec des gros durs !'),
    (2, 30, 'La laisser en vie et récupérer les objets de quelconque manière !'),
    (2, 31, 'Oui, biensur, je suis un très bon pilote !'),
    (2, 31, 'Non, je n''ai pas le permis...'),
    (2, 34, 'Oui, biensur et j''ai même des Musse Tongue en prime pour voyager sereinement !'),
    (2, 34, 'Non, malheureusement Nana Moule Curry à vendu la dernière au Casino !')
;

/*
Insertion pour la table considere.
*/

INSERT INTO considere ("id_personnage_juger", "id_personnage_juge", "aggressif")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table definit.
*/

INSERT INTO definit ("id_personnage", "id_statistique", "valeur", "valeur_max")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table relie.
*/

INSERT INTO relie ("id_objet_porte_entree", "id_objet_porte_sortie")
    VALUES
    (''),
    ('')
;

/*
Insertion pour la table positionne.
*/

INSERT INTO positionne ("id_personnage", "coordonnee")
    VALUES
    (''),
    ('')
;
