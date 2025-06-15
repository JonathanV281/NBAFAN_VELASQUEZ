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