
/*
Insertion pour la table compte_utilisateur.
*/

INSERT INTO compte_utilisateur ("pseudo_compte", "mdp_compte", "courriel_compte", "valid")
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

INSERT INTO race ("nom_race", "description_race", "jouable") 
    VALUES 
    ('Humains', 'Ambitieux, parfois héroïques, mais toujours confiants, les humains sont capables de travailler ensemble pour atteindre des objectifs communs, ce qui fait d’eux une puissance à ne pas négliger. Ils ont une espérance de vie réduite par rapport aux autres races, mais leur énergie sans limites et leurs passions leur permettent d’accomplir beaucoup de choses malgré leur brève existence.', '1'),
    ('Nains', 'On pense souvent que ces défenseurs des villes montagneuses petits et râblés sont sévères et dépourvus de tout sens de l’humour. Ils sont connus pour être des grand industriels dont les produit sont toujours d''une grande qualité et pour avoir une affinité particulière avec les richesses cachées dans les entrailles de la terre. Les nains ont aussi tendance à s’isoler et à se replier sur leurs traditions, au point de sombrer parfois dans la xénophobie.', '1'),
    ('Elfes', 'Grands, nobles et souvent hautains, les elfes à la longue espérance de vie sont les maîtres subtils de la nature. Ils excellent dans les arts magiques et utilisent souvent leur lien inné avec la nature pour inventer de nouveaux sorts et fabriquer de merveilleux objets qui, comme leurs créateurs, semblent presque hors d’atteinte des ravages du temps. Les elfes forment une race secrète et souvent introvertie, qui donne parfois l’impression d’être imperméable aux suppliques d’autrui.', '0'),
    ('Orques', 'Sauvages, brutaux et résistants, les orques sont souvent le fléau des lointaines étendues naturelles et des grottes profondes. Beaucoup deviennent de redoutables mercenaires, du fait de leur stature musculeuse et de leur tendance à entrer dans des rages sanglantes. Les quelques rares qui parviennent à contrôler leur soif de sang font d’excellents aventuriers.', '1'),
    ('Rat', '', '0'),
    ('Chauves Souris', '', '0')
;

/*
Insertion pour la table lieu
*/

INSERT INTO lieu ("nom_lieu", "description_lieu", "carte_lieu")
    VALUES
    ('Bad-town', 'Ville centrale du peuple Orc', 'Bad-town.jpg'),
    ('Profit-city', 'Ville principale des Nains', 'Profit-city.jpg'),
    ('Nain-port-nawak', 'Contrairement a ce que l''on pourrait penser, il s''agit de la ville principale des Humains', 'Nain-port-nawak.jpg'),
    ('Elf village', 'Ville principale des Elfes', 'Elf_village.jpg')
;

/*
Insertion pour la table type_objet.
*/

INSERT INTO type_objet ("nom_type_objet", "emplacement")
    VALUES
    ('arme à distance', 'slotArme'),
    ('arme à 2 mains', 'slotArme1 & slotArme'),
    ('arme cac', 'slotArme'),
    ('casque', 'tete'),
    ('armure', 'torse'),
    ('gants', 'main'),
    ('pantalons', 'jambe'),
    ('chaussures', 'pied'),
    ('potion', 'consommable'),
    ('objet de quetes', ),
    ('Décor', ),
    ('Monnaies', )
;

/*
Insertion pour la table interactions.
*/

INSERT INTO interactions ("prerequis_interaction", "nom_interaction", "description_interaction", "completion_interaction")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table recompense.
*/

INSERT INTO recompense ("nom_recompense", "decription_recompense")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table objectif.
*/

INSERT INTO objectif ("nom_objectif", "description_objectif", "validation")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
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
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table caracteristique.
*/

INSERT INTO caracteristique ("nom_caracteristique", "description_caracteristique")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table personnage.
*/

INSERT INTO personnage ("nom_personnage", "niveau_personnage", "direction", "alignement", "monnaie", "vivant", "id_lieu", "id_race", "id_compte_utilisateur")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table aptitude.
*/

INSERT INTO aptitude ("nom_aptitude", "effet_aptitude", "prerequis_aptitude", "id_type_aptitude")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table objet.
*/

INSERT INTO objet ("nom_objet", "statistique_objet", "equipe", "ouvert", "description_objet", "prix", "id_type_objet")
    VALUES
    ('fusil Lorrain', '+1 force', 1, '', 'Fusil légendaire de Lorraine, capable d''envoyer des fuseaux a 50 km/h', '', 1),
    ('paprik''arme', '+2 force', 1, '', 'Le piment le plus fort de tous les héros', '', 1),
    ('lance saucisse', '+3 force', 1, '', 'De son vrai nom große würst', '', 1),
    ('Patator', '+4 force', 1, '', 'Le traditionnel lance patate Russe utiliser par Poutine en Ukraine', '', 1),
    ('arbalais', '+5 force', 1, '', 'Monsieur Potter, merci de ramener le balais', '', 1),
    ('la boule de pétoncle', '+6 force', 1, '', 'Célébre boule du comédon Cousteau', '', 1),
    ('pestolet', '+7 force', 1, '', 'Ajouter du basilic, de l''ail et des François pignon et du parmesan on obtient cette arme légendaire', '', 1),
    ('couperet bretzel', '+2 force', 1, '', 'Apparut en Alsace pendant la période des spaetzle du cervelas et de la choucroute en l''an 69', '', 2),
    ('rôtisseur', '+4 force', 1, '', 'Célèbre arme du colonel Sander', '', 2),
    ('la pelle forte', '+6 force', 1, '', 'Merci Berny pour votre invention autoroutiere', '', 2),
    ('batte ail', '+8 force', 1, '', 'Arme favorite de Blade', '', 2),
    ('la fausse croix', '+10 force', 1, '', 'Arme légendaire de nazareth', '', 2),
    ('poing chope', '+1 force', 1, '', 'Mélange entre chopine et poing ricain', '', 3),
    ('dague Ober', '+2 force', 1, '', 'Mais qui l''a mise à l''envers ?', '', 3),
    ('couilletau', '+3 force', 1, '', 'Crustacé qui sent la marais', '', 3),
    ('dardvador', '+4 force', 1, '', 'Aussi rouge que le sabre', '', 3),
    ('porc table', '+5 force', 1, '', 'Mi porc, mi ours, mi homme,,, Je m''égare il est seulement mi table', '', 3),
    ('jason tatane', '+8 force', 1, '', 'Pour les puristes de la bagarre', '', 3),
    ('bonnet m', '+2 agilité', 1, '', 'Le sugar daddy cool des chapias', '', 4),
    ('casquette a pointe', '+2 agilité', 1, '', 'Célèbre casquette germanique, utilisée dans les concours de lancer de pomme', '', 4),
    ('k-lotte', '+2 agilité', 1, '', 'Arme célèbre de la confrérie Lopez, 100% cuivre', '', 4),
    ('kippab', '+2 agilité', 1, '', 'Salade tomate oignon du chapeau ', '', 4),
    ('baie raie', '+2 agilité', 1, '', 'Le fruit qui résume bien la situation " l''abricôt"', '', 4),
    ('plas''thon',  '+1 agilité', 1, '', 'Construite en boite de petit navire', '', 5)
    ('plas''tèque',  '+2 agilité', 1, '', 'Manger 5 fruits et légumes par jours', '', 5)
    ('côte de beauf',  '+3 agilité', 1, '', 'Parfait pour les soirées tuning', '', 5),
    ('l''ainée',  '+4 agilité', 1, '', 'Allez voir sur wikipédia', '', 5),
    ('pull ovaire',  '+5 agilité', 1, '', 'Bien mieux que le col roulé', '', 5),
    ('gants stères',  '+1 agilité', 1, '', 'Parfait pour ramasser le bois', '', 6),
    ('mie Teigne',  '+2 agilité', 1, '', 'Boulanger tétu de renommé', '', 6),
    ('bollet rouge',  '+3 agilité', 1, '', 'Célébre coiffe du comédon Cousteau', '', 6),
    ('croque mie teigne',  '+4 agilité', 1, '', 'Croque monsieur du boulanger', '', 6),
    ('gant de toilette',  '+5 agilité', 1, '', 'Progéniture de Servietski', '', 6),
    ('bretelle',  '+1 agilité', 1, '', 'Et porte jartelle', '', 7),
    ('bas thon',  '+2 agilité', 1, '', 'Le leggings du comédon Cousteau', '', 7),
    ('benne laden',  '+3 agilité', 1, '', 'Enfilez vos deux jambes dedans', '', 7),
    ('beer muda',  '+4 agilité', 1, '', 'Mi jaune mi blanc', '', 7),
    ('fûtal',  '+5 agilité', 1, '', 'Parfait pour protéger votre trou du fût', '', 7),
    ('crocs',  '+1 agilité', 1, '', 'Style hollandais, chaussette claquette', '', 8),
    ('bas bouche',  '+2 agilité', 1, '', 'Babooshka, babooshka, babooshka ja, ja', '', 8),
    ('adaddas',  '+3 agilité', 1, '', 'Des contre façons efficaces', '', 8),
    ('les talons',  '+4 agilité', 1, '', 'Dixit the Italian Stallion', '', 8),
    ('musse tongue',  '+5 agilité', 1, '', 'Aussi rapide que l''original', '', 8),
    ('pinte',  '+2 esquive', 1, '', 'Je vous remettrais bien la petite sœur?', '', 9),
    ('tord boyaux',  '+50 mana / -50 pv', 1, '', 'Très utile pour les nœuds de huit', '', 9),
    ('Sheba',  '+50 pv / -50 mana', 1, '', 'Alain sheba, un gros nul', '', 9),
    ('shot',  '+25 pv', 1, '', 'Boisson chaude de charlie Sheen', '', 9),
    ('grogs',  '+50 pv', 1, '', 'Recette mythique des mère grand', '', 9),
    ('ukranium',  '+25 mana', 1, '', 'Très prisé en Russie actuellement', '', 9),
    ('muscat death',  '-50 mana', 1, '', 'Tu bois tu meurts', '', 9),
    ('houmous tache',  '-2 dodge', 1, '', 'Repas favoris de Staline', '', 9),
    ('tsar tziki',  '-5 dodge', 1, '', 'Sauce favorite de Lenine', '', 9),
    ('potion magique',  '/2 magic', 1, '', 'Remet les idées fixes', '', 9),
    ('asperule',  '/2 pv', 1, '', 'C''est comme le jagermeister mais en plus mauvais', '', 9),
    ('sauce dallas',  '*2 magic', 1, '', 'Sur les boulettes ?', '', 9),
    ('sauce biggy',  '*2 force', 1, '', 'Avec ou sans frites ?', '', 9),
    ('sauce hannibal',  '*2 pv', 1, '', 'Pour les Lecter vegan', '', 9),
    ('sauce blanche',  '*2 dodge', 1, '', 'Très populaire chez les albinos du RN', '', 9),
    ('barbie turique',  'poisoned', 1, '', 'Le Ken lubrique', '', 9),
    ('amnesia',  'stunt', 1, '', 'A ne surtout pas fumer', '', 9),
    ('algoflash',  'blind', 1, '', 'L''algorithme de toto', '', 9),
    ('le sang du christ',  'blessed', 1, '', 'Tu ne trouves pas ça assez catholique ?', '', 9),
    ('valium',  'sleep', 1, '', 'Bienvenue le marchand de sable', '', 9),
    ('bezoard',  'heal poisoned', 1, '', 'Accumulations très denses de matière partiellement digérée ou non digérée pouvant se coincer dans l''estomac ou les intestins', '', 9),
    ('collyre',  'heal blind', 1, '', 'Lorsque vous êtes aveugles, bien viser les yeux', '', 9),
    ('schneck',  'heal stunt', 1, '', 'Très bon pain aux raisins de Moselle', '', 9),
    ('epinephrine',  'heal sleep', 1, '', 'Impécable pour l''hyper tension', '', 9),
    ('vega missile',  '*2 vitesse d''attaque', 1, '', 'Pour être satélisé', '', 9),
    ('red boule',  '/2 vitesse d''attaque', 1, '', 'La contre façons', '', 9),
    ('bipbip',  '*2 vitesse de déplacement', 1, '', 'A consommer dans un Saddam Usain bol', '', 9),
    ('le coyotte',  '/2 vitesse de déplacement', 1, '', 'Le seul loup avec un frain à main', '', 9),
    ('Boubourse',  'stock money', 0, '', '', '', 12),
    ('houblon',  '', 0, '', '', '', 10),
    ('fut',  '', 0, '', '', '', 10),
    ('sachet',  '', 0, '', '', '', 10),
    ('mur',  '', 0, '', '', '', 11),
    ('banc',  '', 0, '', '', '', 11),
    ('table',  '', 0, '', '', '', 11),
    ('fleurs',  '', 0, '', '', '', 11),
    ('rochers',  '', 0, '', '', '', 11),
    ('lampadaire',  '', 0, '', '', '', 11),
    ('statue',  '', 0, '', '', '', 11),
    ('tente',  '', 0, '', '', '', 11),
    ('fontaine',  '', 0, '', '', '', 11),
    ('petite maison',  '', 0, '', '', '', 11),
    ('mur de berlin',  '', 0, '', '', '', 11),
    ('seau',  '', 0, '', '', '', 11),
    ('clôture',  '', 0, '', '', '', 11)
;

/*
Insertion pour la table dialogue.
*/

INSERT INTO dialogue ("Contenu_dialogue", "id_personnage")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table maitrise.
*/

INSERT INTO maitrise ("id_personnage", "id_aptitude", "pourcentage_maitrise")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table instance.
*/

INSERT INTO instance ("id_objet", "id_lieu", "coordonee", "quantite")
    VALUES
    ('12', '3', '(10,235;0,159)', '10')
;

/*
Insertion pour la table possede.
*/

INSERT INTO possede ("id_personnage", "id_objet", "quantite")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table contient.
*/

INSERT INTO contient ("contenant", "id_objet_contenu", "Quantite")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table donne.
*/

INSERT INTO donne ("id_interaction", "id_dialogue", "code_role_quete")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table active.
*/

INSERT INTO active ("id_objet", "id_interaction", "code_role_quete")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table constitue.
*/

INSERT INTO constitue ("id_interaction", "id_objectif", "parametre")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table declenche.
*/

INSERT INTO declenche ("id_interaction", "id_recompense", "id_objectif")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table accorde.
*/

INSERT INTO accorde ("id_objet", "id_recompense", "quantite")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table mene.
*/

INSERT INTO mene ("id_dialogue_Suivant", "id_dialogue_Precedent", "Choix")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table considere.
*/

INSERT INTO considere ("id_personnage_Juger", "id_personnage_Juge", "aggressif")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table definit.
*/

INSERT INTO definit ("id_personnage", "Id_Statistique", "Valeur", "Valeur_max")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table relie.
*/

INSERT INTO relie ("id_objet_porte_entre", "id_objet_porte_sortie")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;

/*
Insertion pour la table positionne.
*/

INSERT INTO positionne ("id_personnage", "coordonee")
    VALUES
    ('Avancer',  '', '', 1),
    ('Tourner à droite',  '', '', 1),
    ('Tourner à gauche',  '', '', 1),
    ('Reculer',  '', '', 1),
    ('Esquive droite',  '', '', 1),
    ('Esquive gauche',  '', '', 1),
    ('Boule de feu',  '', '', 2),
    ('Graine versatile',  '', '', 2),
    ('Ballayage tranchant',  '', '', 2),
    ('Martellement lourd',  '', '', 2),
    ('Tir incapacitant',  '', '', 2),
    ('Parade',  '', '', 2),
    ('Contre-attaque',  '', '', 2)
;








