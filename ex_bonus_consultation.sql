-- Afficher le chiffre d'affaire global (tous les tickets) avec le montant TTC
SELECT CONCAT(ROUND(SUM(p.tarif * pt.quantite),2), ' €') AS total_ttc FROM
produit_ticket AS pt
INNER JOIN produit AS p ON pt.id_produit = p.id_produit;
  
-- Afficher tous les tickets avec : date_creation, le montant TTC du ticket,
SELECT t.date_creation, CONCAT(ROUND(SUM(p.tarif * pt.quantite),2), ' €') AS total_ttc FROM
produit_ticket AS pt
INNER JOIN produit AS p ON pt.id_produit = p.id_produit
INNER JOIN ticket AS t ON pt.id_ticket = t.id_ticket
GROUP BY t.id_ticket;

-- Afficher le ticket 1 avec le nom_produit, quantite, sous-total (quantitetarif*),
SELECT p.nom_produit, pt.quantite, CONCAT(ROUND(SUM(pt.quantite * p.tarif), 2), ' €') AS sous_total 
FROM produit_ticket AS pt
INNER JOIN produit AS p ON pt.id_produit = p.id_produit
WHERE pt.id_ticket = 1
GROUP BY p.nom_produit;

-- Afficher le chiffre d'affaire par année en affichant : année, montant du chiffre affaire,
SELECT YEAR(t.date_creation) AS annee, CONCAT(ROUND(SUM(pt.quantite * p.tarif), 2), ' €') AS sous_total 
FROM produit_ticket AS pt
INNER JOIN ticket AS t ON pt.id_ticket = t.id_ticket
INNER JOIN produit AS p ON pt.id_produit = p.id_produit
GROUP BY annee;

-- Afficher le vendeur qui à réalisé le chiffre d'affaire le plus important avec : 
-- nom_vendeur, prenom_vendeur, chiffre affaire,
SELECT v.nom_vendeur, v.prenom_vendeur, CONCAT(ROUND(SUM(pt.quantite * p.tarif), 2), ' €') AS ca 
FROM produit_ticket AS pt
INNER JOIN ticket AS t ON  pt.id_ticket = t.id_ticket
INNER JOIN produit As p ON pt.id_produit = p.id_produit
INNER JOIN vendeur AS v ON t.id_vendeur = v.id_vendeur
GROUP BY v.id_vendeur;

-- Afficher les 3 produits qui sont le plus vendus avec : 
-- nom_produit, nom_categorie, le chiffre d'affaire du produit,
SELECT p.nom_produit, c.nom_categorie, CONCAT(ROUND(SUM(pt.quantite * p.tarif), 2), ' €') AS ca
FROM produit_ticket AS pt
INNER JOIN produit AS p ON pt.id_produit = p.id_produit
INNER JOIN categorie AS c ON p.id_categorie = c.id_categorie
GROUP BY p.nom_produit
ORDER BY SUM(pt.quantite * p.tarif) DESC
LIMIT 3;

-- Afficher par catégorie le chiffre d'affaire avec : 
-- nom_categorie, le montant TTC du chiffre d'affaire de la catégorie.
SELECT c.nom_categorie, CONCAT(ROUND(SUM(pt.quantite * p.tarif), 2), ' €') AS ca
FROM produit_ticket AS pt
INNER JOIN produit AS p ON pt.id_produit = p.id_produit
INNER JOIN categorie AS c ON p.id_categorie = c.id_categorie
GROUP BY c.nom_categorie;