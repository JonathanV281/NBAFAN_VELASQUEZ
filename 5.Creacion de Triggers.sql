-- Trigger para controlar si se modifica alguna estadistica de cualquier jugador
DELIMITER //
CREATE TRIGGER trg_control_datos AFTER INSERT ON estadistica
FOR EACH ROW
BEGIN 

INSERT INTO control_tablas(id_control, tipo_accion, nombre_tabla, user_modif, fecha_modif)
VALUES ('insert', 'estadistica', CURRENT_USER(), NOW());

END//
DELIMITER ;