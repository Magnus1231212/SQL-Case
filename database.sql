-- Oprettelse af databasen
use master;
IF OBJECT_ID ('dbo.skole_data_main', 'U') IS NOT NULL
DROP DATABASE skole_data_main;

go

CREATE DATABASE skole_data_main;
go

use skole_data_main;

-- Oprettelse af tabel klasse
CREATE TABLE klasse (
    klasse_id int NOT NULL,
    klasse varchar(255) NOT NULL,
    PRIMARY KEY (klasse_id)
);

-- Oprettelse af tabel post_nr_by
CREATE TABLE post_nr_by (
    post_nr int NOT NULL,
    by_navn varchar(255) NOT NULL,
    PRIMARY KEY (post_nr)
);

-- Oprettelse af tabel elev
CREATE TABLE elev (
    elev_id int NOT NULL,
    fornavn varchar(255) NOT NULL,
    efternavn varchar(255) NOT NULL,
    adresse varchar(255) NOT NULL,
    post_nr int NOT NULL,
    klasse_id int NOT NULL,
    PRIMARY KEY (elev_id),
    FOREIGN KEY (post_nr) REFERENCES post_nr_by (post_nr),
    FOREIGN KEY (klasse_id) REFERENCES klasse (klasse_id)
);

-- Oprettelse af tabel laerer
CREATE TABLE laerer (
    laerer_id int NOT NULL,
    fornavn varchar(255) NOT NULL,
    efternavn varchar(255) NOT NULL,
    adresse varchar(255) NOT NULL,
    post_nr int NOT NULL,
    klasse_id int NOT NULL,
    PRIMARY KEY (laerer_id),
    FOREIGN KEY (post_nr) REFERENCES post_nr_by (post_nr),
    FOREIGN KEY (klasse_id) REFERENCES klasse (klasse_id)
);

go

-- data instert til post_nr_by tabel
INSERT INTO post_nr_by ([post_nr], [by_navn]) VALUES ('1824','Frederiksberg C')
INSERT INTO post_nr_by ([post_nr], [by_navn]) VALUES ('2300','København S')
INSERT INTO post_nr_by ([post_nr], [by_navn]) VALUES ('2500','Valby')
INSERT INTO post_nr_by ([post_nr], [by_navn]) VALUES ('2610','Rødovre')
INSERT INTO post_nr_by ([post_nr], [by_navn]) VALUES ('2650','Hvidovre')
INSERT INTO post_nr_by ([post_nr], [by_navn]) VALUES ('2740','Skovlunde')
INSERT INTO post_nr_by ([post_nr], [by_navn]) VALUES ('2750','Ballerup')
INSERT INTO post_nr_by ([post_nr], [by_navn]) VALUES ('2770','Kastrup')
INSERT INTO post_nr_by ([post_nr], [by_navn]) VALUES ('2830','Virum')
INSERT INTO post_nr_by ([post_nr], [by_navn]) VALUES ('3650','Ølstykke')

-- data instert til klasse tabel
INSERT INTO klasse (klasse_id, klasse)
VALUES
    (1, 'A210'),
    (2, 'E224'),
    (3, 'D307');

-- data instert til elev tabel
INSERT INTO elev (elev_id, fornavn, efternavn, adresse, post_nr, klasse_id)
VALUES 
    (1, 'Bo', 'Andersen', 'Gammel Byvej 12', 2650, 1),
    (2, 'Frederikke', 'Hansen', 'Amager Boulevard 5', 2300, 1),
    (3, 'Jens', 'Mikkelsen', 'Lily Brogbergs Vej 17', 2500, 1),
    (4, 'Philip', 'Mortensen', 'Brunevang 90', 2610, 1),
    (5, 'Kasper', 'Frederiksen', 'Bryggertorvet 32', 3650, 1),
    (6, 'Milla', 'Jørgensen', 'Virum Torv 25', 2830, 1),
    (7, 'Fie', 'Kudsen', 'Allen 85', 2770, 1),
    (8, 'Henrik', 'Madsen', 'Lily Brobergs Vej 53', 2500, 1);

-- data instert til laerer tabel
INSERT INTO laerer (laerer_id, fornavn, efternavn, adresse, post_nr, klasse_id)
VALUES 
    (1, 'Tom', 'It', 'Sankt Thomas Alle 3', 1824, 1),
    (2, 'Lars', 'Henriksen', 'Nissedalen 76', 2740, 1),
    (3, 'Mia', 'Hansen', 'Østervej 16', 2750 , 1);