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
    JOIN couleur
        ON article.id_couleur = couleur.id_couleur
    JOIN marque
        ON article.id_marque = marque.id_marque
            JOIN pays
                ON marque.id_pays = pays.id_pays
                    JOIN continent
                        ON pays.id_continent = continent.id_continent

ORDER BY nom_continent, nom_pays;

-- 2) Nombre de bières par fabricant

SELECT nom_fabricant, COUNT(id_article) AS nombre_de_biere
FROM article
    JOIN marque
        ON article.id_marque = marque.id_marque
            JOIN fabricant 
                ON marque.id_fabricant = fabricant.id_fabricant
                
GROUP BY nom_fabricant
ORDER BY nom_fabricant;


-- 3) Pour chaque pays, établir la moyenne de bières à partir du type

-- requête principale (à écrire en 2ème) --> AFFICHE le résultat
SELECT nb_bierre.nom_pays, ROUND(AVG(biere_par_type),2) AS moyenne_de_biere
FROM pays -- // depuis la TABLE "PAYS"

-- requête imbriquée (à écrire en 1er)
    JOIN( -- // on simule une nouvelle TABLE : nb_bierre

            SELECT nom_pays, nom_type, COUNT(nom_type) AS biere_par_type
            FROM article
                JOIN marque -- // lien vers TABLE "PAYS"
                    ON article.id_marque = marque.id_marque
                        JOIN pays
                            ON marque.id_pays = pays.id_pays
                JOIN typebiere -- // lien vers TABLE "TYPEBIERE"
                    ON article.id_type = typebiere.id_type 
                
            GROUP BY nom_type, nom_pays
           -- ORDER BY nom_pays; // TRI par pays

        )   AS nb_bierre -- // NOM de la TABLE

    ON nb_bierre.nom_pays = pays.nom_pays

GROUP BY nb_bierre.nom_pays
ORDER BY nom_pays;


-- 4) Pour un ticket (n°2): j'aimerais le détail de chaque ligne à savoir le nom de l'article, la quantité, 
--    le prix unitaire et le total par ligne ordonnée par année.

SELECT ticket.numero_ticket, ticket.annee, nom_article, quantite, prix_vente, quantite*prix_vente AS total
FROM article
    JOIN vendre
        ON article.id_article = vendre.id_article
            JOIN ticket
                ON vendre.numero_ticket = ticket.numero_ticket AND vendre.annee = ticket.annee

WHERE ticket.numero_ticket = 2
ORDER BY ticket.annee;


-- 5) Le montant global moyen pour un ticket par année

SELECT ticket.annee, SUM(quantite*prix_vente)/COUNT(ticket.numero_ticket) AS montant_moyen, SUM(quantite*prix_vente) AS total_vente
-- ou ROUND(AVG((quantite*prix_vente)::NUMERIC),3) 
FROM article
    JOIN vendre
        ON article.id_article = vendre.id_article
            JOIN ticket
                ON vendre.numero_ticket = ticket.numero_ticket AND vendre.annee = ticket.annee

GROUP BY ticket.annee
ORDER BY ticket.annee;
