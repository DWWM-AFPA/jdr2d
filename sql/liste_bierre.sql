/**
file:///C:/Users/CDA-10/Downloads/sdbm_schema.pdf

Faites moi les requetes pour:
1) Liste des bières avec type de bière, la marque, la couleur ordonnée par continent et pays
2) Nombre de bières par fabricant
3) Pour chaque pays, établir la moyenne de bières à partir du type
4) Pour un ticket: j'aimerais le détail de chaque ligne à savoir le nom de l'article, la quantité, le prix unitaire et le total par ligne ordonnée par année.
5) Le montant global moyen pour un ticket par année

**/

-- 1) Liste des bières avec type de bière, la marque, la couleur ordonnée par continent et pays

SELECT nom_article, nom_type, nom_marque, nom_couleur, nom_pays, nom_continent
FROM article
    JOIN typebiere
        ON article.id_type = typebiere.id_type
    JOIN marque
        ON article.id_marque = marque.id_marque
    JOIN couleur
        ON article.id_couleur = couleur.id_couleur

            JOIN pays
                ON marque.id_pays = pays.id_pays
                    JOIN continent
                        ON pays.id_continent = continent.id_continent

ORDER BY nom_continent, nom_pays;

-- 2) Nombre de bières par fabricant

SELECT nom_fabricant, COUNT(id_article) 
FROM article
    JOIN marque
        ON article.id_marque = marque.id_marque
            JOIN fabricant 
                ON marque.id_fabricant = fabricant.id_fabricant
                
GROUP BY nom_fabricant
ORDER BY nom_fabricant;