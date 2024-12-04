-- Afficher la liste des produits qui n'ont jamais été dans un ticket de caisse.
SELECT p.nom_produit FROM produit_ticket AS pt 
RIGHT JOIN produit AS p ON pt.id_produit = p.id_produit
WHERE pt.id_produit IS NULL
GROUP BY p.nom_produit;

-- Afficher la liste des vendeurs qui n'ont jamais vendu un produit
SELECT v.nom_vendeur, v.prenom_vendeur FROM produit_ticket AS pt
INNER JOIN ticket AS t ON pt.id_ticket = t.id_ticket
RIGHT JOIN vendeur AS v On t.id_vendeur = v.id_vendeur
WHERE pt.id_ticket IS NULL
GROUP BY v.nom_vendeur;
 
-- Afficher les 3 produits qui sont le plus vendus.
SELECT p.nom_produit, SUM(pt.quantite) AS cpt  FROM produit_ticket AS pt
INNER JOIN produit As p ON pt.id_produit = p.id_produit
GROUP BY p.nom_produit
ORDER BY cpt DESC LIMIT 3;
