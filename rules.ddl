USE SDP;

SET FOREIGN_KEY_CHECKS=0;

-- -------------------------------------------------------------------
-- Tabla de reglas e issues
-- Contiene el teto descriptivo del tipo de mensaje
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS RUL_ITEMS ;
DROP TABLE IF EXISTS RUL_GROUPS ;

CREATE TABLE RUL_GROUPS (
    idGroup      BIGINT UNSIGNED  NOT NULL  -- Agrupacion de reglas
   ,idParent     BIGINT UNSIGNED  NOT NULL  -- Padre del grupo (0 = raiz)
   ,idDesc       BIGINT UNSIGNED  NOT NULL  -- Id de la descripcion
   ,idTitle      BIGINT UNSIGNED            -- Id del titulo
   ,idMsg        BIGINT UNSIGNED            -- Puntero al mensaje de la condicion   
   ,idSample     BIGINT UNSIGNED            -- Apuntador al ejemplo      
   ,name         VARCHAR(64)      NOT NULL  -- Nombre corto
   ,active       BIGINT           NOT NULL  -- 0 - Si / -1 - No / -2 No por herencia / > 0 Condicion   
   ,prefix       VARCHAR(3)       NOT NULL  -- Prefijo de los mensajes
   ,uid          VARCHAR(32)      NOT NULL  -- Usuario que activa/desactiva
   ,tms          TIMESTAMP        NOT NULL  -- Fecha de modificacion   
);
ALTER TABLE RUL_GROUPS ADD PRIMARY KEY ( idGroup );
ALTER TABLE RUL_GROUPS ADD         KEY ( name    );

CREATE TABLE RUL_ITEMS (
    idGroup      BIGINT UNSIGNED  NOT NULL  -- Agrupacion de reglas
   ,idItem       BIGINT UNSIGNED  NOT NULL  -- Identificador del item
   ,idDesc       BIGINT UNSIGNED  NOT NULL  -- Id de la descripcion
   ,idTitle      BIGINT UNSIGNED            -- Id del titulo   
   ,idMsg        BIGINT UNSIGNED            -- Puntero al mensaje de la condicion   
   ,idSample     BIGINT UNSIGNED            -- Apuntador al ejemplo   
   ,name         VARCHAR(64)      NOT NULL  -- Id del titulo   
   ,active       BIGINT           NOT NULL  -- 0 - Si / -1 - No / -2 No por herencia / > 0 Condicion   
   ,prefix       VARCHAR(3)                 -- Prefijo de los mensajes
   ,object       VARCHAR(64)                -- Clave texto / objeto (Name en XSD)
   ,type         INTEGER                    -- subtipo
   ,uid          VARCHAR(32)      NOT NULL  -- Usuario que activa/desactiva
   ,tms          TIMESTAMP        NOT NULL  -- Fecha de modificacion
);
ALTER TABLE RUL_ITEMS ADD PRIMARY KEY ( idGroup , idItem );
ALTER TABLE RUL_ITEMS ADD FOREIGN KEY ( idGroup ) 
                             REFERENCES RUL_GROUPS ( idGroup )
                             ON DELETE CASCADE ;
ALTER TABLE RUL_ITEMS ADD         KEY ( name  );

DROP TABLE IF EXISTS RUL_RULES ;
CREATE TABLE RUL_RULES (
    idGroup      BIGINT UNSIGNED  NOT NULL  -- Agrupacion de reglas
   ,idItem       BIGINT UNSIGNED  NOT NULL  -- Agrupacion de reglas
   ,idRule       BIGINT UNSIGNED  NOT NULL  -- Identificador del Issue
   ,name         VARCHAR(64)                -- Util para debug
   ,idCond       BIGINT UNSIGNED  NOT NULL  -- Puntero a la condicion
   ,idDesc       BIGINT UNSIGNED  NOT NULL  -- Etiqueta y mensaje
   ,idTitle      BIGINT UNSIGNED            -- Id del titulo   
   ,idMsg        BIGINT UNSIGNED            -- Puntero al mensaje de la condicion   
   ,idSample     BIGINT UNSIGNED            -- Apuntador al ejemplo   
   ,active       BIGINT           NOT NULL  -- 0 - Si / -1 - No / -2 No por herencia / > 0 Condicion   
   ,prefix       VARCHAR(3)                 -- Prefijo de los mensajes
   ,priority     INTEGER          NOT NULL  -- Nivel de prioridad
   ,severity     INTEGER          NOT NULL  -- Nivel de severidad
   ,uid          VARCHAR(32)      NOT NULL  -- Usuario que activa/desactiva
   ,tms          TIMESTAMP        NOT NULL  -- Fecha de modificacion
);

ALTER TABLE RUL_RULES ADD PRIMARY KEY ( idGroup, idItem , idRule );

DROP TABLE IF EXISTS RUL_CONDS ;
CREATE TABLE RUL_CONDS (
    idCond       BIGINT UNSIGNED  NOT NULL  -- Agrupacion de reglas
   ,idSeq        INTEGER          NOT NULL  -- Secuencia de condiciones con AND
   ,idMsg        BIGINT UNSIGNED  NOT NULL  -- Puntero al mensaje de la condicion
   ,lvalueType   INTEGER          NOT NULL  -- Tipo del rvalue
   ,lvalue       VARCHAR(64)                -- Puntero a tabla formulas o metodo a invocar
   ,operator     INTEGER                    -- Codigo de operacion
   ,rvalueType   INTEGER                    -- Tipo del rvalue
   ,rvalue       VARCHAR(64)                -- Puntero a tabla formulas o metodo a invocar
   ,uid          VARCHAR(32)      NOT NULL  -- Usuario que activa/desactiva
   ,tms          TIMESTAMP        NOT NULL  -- Fecha de modificacion
);

ALTER TABLE RUL_CONDS ADD PRIMARY KEY ( idCond, idSeq );

-- Descripciones 
DROP TABLE IF EXISTS RUL_DESCS ;
CREATE TABLE RUL_DESCS (
    idDesc       BIGINT UNSIGNED  NOT NULL  -- Identificador
   ,idLang       CHAR(2)          NOT NULL  -- Codigo del idioma
   ,idDialect    CHAR(2)          NOT NULL  -- Codigo del dialecto
   ,idType       INTEGER          NOT NULL  -- 0 - Titulo / 1 - Descripcion  / 2 - Sample
   ,idSeq        INTEGER          NOT NULL  -- Descripciones de mas de 255 chars
   ,txt          VARCHAR(255)     NOT NULL  -- Texto
);

ALTER TABLE RUL_DESCS ADD PRIMARY KEY ( idDesc, idType, idSeq, idLang, idDialect );

-- Mensajes a mostrar (Solo deben ocupar una linea)
DROP TABLE IF EXISTS RUL_MSGS ;
CREATE TABLE RUL_MSGS (
    idMsg        BIGINT UNSIGNED  NOT NULL  -- Identificador
   ,idLang       CHAR(2)          NOT NULL  -- Codigo del idioma
   ,idDialect    CHAR(2)          NOT NULL  -- Codigo del dialecto
   ,txt          VARCHAR(255)     NOT NULL  -- Texto
);

ALTER TABLE RUL_MSGS ADD PRIMARY KEY ( idMsg, idLang, idDialect );

DROP TABLE IF EXISTS RUL_SAMPLES ;
CREATE TABLE RUL_SAMPLES (
    idSample     BIGINT UNSIGNED NOT NULL  -- Apuntador al ejemplo
   ,type         INTEGER         NOT NULL  -- Tipo de ejemplo (0 - COMENTARIOS / 1 - OK / -1 - BAD)
   ,line         INTEGER         NOT NULL  -- Numero de linea
   ,data         VARCHAR(255)    NOT NULL  -- Texto
);

ALTER TABLE RUL_SAMPLES ADD PRIMARY KEY ( idSample, type, line );

-- -------------------------------------------------------------------
-- Tabla de formulas
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS RUL_SCRIPTS ;
CREATE TABLE RUL_SCRIPTS (
    idScript     BIGINT UNSIGNED  NOT NULL  -- Identificador de la formula
   ,idType       INTEGER          NOT NULL  -- 0 - Funcion / 1 - Formula
   ,idSeq        INTEGER          NOT NULL  -- Secuencia, cada una es un OR (0: Titulo)
   ,code         VARCHAR(512)     NOT NULL  -- Formula en textto
);

ALTER TABLE RUL_SCRIPTS ADD PRIMARY KEY ( idScript , idType, idSeq );


DROP   TABLE IF EXISTS MOD_ISSUES ;
CREATE TABLE MOD_ISSUES (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,idSeq        INTEGER         NOT NULL  -- Numero de secuencia 
   ,idGroup      INTEGER         NOT NULL  -- Grupo
   ,idItem       INTEGER         NOT NULL  -- Item
   ,prefix       CHAR(3)         NOT NULL  -- Prefix
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