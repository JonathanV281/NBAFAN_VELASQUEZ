/* COMENTARIOS */

DROP SCHEMA IF EXISTS Nba_fan;
CREATE SCHEMA IF NOT EXISTS Nba_fan;
USE Nba_fan;

CREATE TABLE equipo (  -- refiera informacion de cada equipo participante
id_team INT AUTO_INCREMENT , -- es el codigo unico numérico para identificar a cada equipo
name_team VARCHAR(20) NOT NULL, -- es el nombre (texto) del equipo
conference VARCHAR(15) NOT NULL, -- es la conferencia (texto) que distingue a la zona de cada equipo
PRIMARY KEY (id_team) -- es el dato irrepetible en cada equipo
);

CREATE TABLE jugador ( -- muestra los datos relativos a los jugadores que conforman cada equipo
id_player INT NOT NULL,  -- es el DNI del jugador (numero)
name_player VARCHAR(20) NOT NULL, -- nombre del jugador (texto)
last_name VARCHAR(20) NOT NULL, -- apellido del jugador (texto)
id_team INT NOT NULL, -- es el equipo del que forma parte el jugador (numero)
position VARCHAR(10) NOT NULL, -- es la posicion que desempeña el jugador (texto)
PRIMARY KEY (id_player), -- el DNI no se repite 
FOREIGN KEY (id_team) REFERENCES equipo (id_team) -- asocia el contrato con cada equipo
);

CREATE TABLE campeonato ( -- SON LOS CAMPEONATOS DISPUTADOS EN LA NBA Y SUS RESULTADOS
year_champ INT NOT NULL, -- AÑO EN EL QUE SE REALIZA EL CAMPEONATO, SOLAMENTE EL AÑO (NUMERO), NO ES FECHA
winner_id INT NOT NULL, -- EQUIPO GANADOR DEL CAMPEONATO (NUMERO)
game INT NOT NULL, -- CANTIDAD DE PARTIDOS DEL CAMPEONATO (NUMERO)
ticket INT NOT NULL, -- CANTIDAD DE TICKETS VENDIDOS EN EL CAMPEONATO (NUMERO)
PRIMARY KEY (year_champ), 
FOREIGN KEY (winner_id) REFERENCES equipo (id_team) -- ASOCIA AL EQUIPO GANADOR DE CADA CAMPEONATO
);

CREATE TABLE estadistica ( -- MUESTRA ESTADISTICAS PARA CADA JUGADOR
id_player INT NOT NULL, -- ES EL NUMERO DE DNI DEL JUGADOR (NUMERO)
point_player INT NOT NULL, -- ES EL PROMEDIO DE PUNTOS DEL JUGADOR EN LOS CAMPEONATOS (NUMERO)
reboun INT NOT NULL, -- ES EL PROMEDIO DE REBOTES DEL JUGADOR EN LOS CAMPEONATOS (NUMERO)
assist INT NOT NULL, -- ES EL PROMEDIO DE ASISTENCIAS DEL JUGADOR EN LOS CAMPEONATOS (NUMERO)
PRIMARY KEY (id_player), -- NO SE REPITE NUMERO DE DNI
FOREIGN KEY (id_player) REFERENCES jugador (id_player) -- ASOCIA LA ESTADISTICA A CADA JUGADOR
);

CREATE TABLE sponsor ( -- SON LOS SPONSORS INVOLUCRADOS EN LA NBA
cuit_sponsor INT NOT NULL, -- NUMERO DE CUIT DE LA EMPRESA (NUMERO)
name_sponsor VARCHAR(25) NOT NULL, -- RAZON SOCIAL DE LA EMPRESA (TEXTO)
id_team INT NOT NULL, -- EQUIPO SPONSOREADO (NUMERO)
investment INT NOT NULL, -- INVERSION REALIZADA EN EL EQUIPO (NUMERO)
PRIMARY KEY (cuit_sponsor), -- IDENTIFICACION UNICA DE UNA EMPRESA
FOREIGN KEY (id_team) REFERENCES equipo (id_team) -- ASOCIA A QUE EQUIPO ESTA SPONSOREANDO
);

CREATE TABLE producto ( -- SON LOS PRODUCTOS QUE OFRECE EL SPONSOR A CADA EQUIPO
id_product INT NOT NULL,  -- NUMERO DE PRODUCTO 
detail VARCHAR(30) NOT NULL, -- DESCRIPCION DEL PRODCUTO (TEXTO)
size VARCHAR(3) NOT NULL, -- TALLE DEL PRODUCTO (NUMERO)
stock INT NOT NULL, -- CANTIDAD DISPONIBLE (NUMERO)
id_sponsor INT NOT NULL, -- DUEÑO DEL PRODUCTO (NUMERO)
PRIMARY KEY (id_product),
FOREIGN KEY (id_sponsor) REFERENCES sponsor (cuit_sponsor) -- ASOCIA LOS PRODUCTOS A CADA SPONSOR
);

INSERT INTO equipo (name_team, conference) VALUES ( 'Boston Celtics', 'Eastern');
INSERT INTO equipo (name_team, conference) VALUES ('New York Knicks', 'Eastern');
INSERT INTO equipo (name_team, conference) VALUES ( 'Chicago Bulls', 'Eastern');
INSERT INTO equipo (name_team, conference) VALUES ( 'Los Angeles Lakers', 'Western');
INSERT INTO equipo (name_team, conference) VALUES ( 'San Antonio Spurs', 'Western');
INSERT INTO equipo (name_team, conference) VALUES ( 'Houston Rockets', 'Western');

INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (1, 'Baylor', 'Scheierman','1','SG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (2, 'Sam', 'Hauser','1','SF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (3, 'Payton', 'Pritchard','1','PG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (4, 'Torrey', 'Craig','1','PF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (5, 'Luke', 'Kornet','1','C');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (6, 'Miles', 'McBride','2','SG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (7, 'Mikal', 'Bridges','2','SF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (8, 'Cameron', 'Payne','2','PG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (9, 'P.J', 'Tucker','2','PF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (10, 'Precious', 'Achiuwa','2','C');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (11, 'Coby', 'White','3','SG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (12, 'Matas', 'Buzelis','3','SF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (13, 'Kevin', 'Huerter','3','PG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (14, 'Julian', 'Phillips','3','PF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (15, 'Nikola', 'Vucevic','3','C');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (16, 'Shake', 'Milton','4','SG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (17, 'Dalton', 'Knetch','4','SF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (18, 'Bronny', 'James','4','PG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (19, 'Markierff', 'Morris','4','PF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (20, 'Alex', 'Len','4','C');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (21, 'Stephon', 'Castle','5','SG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (22, 'Julian', 'Champagnie','5','SF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (23, 'Chris', 'Paul','5','PG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (24, 'Harrison', 'Barnes','5','PF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (25, 'Bismack', 'Biyombo','5','C');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (26, 'Jalen', 'Green','6','SG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (27, 'Dillon', 'Brooks','6','SF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (28, 'Fred', 'VanVleet','6','PG');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (29, 'Amen', 'Thompson','6','PF');
INSERT INTO jugador (id_player, name_player, last_name, id_team, position) VALUES (30, 'Alperen', 'Sengun','6','C');

INSERT INTO campeonato (year_champ, winner_id, game, ticket) VALUES (2015, 1 , 50, 450000);
INSERT INTO campeonato (year_champ, winner_id, game, ticket) VALUES (2016, 5 , 47, 600000);
INSERT INTO campeonato (year_champ, winner_id, game, ticket) VALUES (2017, 3 , 45, 400000);
INSERT INTO campeonato (year_champ, winner_id, game, ticket) VALUES (2018, 3 , 50, 370500);
INSERT INTO campeonato (year_champ, winner_id, game, ticket) VALUES (2019, 4 , 49, 370500);
INSERT INTO campeonato (year_champ, winner_id, game, ticket) VALUES (2020, 3 , 48, 0);
INSERT INTO campeonato (year_champ, winner_id, game, ticket) VALUES (2021, 2 , 45, 15000);
INSERT INTO campeonato (year_champ, winner_id, game, ticket) VALUES (2022, 2, 47, 28000);
INSERT INTO campeonato (year_champ, winner_id, game, ticket) VALUES (2023, 1 , 50, 100000);
INSERT INTO campeonato (year_champ, winner_id, game, ticket) VALUES (2024, 5 , 49, 230000);
INSERT INTO campeonato (year_champ, winner_id, game, ticket) VALUES (2025, 1 , 48, 477000);

INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (1, 500 , 50, 20);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (2, 799 , 30, 10);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (3, 450 , 27, 15);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (4, 350 , 50, 40);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (5, 890 , 68, 26);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (6, 150 , 3, 6);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (7, 290 , 60, 47);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (8, 695 , 32, 20);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (9, 788 , 21, 15);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (10, 400 , 10, 5);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (11, 546 , 20, 30);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (12, 650 , 45, 23);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (13, 230 , 23, 10);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (14, 366 , 20, 17);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (15, 197 , 2, 1);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (16, 555 , 57, 20);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (17, 150 , 23, 9);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (18, 190 , 84, 26);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (19, 180 , 43, 24);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (20, 132 , 10, 7);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (21, 103 , 5, 3);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (22, 355 , 40, 21);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (23, 888 , 50, 20);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (24, 132 , 65, 30);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (25, 123 , 50, 30);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (26, 455 , 56, 60);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (27, 244 , 52, 23);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (28, 136 , 67, 56);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (29, 580 , 30, 60);
INSERT INTO estadistica (id_player, point_player, reboun, assist) VALUES (30, 124 , 3, 3);

INSERT INTO sponsor (cuit_sponsor, name_sponsor, id_team, investment) VALUES (5573,'Nike', 4, 150000);
INSERT INTO sponsor (cuit_sponsor, name_sponsor, id_team, investment) VALUES (5423,'Under Armour', 3, 2500000);
INSERT INTO sponsor (cuit_sponsor, name_sponsor, id_team, investment) VALUES (5303,'Adidas', 2, 2000000);
INSERT INTO sponsor (cuit_sponsor, name_sponsor, id_team, investment) VALUES (5305,'And One', 5, 1000000);
INSERT INTO sponsor (cuit_sponsor, name_sponsor, id_team, investment) VALUES (5756,'Nike', 1, 150000);
INSERT INTO sponsor (cuit_sponsor, name_sponsor, id_team, investment) VALUES (5963,'Under Armour', 6, 150000);


-- Vista utilizada por comentaristas para identificar a los equipos participantes de la conferencia Este compuesta por la tabla EQUIPO
CREATE OR REPLACE VIEW nba_fan.vw_eastern AS (
SELECT 
id_team,
name_team
FROM equipo
WHERE conference = 'Eastern'
);


-- Vista creada para identificar rapidamente quien fue el ultimo equipo campeon compuesta por las tablas CAMPEONTATO Y EQUIPO
CREATE OR REPLACE VIEW nba_fan.vw_lastchamp AS (
SELECT 
campeonato.year_champ, equipo.name_team  
FROM campeonato INNER JOIN equipo ON campeonato.winner_id = equipo.id_team
WHERE year_champ = '2025'
);

-- Vista creada para la premiacion del mayor goleador compuesta por las tablas ESTADISTICA Y JUGADOR
CREATE OR REPLACE VIEW nba_fan.vw_shooter AS (
SELECT 
estadistica.point_player, jugador.name_player , jugador.last_name
FROM jugador INNER JOIN estadistica ON jugador.id_player = estadistica.id_player
ORDER BY 1 DESC
);



-- FUNCIONES

-- El obejtivo de esta funcion es poder visualizar de manera dinamica tanto los equipos de una conferencia como de otra sin la necesidad de repetir la consulta conformado por tabla conferencia
DROP FUNCTION IF EXISTS fn_conference ;
DELIMITER &&
CREATE FUNCTION fn_conference(p_conference VARCHAR(15))
RETURNS VARCHAR(15)
DETERMINISTIC 
BEGIN  
DECLARE v_team VARCHAR(15);

SELECT name_team INTO v_team
FROM equipo
WHERE conference = p_conference	;

RETURN v_team;
END&&
DELIMITER ; 

SELECT fn_conference(Eastern); -- CUANDO LO QUIERO INVOCAR ME ARROJA ERROR, CUAL ES EL ERROR?

-- El obejtivo de esta funcion es poder visualizar de manera dinamica el campeon para cada año sin la necesidad de repetir la consulta conformada por las tablas equipo y campeonato 
DROP FUNCTION IF EXISTS fn_year_champ ;
DELIMITER &&
CREATE FUNCTION fn_year_champ(p_year_champ INT) 
RETURNS VARCHAR(20)
DETERMINISTIC 
BEGIN  
DECLARE v_champ VARCHAR(20);

SELECT 
equipo.name_team INTO v_champ
FROM campeonato INNER JOIN equipo ON campeonato.winner_id = equipo.id_team
WHERE year_champ = p_year_champ ;

RETURN v_champ;
END&&
DELIMITER ; 

SELECT fn_year_champ(2015);

-- PROCEDIMIENTOS

DROP PROCEDURE IF EXISTS sp_conferencia;
DELIMITER &&
CREATE PROCEDURE sp_conferencia(IN p_conference VARCHAR(15),
                                 OUT p_id_team INT,
                                 OUT p_name_team VARCHAR(20))
BEGIN

SELECT 
id_team,
name_team
INTO 
p_conference,
p_id_team,
p_name_team
FROM equipo
WHERE conference = p_conference;

END&&
DELIMITER ;

CALL sp_conferencia('Eastern', @p_id_team, @p_name_team) ; -- CUANDO LO QUIERO INVOCAR ME ARROJA ERROR, CUAL ES EL ERROR?


								
DROP PROCEDURE IF EXISTS sp_champ;
DELIMITER &&
CREATE PROCEDURE sp_champ(INOUT p_champ_year INT,
					      OUT p_equipo_name_team VARCHAR(50))
                          
			                                
BEGIN

SELECT 
equipo.name_team
campeonato_year_champ
INTO
p_champ_year,
p_equipo_name_team

FROM campeonato INNER JOIN equipo ON campeonato.winner_id = equipo.id_team
WHERE year_champ = p_year_champ ;

END&&
DELIMITER ;
 
SET @p_champ_year = 2025;

CALL sp_champ(@p_champ_year, @p_equipo_name_team); 


DROP TABLE IF EXISTS control_tablas;
CREATE TABLE IF NOT EXISTS control_tablas
(
id_control INT AUTO_INCREMENT,
tipo_accion VARCHAR(10),
nombre_tabla VARCHAR(30),
user_modif VARCHAR(50),
fecha_modif DATE,
PRIMARY KEY (id_control)
);


-- Trigger para controlar si se modifica alguna estadistica de cualquier jugador
DELIMITER //
CREATE TRIGGER trg_control_datos AFTER INSERT ON estadistica
FOR EACH ROW
BEGIN 

INSERT INTO control_tablas(id_control, tipo_accion, nombre_tabla, user_modif, fecha_modif)
VALUES ('insert', 'estadistica', CURRENT_USER(), NOW());

END//
DELIMITER ;

SELECT 












