DROP PROCEDURE IF EXISTS sp_conferencia;
DELIMITER &&
CREATE PROCEDURE sp_conferencia(IN p_name_team VARCHAR(20),
                                 OUT p_id_team INT,
								 OUT p_conference VARCHAR(15))
BEGIN

SELECT 
id_team,
conference
INTO 
p_id_team,
p_conference
FROM equipo
WHERE name_team = p_name_team;

END&&
DELIMITER ;

CALL sp_conferencia('Chicago Bulls', @p_id_team, @p_conference) ; 


								
DROP PROCEDURE IF EXISTS sp_champ;
DELIMITER &&
CREATE PROCEDURE sp_champ(INOUT p_year_champ INT,
					      OUT p_equipo_name_team VARCHAR(50))
                          
			                                
BEGIN

SELECT 
equipo.name_team
campeonato_year_champ
INTO
p_year_champ,
p_equipo_name_team

FROM campeonato INNER JOIN equipo ON campeonato.winner_id = equipo.id_team
WHERE year_champ = p_year_champ ;

END&&
DELIMITER ;
 
SET @p_year_champ = 2025;

CALL sp_champ(@p_year_champ, @p_equipo_name_team); 


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