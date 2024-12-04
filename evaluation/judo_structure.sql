--
-- creation base judoka
--
create database judoka;
use judoka;
--
-- creation des tables
--
create table niveau(
id_niveau int auto_increment primary key not null,
couleur_ceinture varchar(50)
)ENGINE=InnoDB;

create table judoka(
id_judoka int auto_increment primary key not null,
nom_judoka varchar(50) null,
prenom_judoka varchar(50) null,
age int null,
sexe varchar(5),
id_niveau int null
)ENGINE=InnoDB;

create table competition(
id_cpt int auto_increment primary key not null,
nom_cpt varchar(50),
date_debut date,
date_fin date
)ENGINE=InnoDB;

create table judoka_competition(
id_judoka int,
id_cpt int,
primary key (id_judoka,id_cpt)
)ENGINE=InnoDB;
--
-- contraites Foreign Key
--
alter table judoka
add constraint judoka_fk_niveau
foreign key(id_niveau)
references niveau(id_niveau);

alter table judoka_competition
add constraint fk_judoka_competition_judoka
foreign key(id_judoka)
references judoka(id_judoka);

alter table judoka_competition
add constraint fk_judoka_competition_cpt
foreign key(id_cpt)
references competition(id_cpt);