-- El obejtivo de esta funcion es poder visualizar de manera dinamica el nombre del equipo en base al numero de id
DROP FUNCTION IF EXISTS fn_team ;
DELIMITER &&
CREATE FUNCTION fn_team(p_team VARCHAR(15))
RETURNS VARCHAR(15)
DETERMINISTIC 
BEGIN  
DECLARE v_team VARCHAR(15);

SELECT name_team INTO v_team
FROM equipo
WHERE id_team = p_team	;

RETURN v_team;
END&&
DELIMITER ; 

SELECT fn_team('2'); 

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