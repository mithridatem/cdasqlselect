USE judoka;
--
-- ajout de 2 nouveaux judokas
--
INSERT INTO judoka(nom_judoka, prenom_judoka, age, sexe, id_niveau) 
VALUES("Mithridate", "mathieu", 41, "H", 6),
("Dupont", "Jean", 30, "H", 4);
--
-- suppression des 2 derniers judokas
--
DELETE FROM judoka WHERE id_judoka =11;
DELETE FROM judoka WHERE id_judoka =12;

-- ou
DELETE FROM judoka WHERE id_judoka > 10;