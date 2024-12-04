use judoka;
--
-- Requêtes de selection
--

-- select 1 judoka étant ceinture verte version inner join

SELECT j.id_judoka, j.nom_judoka, j.prenom_judoka, j.age, j.sexe, n.couleur_ceinture 
FROM judoka AS j INNER JOIN niveau AS n ON j.id_niveau = n.id_niveau 
WHERE n.couleur_ceinture = "verte";

-- select 1 judoka étant ceinture verte version id_niveau = 4
SELECT j.id_judoka, j.nom_judoka, j.prenom_judoka, j.age, j.sexe, j.id_niveau 
FROM judoka AS J WHERE id_niveau = 4;

-- select 1 judoka étant ceinture version requête imbriqué
SELECT j.id_judoka, j.nom_judoka, j.prenom_judoka, j.age, j.sexe_judoka, id_niveau 
FROM judoka AS j WHERE j.id_niveau = (SELECT n.id_niveau FROM niveau n WHERE n.couleur_ceinture ="verte");


-- select 2 nombre de participants à la compétition dont le nom est judo31

SELECT COUNT(jc.id_judoka) FROM judoka_competition AS jc 
INNER JOIN competition AS c
ON jc.id_cpt = c.id_cpt WHERE competition.nom_cpt = "judo31";

-- select 2 nombre de participants à la compétition dont le nom est judo31 avec alias

SELECT COUNT(jc.id_judoka) AS nbr_participants_judo31 FROM judoka_competition AS jc 
INNER JOIN competition AS c
ON jc.id_cpt = c.id_cpt WHERE c.nom_cpt = "jud031";

-- select 3 afficher la liste des participants à la compétition dont le nom est judo81 (avec le nom, prénom, age et sexe du judoka)

SELECT j.nom_judoka, j.prenom_judoka, j.age, j.sexe from judoka_competition AS jc 
INNER JOIN judoka AS j ON jc.id_judoka = j.id_judoka 
INNER JOIN competition AS c ON jc.id_cpt = c.id_cpt 
WHERE c.nom_cpt = "judo31";

-- select 4 afficher la liste des judokas étant ceinture marron et dont l’âge est supérieur à 19 ans

SELECT j.nom_judoka, j.prenom_judoka, j.age, j.sexe FROM
judoka AS j INNER JOIN niveau AS n ON j.id_niveau = n.id_niveau 
WHERE n.couleur_ceinture = "marron" AND j.age > 19;

-- select 5 afficher la liste des judokas avec leurs couleurs de ceinture (inner join avec la table niveau) 
-- et trier cette liste par ordre alphabétique (tri sur le champ nom_judoka).

SELECT j.nom_judoka, j.prenom_judoka, j.age, j.sexe, n.couleur_ceinture 
FROM judoka AS j INNER JOIN niveau AS n ON j.id_niveau = n.id_niveau 
ORDER BY j.nom_judoka;