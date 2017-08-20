USE SDP;

-- -------------------------------------------------------------------
-- Tabla de reglas e issues
-- Contiene el teto descriptivo del tipo de mensaje
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS RUL_GROUPS ;
CREATE TABLE RUL_GROUPS (
    idGroup      INTEGER          NOT NULL  -- Agrupacion de reglas
   ,idParent     INTEGER          NOT NULL  -- Padre del grupo (0 = raiz)
   ,active       INTEGER          NOT NULL  -- Grupo ativo o inactivo (0/1)
   ,idDesc       INTEGER          NOT NULL  -- Id de la descripcion
   ,prefix       VARCHAR(5)       NOT NULL  -- Prefijo de los mensajes
);
ALTER TABLE RUL_GROUPS ADD PRIMARY KEY ( idGroup );

COMMIT;