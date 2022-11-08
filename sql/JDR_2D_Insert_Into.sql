
--INSERT INTO Table type_aptitude
INSERT INTO type_aptitude (id_type_aptitude, nom_type_aptitude)
VALUES (1, 'aptitude de base'),
       (2, 'habilité'),
       (3, 'maitrise des montures'),
       (4, 'sort');

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

--INSERT INTO 