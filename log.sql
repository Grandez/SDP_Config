-- -------------------------------------------------------------------
-- Proyecto Fin de Carrera
--
-- Mensajes de logging y alertas
--
-- Autor: Javier Gonzalez
--
-- -------------------------------------------------------------------

USE SDP;

DELETE FROM LOG_MSG;

INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (    1, 'XX', 'Creado nuevo modulo: %s');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (    2, 'XX', 'Modulo %s recompilado');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (    3, 'XX', 'Creada nueva version del modulo %s');

INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 1001, 'XX', 'El tiempo de ejecucion se ha desviado un %s%% de su media');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 1002, 'XX', 'Se ha consumido un %s%% del tiempo de CPU');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 1003, 'XX', 'Se ha consumido un %s%% del tiempo en modo Suspend');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 1004, 'XX', 'El modulo se ha desviado un %s%% de su media');

INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 1011, 'XX', 'Se ha procesado un %s%% de registros menos que la media actual');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 1012, 'XX', 'Se ha procesado un %s%% de registros mas que la media actual');

INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 1013, 'XX', 'Se han generado un %s%% de registros menos que la media actual');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 1014, 'XX', 'Se han generado un %s%% de registros mas que la media actual');

INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 2001, 'XX', 'Usuario %s dado de alta como usuario');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 2002, 'XX', 'Usuario %s dado de alta como administrador');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 2003, 'XX', 'Usuario %s modificado');

INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES ( 2101, 'XX', '%s modificado de %s a %s');

INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10001, 'XX', 'Codigo de usuario invalido');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10002, 'XX', 'Se require un nombre de usuario');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10003, 'XX', 'Se requiere al menos un apellido');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10004, 'XX', 'Se requiere una direcion de correo electronico');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10005, 'XX', 'Direccion de correo electronico incorrecta');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10006, 'XX', 'Rol incorrecto');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10007, 'XX', 'Ya existe ese usuario');

INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10100, 'XX', 'Ejecuciones');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10101, 'XX', 'Ultima ejecucion');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10102, 'XX', 'Media tiempo');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10103, 'XX', '% CPU');
INSERT INTO LOG_MSG (idMsg, lang, msg) VALUES (10104, 'XX', '% Suspend');

COMMIT;