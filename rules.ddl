USE SDP;

SET FOREIGN_KEY_CHECKS=0;

-- -------------------------------------------------------------------
-- Tabla de reglas e issues
-- Contiene el teto descriptivo del tipo de mensaje
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS RUL_ITEMS ;
DROP TABLE IF EXISTS RUL_GROUPS ;

CREATE TABLE RUL_GROUPS (
    idGroup      INTEGER          NOT NULL  -- Agrupacion de reglas
   ,idParent     INTEGER          NOT NULL  -- Padre del grupo (0 = raiz)
   ,activo       INTEGER          NOT NULL  -- Grupo ativo o inactivo (0/1)
   ,idDesc       BIGINT UNSIGNED  NOT NULL  -- Id de la descripcion
   ,prefix       VARCHAR(5)       NOT NULL  -- Prefijo de los mensajes
);
ALTER TABLE RUL_GROUPS ADD PRIMARY KEY ( idGroup );

CREATE TABLE RUL_ITEMS (
    idGroup      INTEGER          NOT NULL  -- Agrupacion de reglas
   ,idItem       INTEGER          NOT NULL  -- Identificador del item
   ,idDesc       BIGINT UNSIGNED  NOT NULL  -- Id de la descripcion   
   ,activo       INTEGER          NOT NULL  -- 0 - No 1 - Activo
   ,clave        VARCHAR(64)                -- Clave texto
   ,uid          VARCHAR(32)      NOT NULL  -- Usuario que activa/desactiva
   ,tms          TIMESTAMP        NOT NULL  -- Fecha de modificacion
);
ALTER TABLE RUL_ITEMS ADD PRIMARY KEY ( idGroup , idItem );
ALTER TABLE RUL_ITEMS ADD FOREIGN KEY ( idGroup ) 
                             REFERENCES RUL_GROUPS ( idGroup )
                             ON DELETE CASCADE ;





DROP TABLE IF EXISTS RUL_RULES ;
CREATE TABLE RUL_RULES (
    idGroup      INTEGER          NOT NULL  -- Agrupacion de reglas
   ,idItem       INTEGER          NOT NULL  -- Agrupacion de reglas
   ,idRule       INTEGER          NOT NULL  -- Identificador del Issue
   ,idDesc       BIGINT UNSIGNED  NOT NULL  -- Etiqueta y mensaje
   ,activo       INTEGER          NOT NULL  -- 0 - No 1 - Activo
   ,priority     INTEGER          NOT NULL  -- Nivel de prioridad
   ,severity     INTEGER          NOT NULL  -- Nivel de severidad
   ,tipo         INTEGER          NOT NULL  -- Tipo del valor
   ,propiedad    VARCHAR(64)                -- Propiedad que se invoca
   ,comparador   INTEGER          NOT NULL  -- Codigo de operacion
   ,valor        VARCHAR(64)      
   ,idSample     BIGINT UNSIGNED            -- Apuntador al ejemplo
   ,uid          VARCHAR(32)      NOT NULL  -- Usuario que activa/desactiva
   ,tms          TIMESTAMP        NOT NULL  -- Fecha de modificacion
);

ALTER TABLE RUL_RULES ADD PRIMARY KEY ( idGroup, idItem , idRule );

DROP TABLE IF EXISTS RUL_DESC ;
CREATE TABLE RUL_DESC (
    idDesc       BIGINT UNSIGNED  NOT NULL  -- Identificador
   ,idLang       CHAR(2)          NOT NULL  -- Codigo del idioma
   ,idDialect    CHAR(2)          NOT NULL  -- Codigo del dialecto
   ,label        VARCHAR(60)      NOT NULL  -- Etiqueta
   ,msg          VARCHAR(255)     NOT NULL  -- Texto

);

ALTER TABLE RUL_DESC ADD PRIMARY KEY ( idDesc, idLang, idDialect );

DROP TABLE IF EXISTS RUL_SAMPLE ;
CREATE TABLE RUL_SAMPLE (
    idSample     BIGINT UNSIGNED NOT NULL  -- Apuntador al ejemplo
   ,datBad       MEDIUMBLOB      NOT NULL  -- Datos de la excepcion
   ,datGood      MEDIUMBLOB      NOT NULL  -- Datos de la excepcion
);

ALTER TABLE RUL_SAMPLE ADD PRIMARY KEY ( idSample );


DROP   TABLE IF EXISTS MOD_ISSUES ;
CREATE TABLE MOD_ISSUES (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,idSeq        INTEGER         NOT NULL  -- Numero de secuencia 
   ,idGroup      INTEGER         NOT NULL  -- Grupo
   ,idItem       INTEGER         NOT NULL  -- Item
   ,idRule       INTEGER         NOT NULL  -- Regla   
   ,severity     INTEGER         NOT NULL  -- Nivel de severidad
   ,begLine      INTEGER         NOT NULL  -- Inicio de linea
   ,begColumn    INTEGER         NOT NULL  -- Inicio de columna
   ,endLine      INTEGER         NOT NULL  -- Fin de linea
   ,endColumn    INTEGER         NOT NULL  -- Fin de columna
   ,idException  BIGINT UNSIGNED NOT NULL  -- Id de la excepcion
   ,bloque       VARCHAR(64)     NOT NULL  -- Bloque donde se ha identificado / Parrafo
   ,firma        VARCHAR(64)     NOT NULL  -- firma digital   
);

ALTER TABLE MOD_ISSUES ADD PRIMARY KEY ( idVersion , idSeq);
ALTER TABLE MOD_ISSUES ADD FOREIGN KEY ( idVersion ) 
                           REFERENCES MOD_VERSIONES ( idVersion )
                           ON DELETE CASCADE ;

DROP   TABLE IF EXISTS MOD_ISSUES_EXCEP ;
CREATE TABLE MOD_ISSUES_EXCEP (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,idException  BIGINT UNSIGNED NOT NULL  -- Id de la excepcion
   ,idData       BIGINT UNSIGNED NOT NULL  -- Id de la descripcion de la excepcion
   ,uid          VARCHAR(32)      NOT NULL  -- uid que crea o actualiza   
   ,tms          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
);

ALTER TABLE MOD_ISSUES_EXCEP ADD PRIMARY KEY ( idVersion , idException);
ALTER TABLE MOD_ISSUES_EXCEP ADD FOREIGN KEY ( idVersion ) 
                                 REFERENCES MOD_VERSIONES ( idVersion )
                                 ON DELETE CASCADE ;

DROP   TABLE IF EXISTS MOD_ISSUES_EXCEP_DESC ;
CREATE TABLE MOD_ISSUES_EXCEP_DESC (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,idException  BIGINT UNSIGNED NOT NULL  -- Id de la excepcion
   ,idData       BIGINT UNSIGNED NOT NULL  -- Id de la descripcion de la excepcion
   ,data         MEDIUMBLOB      NOT NULL  -- Datos de la excepcion
);

SET FOREIGN_KEY_CHECKS=1;

COMMIT;	