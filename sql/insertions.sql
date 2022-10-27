
/*
Insertion pour la table  race.
*/


INSERT INTO 'race' ('nom_race', 'description_race', 'jouable') 
    VALUES 
    (`Humains`, `Ambitieux, parfois héroïques, mais toujours confiants, les humains sont capables de travailler ensemble pour atteindre des objectifs communs, ce qui fait d’eux une puissance à ne pas négliger. Ils ont une espérance de vie réduite par rapport aux autres races, mais leur énergie sans limites et leurs passions leur permettent d’accomplir beaucoup de choses malgré leur brève existence.`, 1),
    (`Nains`, `On pense souvent que ces défenseurs des villes montagneuses petits et râblés sont sévères et dépourvus de tout sens de l’humour. Ils sont connus pour être des grand industriels dont les produit sont toujours d'une grande qualité et pour avoir une affinité particulière avec les richesses cachées dans les entrailles de la terre. Les nains ont aussi tendance à s’isoler et à se replier sur leurs traditions, au point de sombrer parfois dans la xénophobie.`, 1),
    (`Elfes`, `Grands, nobles et souvent hautains, les elfes à la longue espérance de vie sont les maîtres subtils de la nature. Ils excellent dans les arts magiques et utilisent souvent leur lien inné avec la nature pour inventer de nouveaux sorts et fabriquer de merveilleux objets qui, comme leurs créateurs, semblent presque hors d’atteinte des ravages du temps. Les elfes forment une race secrète et souvent introvertie, qui donne parfois l’impression d’être imperméable aux suppliques d’autrui.`, 0),
    (`Orques`, `Sauvages, brutaux et résistants, les orques sont souvent le fléau des lointaines étendues naturelles et des grottes profondes. Beaucoup deviennent de redoutables mercenaires, du fait de leur stature musculeuse et de leur tendance à entrer dans des rages sanglantes. Les quelques rares qui parviennent à contrôler leur soif de sang font d’excellents aventuriers.`, 1),
    (`Rat`, ``, 0),
    (`Chauves Souris`, ``, 0);

/*
Insertion pour la table type aptitudes.
*/


INSERT INTO `type_aptitude` (`nom_type_aptitude`)
    VALUES
    (``),
    (``),
    (``),


/*
Insertion pour la table compte_utilisateur.
*/


INSERT INTO `compte_utilisateur` (`pseudo_compte`, `mdp_compte`, `courriel_compte`, `valid`)
    VALUES
    (`un`, `1001`, `un@myJdr2D.com`, 1),
    (`deux`, `1002`, `deux@myJdr2D.com`, 1),
    (`trois`, `1003`, `trois@myJdr2D.com`, 1),
    (`quatre`, `1004`, `quatre@myJdr2D.com`, 1),
    (`cinq`, `1005`, `cinq@myJdr2D.com`, 1),
    (`six`, `1006`, `six@myJdr2D.com`, 1),
    (`sept`, `1007`, `sept@myJdr2D.com`, 1),
    (`huit`, `1008`, `huit@myJdr2D.com`, 1),
    (`neuf`, `1009`, `neuf@myJdr2D.com`, 1),
    (`dix`, `1010`, `dix@myJdr2D.com`, 1),
    (`onze`, `1011`, `onze@myJdr2D.com`, 1)

/*
Insertion pour la table lieu
*/


INSERT INTO `lieu` (`nom_lieu`, `description_lieu`, `carte_lieu`)
    VALUES
    (`Bad-town`, `Ville centrale du peuple Orc`, `Bad-town.jpg`),
    (`Profit-city`, `Ville principale des Nains`, `Profit-city.jpg`),
    (`Nain-port-nawak`, `Contrairement a ce que l'on pourrait penser, il s'agit de la ville principale des Humains`, `Nain-port-nawak.jpg`),
    (`Elf village`, `Ville principale des Elfes`, `Elf_village.jpg`),
    (`cinq`, ``, ``),
    (`six`, ``, ``),
    (`sept`, ``, ``),
    (`huit`, ``, ``),
    (`neuf`, ``, ``),
    (`dix`, ``, ``),
    (`onze`, ``, ``)


/*
Insertion pour la table lieu
*/


INSERT INTO `lieu` (`nom_lieu`, `description_lieu`, `carte_lieu`)
    VALUES
    (`Bad-town`, `Ville centrale du peuple Orc`, `Bad-town.jpg`),
    (`Profit-city`, `Ville principale des Nains`, `Profit-city.jpg`),
    (`Nain-port-nawak`, `Contrairement a ce que l'on pourrait penser, il s'agit de la ville principale des Humains`, `Nain-port-nawak.jpg`),
    (`Elf village`, `Ville principale des Elfes`, `Elf_village.jpg`),
    (`cinq`, ``, ``),
