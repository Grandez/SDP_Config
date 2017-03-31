-- -------------------------------------------------------------------
-- SERENDIPITY
--
-- Definicion de tablas para MySQL
-- Autor: Javier Gonzalez
--
-- -------------------------------------------------------------------

DROP DATABASE SDP;

CREATE DATABASE IF NOT EXISTS SDP;

USE SDP;

SET FOREIGN_KEY_CHECKS = 0 ;

DROP   TABLE IF EXISTS SDP_APLICACIONES CASCADE  ;
CREATE TABLE SDP_APLICACIONES (
    aplicacion   VARCHAR          (32)  NOT NULL
   ,idAppl       BIGINT UNSIGNED        NOT NULL 
   ,descripcion  VARCHAR         (512)  NOT NULL 
   ,padre        BIGINT UNSIGNED        NOT NULL
   ,volumen      INTEGER                NOT NULL
   ,uid          VARCHAR          (32)  NOT NULL
   ,tms          TIMESTAMP              NOT NULL
);

ALTER TABLE SDP_APLICACIONES ADD PRIMARY KEY ( aplicacion );
ALTER TABLE SDP_APLICACIONES ADD UNIQUE INDEX ( idAppl );

-- ----------------------------------------------------------
-- Lista de mascaras para asociar modulos a aplicaciones
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS SDP_REL_APP_MOD CASCADE ;
CREATE TABLE SDP_REL_APP_MOD (
    idAppl       BIGINT UNSIGNED       NOT NULL  -- Aplicacion
   ,mask         VARCHAR          (12) NOT NULL  -- Mascara  
   ,fijo         INTEGER               NOT NULL  -- Numero de car. fijos (-1 todos)
   ,peso         INTEGER               NOT NULL  -- Peso por wildcars (* = 1000)
   ,uid          VARCHAR          (32) NOT NULL  -- uid     que ha generado la regla
);

ALTER TABLE SDP_REL_APP_MOD ADD PRIMARY KEY ( idAppl , mask );

-- ----------------------------------------------------------
-- Un archivo puede tener varios modulos
-- Asumimos que son de la misma aplicacion
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS SDP_FILES CASCADE ;
CREATE TABLE SDP_FILES (
    idFile       BIGINT UNSIGNED NOT NULL  -- Id del archivo
   ,archivo      VARCHAR(32)     NOT NULL  -- Nombre del archivo
   ,firma        VARCHAR(64)     NOT NULL  -- firma digital del archivo   
   ,numModulos   INTEGER         NOT NULL  -- Numero de modulos
   ,uid          VARCHAR(32)     NOT NULL
   ,tms          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
);

ALTER TABLE SDP_FILES   ADD PRIMARY KEY   ( idFile );

-- -------------------------------------------------------------------
-- Modulo fuente original comprimido
-- -------------------------------------------------------------------

DROP   TABLE IF EXISTS SDP_FUENTES CASCADE ;
CREATE TABLE SDP_FUENTES (
    idFile    BIGINT UNSIGNED  NOT NULL  -- Identificador de la version del modulo
   ,source    BLOB             NOT NULL  -- Fuente en formato ZIP
);

ALTER TABLE SDP_FUENTES ADD PRIMARY KEY ( idFile );
ALTER TABLE SDP_FUENTES ADD FOREIGN KEY ( idFile ) 
                           REFERENCES SDP_FILES ( idFile )
                           ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Modulo fuente original comprimido de programas 
-- que han fallado en el analisis
-- Se analizaran para ver la construcion que ha fallado
-- -------------------------------------------------------------------

DROP   TABLE IF EXISTS SDP_FUENTES_ERR CASCADE ;
CREATE TABLE SDP_FUENTES_ERR (
    tms       TIMESTAMP      NOT NULL  -- Timestamp de ejecución
   ,nombre    VARCHAR  (32)  NOT NULL  -- Nombre del modulo 
   ,uid       VARCHAR  (32)  NOT NULL  -- uid que lo ha compilado
   ,source    BLOB           NOT NULL  -- Fuente en formato ZIP
);

ALTER TABLE SDP_FUENTES_ERR ADD PRIMARY KEY ( tms );

-- ----------------------------------------------------------
-- Definicion basica de un modulo
-- Pertenece a una aplicacion
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS SDP_MODULOS CASCADE ;
CREATE TABLE SDP_MODULOS (
    idAppl       BIGINT UNSIGNED NOT NULL  -- Id de la aplicacion
   ,idModulo     BIGINT UNSIGNED NOT NULL  -- Id unico del modulo
   ,idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la version actual
   ,nombre       VARCHAR(32)     NOT NULL  -- Nombre del programa    
   ,tipo         INTEGER         NOT NULL  -- Tipo de modulo      
   ,estado       INTEGER         NOT NULL  -- Activo (1) o Inactivo(0)
   ,uid          VARCHAR(32)     NOT NULL
   ,tms          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
);

ALTER TABLE SDP_MODULOS ADD PRIMARY KEY   ( idAppl , idModulo );
ALTER TABLE SDP_MODULOS ADD         KEY   ( idModulo );
ALTER TABLE SDP_MODULOS ADD FOREIGN KEY(idAppl) 
                            REFERENCES SDP_APLICACIONES (idAppl )
                            ON DELETE CASCADE;

-- ----------------------------------------------------------
-- Dependencias manuales
-- Se cargan de manera manual par resolver dependencias que
-- no ee pueden inferir en el analisis estatico
-- ----------------------------------------------------------

 DROP   TABLE IF EXISTS SDP_DEPENDENCIAS ;
 CREATE TABLE SDP_DEPENDENCIAS (
     modulo       VARCHAR(64)     NOT NULL  -- Nombre del modulo llamante
    ,variable     VARCHAR(64)     NOT NULL  -- Nombre de la variable no identificada
    ,called       VARCHAR(64)               -- Modulo llamado. Si null, se eliminara
    ,uid          VARCHAR(32)     NOT NULL
    ,tms          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
 );
 
 ALTER TABLE SDP_DEPENDENCIAS ADD PRIMARY KEY ( modulo , variable, called );
 
-- -- ----------------------------------------------------------      
-- -- ----------------------------------------------------------
-- -- TABLAS DE INFORMACION DE UN MODULO
-- -- PREFIJO: MOD
-- -- ----------------------------------------------------------
-- -- ----------------------------------------------------------
-- 
-- -- ----------------------------------------------------------
-- -- Un modulo tiene varias versiones
-- -- Esta tabla contiene los atributos basicos del modulo
-- -- ----------------------------------------------------------
-- 
 DROP   TABLE IF EXISTS MOD_VERSIONES CASCADE ;
 CREATE TABLE MOD_VERSIONES (
     idVersion    BIGINT UNSIGNED  NOT NULL  -- Secuencia de la version 
    ,idModulo     BIGINT UNSIGNED  NOT NULL  -- Id del modulo
    ,idFile       BIGINT UNSIGNED  NOT NULL  -- Id del archivo
    ,linea        INTEGER          NOT NULL  -- Offset de inicio del modulo dentro del archivo
    ,nombre       VARCHAR(32)      NOT NULL  -- Nombre del modulo 
    ,tipo         INTEGER          NOT NULL  -- Tipo de modulo     
    ,estado       INTEGER          NOT NULL  --  0 - Sin info /  1 - Completo /  2 - Parcial pero sin dudas
                                             -- 11 - Ignorado / 99 - Analizado solo CICS 
    ,fichero      INTEGER          NOT NULL  -- Flag tiene ficheros
    ,sgdb         INTEGER          NOT NULL  -- Flag tiene SQL
    ,cics         INTEGER          NOT NULL  -- Flag tiene CICS
    ,mq           INTEGER          NOT NULL  -- Flag tiene MQ   
    ,calls        INTEGER          NOT NULL  -- Mascara llamadas (1: CALL 2: LINK 4: XCTL)
    ,dynam        INTEGER          NOT NULL  -- Mascara dinamico (1: Si : 2: Estatico)
    ,ts           INTEGER          NOT NULL  -- Indicador TS: 1 / Si - 0 - No
    ,tsmode       INTEGER          NOT NULL  -- Valor de ts
    ,missing      INTEGER          NOT NULL  -- Tiene copys no procesadas (1 - Missing / 2 - erroneas)
    ,descripcion  VARCHAR(512)     NOT NULL  -- Posible comentario
    ,uid          VARCHAR(32)      NOT NULL  -- uid que crea o actualiza   
    ,tms          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
 );
 
 ALTER TABLE MOD_VERSIONES ADD PRIMARY KEY ( idVersion );
 ALTER TABLE MOD_VERSIONES ADD UNIQUE  KEY ( idModulo , idVersion);
 -- ALTER TABLE MOD_VERSIONES ADD UNIQUE  KEY ( firma );
       
 ALTER TABLE MOD_VERSIONES ADD FOREIGN KEY(idModulo) 
                               REFERENCES SDP_MODULOS (idModulo )
                               ON DELETE CASCADE;
 
-- -- ----------------------------------------------------------
-- -- Datos resumidos de la version
-- -- ----------------------------------------------------------
-- 
DROP   TABLE IF EXISTS MOD_RESUMEN CASCADE ;
CREATE TABLE MOD_RESUMEN (
    idVersion     BIGINT UNSIGNED         NOT NULL  -- Identificador de la version
   ,bytes         BIGINT UNSIGNED         NOT NULL  -- Bytes del modulo
   ,lineas        INTEGER                 NOT NULL  -- Lineas del modulo
   ,parrafos      INTEGER                 NOT NULL  -- Parrafos
   ,sentencias    INTEGER                 NOT NULL  -- Sentencias
   ,blancos       INTEGER                 NOT NULL  -- Lineas en blanco
   ,comentarios   INTEGER                 NOT NULL  -- Lineas de comentarios
   ,decoradores   INTEGER                 NOT NULL  -- Comentarios decoradores
   ,verbosData    INTEGER                 NOT NULL  -- Sentencias
   ,verbosIO      INTEGER                 NOT NULL  -- Sentencias   
   ,verbosControl INTEGER                 NOT NULL  -- Sentencias   
   ,verbosFlujo   INTEGER                 NOT NULL  -- Sentencias
   ,verbosArit    INTEGER                 NOT NULL  -- Sentencias   
   ,verbosLang    INTEGER                 NOT NULL  -- Sentencias   
   ,ficheros      INTEGER                 NOT NULL  -- Persistencia      
);

ALTER TABLE MOD_RESUMEN ADD PRIMARY KEY ( idVersion );
ALTER TABLE MOD_RESUMEN ADD FOREIGN KEY ( idVersion ) 
                            REFERENCES MOD_VERSIONES ( idVersion )
                            ON DELETE CASCADE ;
      

-- -------------------------------------------------------------------
-- Divisiones y secciones
-- -------------------------------------------------------------------

DROP   TABLE IF EXISTS MOD_SECCIONES ;
CREATE TABLE MOD_SECCIONES (
    idVersion         BIGINT UNSIGNED         NOT NULL 
   ,divIdentification INTEGER                 NOT NULL
   ,divEnvironment    INTEGER                 NOT NULL
   ,divData           INTEGER                 NOT NULL
   ,divProcedure      INTEGER                 NOT NULL
   ,sectConfiguration INTEGER                 NOT NULL
   ,sectInputOutput   INTEGER                 NOT NULL
   ,sectFile          INTEGER                 NOT NULL
   ,sectWorking       INTEGER                 NOT NULL   
   ,sectLocal         INTEGER                 NOT NULL   
   ,sectLinkage       INTEGER                 NOT NULL   
   ,sectScreen        INTEGER                 NOT NULL      
);

ALTER TABLE MOD_SECCIONES ADD PRIMARY KEY ( idVersion );

ALTER TABLE MOD_SECCIONES ADD FOREIGN KEY ( idVersion ) 
                            REFERENCES MOD_VERSIONES ( idVersion )
                            ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Ficheros y tablas
-- Maestro lo puede marcar:
--    El programa
--    El administrador
--    El sistema automaticamente
--       En este caso, se elige el que mas registros haya
--       procesado por estadistica
--       Si lo ha puesto el sistema, lo cambiara si ha 
--       habido otro proceso que ha leido mas registros   
-- -------------------------------------------------------------------

DROP   TABLE IF EXISTS MOD_FICHEROS ;
CREATE TABLE MOD_FICHEROS (
    idVersion    BIGINT UNSIGNED         NOT NULL  -- Bytes del modulo
   ,idFile       INTEGER                 NOT NULL  -- Id del registro
   ,logico       VARCHAR            (64) NOT NULL  -- Nombre logico
   ,fisico       VARCHAR            (64) NOT NULL  -- Nombre fisico
   ,tipo         INTEGER                 NOT NULL  -- Tipo de fichero segun TP
   ,acceso       INTEGER                 NOT NULL  -- Tipo de acceso   
   ,maestro      INTEGER                 NOT NULL  -- Indicador de fichero maestro 
   ,leido        BIGINT UNSIGNED         NOT NULL  -- Registros leidos
);

ALTER TABLE MOD_FICHEROS ADD PRIMARY KEY ( idVersion , idFile );
ALTER TABLE MOD_FICHEROS ADD FOREIGN KEY ( idVersion ) 
                            REFERENCES MOD_VERSIONES ( idVersion )
                            ON DELETE CASCADE ;

-- ----------------------------------------------------------
-- Dependencias
-- OJO PEPE Puede ser usado como
--     CALL 'PEPE'
--     CALL PEPE
--     LINK 'PEPE' ETC        
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_DEPENDENCIAS ;
CREATE TABLE MOD_DEPENDENCIAS (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,modulo       VARCHAR(64)     NOT NULL  -- Nombre del modulo o copy
   ,tipo         INTEGER         NOT NULL  -- Tipo de dependencia (Modulo, COPY, ...)
   ,subTipo      INTEGER         NOT NULL  -- Subtipo (En funcion de tipo: COPY/INCLUDE, CALL/LINK/..)
   ,modo         INTEGER         NOT NULL  -- Modo de inclusion: COPY, INCLUDE, Estatico/dinamico
   ,refs         INTEGER         NOT NULL  -- Numero de referencias en el modulo
   ,estado       INTEGER         NOT NULL  -- Verificado o no (0/1)
);

ALTER TABLE MOD_DEPENDENCIAS ADD PRIMARY KEY ( idVersion , modulo, tipo );
ALTER TABLE MOD_DEPENDENCIAS ADD FOREIGN KEY ( idVersion ) 
                                 REFERENCES MOD_VERSIONES ( idVersion )
                                 ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Dependencias no resueltas
-- -------------------------------------------------------------------

DROP   TABLE IF EXISTS MOD_MISSING ;
CREATE TABLE MOD_MISSING (
    idVersion         BIGINT UNSIGNED         NOT NULL 
   ,modulo            VARCHAR(48)             NOT NULL
   ,motivo            INTEGER                 NOT NULL -- 0 No existe / 1 No soportado 
);

ALTER TABLE MOD_MISSING ADD PRIMARY KEY ( idVersion , modulo );

ALTER TABLE MOD_MISSING ADD FOREIGN KEY ( idVersion ) 
                            REFERENCES MOD_VERSIONES ( idVersion )
                            ON DELETE CASCADE ;


-- -------------------------------------------------------------------
-- Verbos CICS
-- -------------------------------------------------------------------

DROP   TABLE IF EXISTS MOD_CICS ;
CREATE TABLE MOD_CICS (
    idVersion         BIGINT UNSIGNED         NOT NULL 
   ,verbo             VARCHAR(48)             NOT NULL
   ,tipo              INTEGER                 NOT NULL   
   ,veces             INTEGER                 NOT NULL
);

ALTER TABLE MOD_CICS ADD PRIMARY KEY ( idVersion , verbo , tipo );

ALTER TABLE MOD_CICS ADD FOREIGN KEY ( idVersion ) 
                            REFERENCES MOD_VERSIONES ( idVersion )
                            ON DELETE CASCADE ;


-- ----------------------------------------------------------
-- Issues
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_ISSUES ;
CREATE TABLE MOD_ISSUES (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,idSeq        INTEGER         NOT NULL  -- Numero de secuencia 
   ,idIssue      INTEGER         NOT NULL  -- Tipo de issue
   ,begLine      INTEGER         NOT NULL  -- Inicio de linea
   ,begColumn    INTEGER         NOT NULL  -- Inicio de columna
   ,endLine      INTEGER         NOT NULL  -- Fin de linea
   ,endColumn    INTEGER         NOT NULL  -- Fin de columna
);

ALTER TABLE MOD_ISSUES ADD PRIMARY KEY ( idVersion , idSeq );
ALTER TABLE MOD_ISSUES ADD FOREIGN KEY ( idVersion ) 
                           REFERENCES MOD_VERSIONES ( idVersion )
                           ON DELETE CASCADE ;

-- ----------------------------------------------------------
-- Grafo 
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_GRAFO ;
CREATE TABLE MOD_GRAFO (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,idGrafo      BIGINT UNSIGNED NOT NULL  -- Id del camino
   ,orden        BIGINT UNSIGNED NOT NULL  -- Secuencia
   ,tipo         INTEGER         NOT NULL  -- Tipo de nodo
   ,nombre       VARCHAR(64)     NOT NULL  -- Nombre del nodo
   ,peso         INTEGER         NOT NULL  -- Complejidad del nodo
);

ALTER TABLE MOD_GRAFO ADD PRIMARY KEY ( idVersion , idGrafo, orden  );
ALTER TABLE MOD_DEPENDENCIAS ADD FOREIGN KEY ( idVersion ) 
                                 REFERENCES MOD_VERSIONES ( idVersion )
                                 ON DELETE CASCADE ;

-- ----------------------------------------------------------
-- Bloques de codigo
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_BLOQUES ;
CREATE TABLE MOD_BLOQUES (
    idVersion    BIGINT UNSIGNED         NOT NULL
   ,orden        INTEGER                 NOT NULL  -- Numero de bloque
   ,lineBeg      INTEGER                 NOT NULL  -- Inicio de linea
   ,lineEnd      INTEGER                 NOT NULL  -- Fin de linea   
   ,sentencias   INTEGER                 NOT NULL  -- Sentencias del bloque
   ,usado        INTEGER                 NOT NULL  -- Se ha ejecutado (1 = si) 
);

ALTER TABLE MOD_BLOQUES ADD PRIMARY KEY ( idVersion , orden );
ALTER TABLE MOD_BLOQUES ADD         KEY ( idVersion );
ALTER TABLE MOD_BLOQUES ADD FOREIGN KEY ( idVersion ) 
                            REFERENCES MOD_VERSIONES ( idVersion )
                            ON DELETE CASCADE ;


-- ----------------------------------------------------------
-- Lista de parrafos
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_PARRAFOS ;
CREATE TABLE MOD_PARRAFOS (
    idVersion    BIGINT UNSIGNED NOT NULL
   ,nombre       VARCHAR(64)     NOT NULL  -- Nombre del parrafo
   ,linea        INTEGER         NOT NULL  -- Linea del parrafo
   ,sentencias   INTEGER         NOT NULL  -- Sentencias del parrafo
   ,referencias  INTEGER         NOT NULL  -- Veces que se referencia
   ,indice       INTEGER         NOT NULL  -- Indice en la taba Working
   ,cc           INTEGER         NOT NULL  -- Complejidad ciclomatica McCabe
   ,isExit       INTEGER         NOT NULL  -- Es un parrafo de exit? 
);

ALTER TABLE MOD_PARRAFOS ADD PRIMARY KEY ( idVersion , nombre );
ALTER TABLE MOD_PARRAFOS ADD FOREIGN KEY ( idVersion ) 
                            REFERENCES MOD_VERSIONES ( idVersion )
                            ON DELETE CASCADE ;

-- ----------------------------------------------------------
-- Relacion entre parrafos
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_REL_PARRAFOS ;
CREATE TABLE MOD_REL_PARRAFOS (
    idVersion    BIGINT UNSIGNED         NOT NULL
   ,id           BIGINT UNSIGNED         NOT NULL  -- Id Unico. 
                                                   -- Un parrafo A puede llamar a otro B varias veces     
   ,origen       BIGINT UNSIGNED         NOT NULL  -- Linea del parrafo origen
   ,destino      BIGINT UNSIGNED         NOT NULL  -- Linea del parrafo destino
);

ALTER TABLE MOD_REL_PARRAFOS ADD PRIMARY KEY ( idVersion , id );
ALTER TABLE MOD_REL_PARRAFOS ADD FOREIGN KEY ( idVersion ) 
                            REFERENCES MOD_VERSIONES ( idVersion )
                            ON DELETE CASCADE ;

-- ----------------------------------------------------------
-- Sentencias no permitidas
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_BADSTMTS ;
CREATE TABLE MOD_BADSTMTS (
    idVersion    BIGINT UNSIGNED         NOT NULL
   ,orden        INTEGER                 NOT NULL  -- Id Unico. 
                                                   -- Un parrafo A puede llamar a otro B varias veces     
   ,sentencia    VARCHAR(32)             NOT NULL  -- Sentencia no permitida
   ,begLine      INTEGER                 NOT NULL  -- Inicio de la sentencia
   ,endLine      INTEGER                 NOT NULL  -- Fin de la sentencia   
   ,columna      INTEGER                 NOT NULL  -- Columna
);

ALTER TABLE MOD_BADSTMTS ADD PRIMARY KEY ( idVersion , orden );
ALTER TABLE MOD_BADSTMTS ADD FOREIGN KEY ( idVersion ) 
                             REFERENCES MOD_VERSIONES ( idVersion )
                             ON DELETE CASCADE ;

-- ----------------------------------------------------------
-- Llamadas a modulos no identificadas (manuales)
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_MODULOS ;
CREATE TABLE MOD_MODULOS (
    archivo      VARCHAR(8)      NOT NULL  -- Nombre del archivo/modulo
   ,variable     VARCHAR(48)     NOT NULL  -- Variable que hace la llamada
   ,modulo       VARCHAR(48)     NOT NULL  -- Nombre del modulo o copy    
);

ALTER TABLE MOD_BADSTMTS ADD PRIMARY KEY ( archivo , variable , modulo );

-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- TABLAS CARGADAS COMO RESULTADO DE UNA EJECUCION
-- PREFIJO: TRP
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS TRP_SESIONES ;
CREATE TABLE TRP_SESIONES (
    idSesion     VARCHAR(64)      NOT NULL  -- Id de la sesion
   ,idModulo     VARCHAR(64)      NOT NULL  -- Id del modulo principal
   ,elapsed      BIGINT UNSIGNED  NOT NULL  -- Elapsed time
   ,cpu          BIGINT UNSIGNED  NOT NULL  -- CPU time
   ,suspend      BIGINT UNSIGNED  NOT NULL  -- Suspend time
   ,leido        BIGINT UNSIGNED  NOT NULL  -- Registros leidos
   ,escrito      BIGINT UNSIGNED  NOT NULL  -- Registros escritos
   ,finished     INTEGER          NOT NULL  -- Ha finalizado el proceso?
   ,uid          VARCHAR(32)      NOT NULL  -- uid     que lo ha ejecutado
   ,tms          TIMESTAMP        NOT NULL  -- Timestamp de ejecución
);

ALTER TABLE TRP_SESIONES ADD PRIMARY KEY ( idSesion, idModulo );
-- ALTER TABLE TRP_SESIONES ADD FOREIGN KEY ( idModulo ) 
--                              REFERENCES MOD_VERSIONES ( firma )
--                             ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Modulos invocados en la sesion incluyendo el modulo principal
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS TRP_MODULOS ;
CREATE TABLE TRP_MODULOS (
    idSesion     VARCHAR           (64) NOT NULL  -- Id de la sesion
   ,idModulo     VARCHAR           (64) NOT NULL  -- Id de la version
   ,orden        BIGINT UNSIGNED        NOT NULL  -- Contador de mensajes   
   ,modulo       VARCHAR           (64) NOT NULL  -- Nombre del modulo
   ,veces        BIGINT UNSIGNED        NOT NULL  -- Numero de ocurrencias
   ,totElapsed   BIGINT UNSIGNED        NOT NULL  -- Tiempo total
   ,totCpu       BIGINT UNSIGNED        NOT NULL  -- Tiempo total en modo uid    
   ,totSuspend   BIGINT UNSIGNED        NOT NULL  -- Tiempo total en modo uid       
   ,intElapsed   BIGINT UNSIGNED        NOT NULL  -- Tiempo bloque
   ,intCpu       BIGINT UNSIGNED        NOT NULL  -- Tiempo bloque en modo uid    
   ,intSuspend   BIGINT UNSIGNED        NOT NULL  -- Tiempo bloque en modo wait/suspend
);

ALTER TABLE TRP_MODULOS ADD PRIMARY KEY ( idSesion , idModulo );
ALTER TABLE TRP_MODULOS ADD FOREIGN KEY ( idSesion ) 
                            REFERENCES TRP_SESIONES ( idSesion )
                            ON DELETE CASCADE ;

-- ----------------------------------------------------------
-- Registros de cobertura
-- Una sesion puede afectar a varios modulos
-- ----------------------------------------------------------

DROP TABLE IF EXISTS TRP_COBERTURA ;
CREATE TABLE TRP_COBERTURA (
    idSesion   VARCHAR(64)      NOT NULL  -- MD5 de la sesion
   ,idModulo   VARCHAR(64)      NOT NULL  -- MD5 de la sesion
   ,orden      BIGINT UNSIGNED  NOT NULL  -- Numero de mensaje
   ,flags      VARCHAR(4000)    NOT NULL  -- Tabla working con flags de uso
);

ALTER TABLE TRP_COBERTURA ADD PRIMARY KEY ( idSesion, idModulo );
ALTER TABLE TRP_COBERTURA ADD FOREIGN KEY ( idSesion ) 
                              REFERENCES TRP_SESIONES ( idSesion )
                              ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Registros de persistencia
-- Una sesion puede ejecutar varias veces el mismo modulo
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS TRP_PERSISTENCIA ;
CREATE TABLE TRP_PERSISTENCIA (
    idSesion     VARCHAR(64)     NOT NULL  -- MD5 de la sesion
   ,idModulo     VARCHAR(64)     NOT NULL  -- MD5 del modulo
   ,orden        BIGINT UNSIGNED NOT NULL  -- Numero del mensaje 
   ,flags        VARCHAR(4000)   NOT NULL  -- Flags de bloques
);

ALTER TABLE TRP_PERSISTENCIA ADD PRIMARY KEY ( idSesion, idModulo);
ALTER TABLE TRP_PERSISTENCIA ADD FOREIGN KEY ( idSesion ) 
                                 REFERENCES TRP_SESIONES ( idSesion )
                                 ON DELETE CASCADE ;

-- ----------------------------------------------------------
-- Registros de llamadas a parrafos
-- Datos obtenidos de la working
-- ----------------------------------------------------------

DROP TABLE IF EXISTS TRP_PARR_WORKING ;
CREATE TABLE TRP_PARR_WORKING (
    idSesion   VARCHAR(64)      NOT NULL  -- MD5 de la sesion
   ,idModulo   VARCHAR(64)      NOT NULL  -- MD5 del modulo
   ,orden      BIGINT UNSIGNED  NOT NULL  -- Numero de mensaje   
   ,datos      VARCHAR(4095)    NOT NULL  -- Tabla working de contadores
);

ALTER TABLE TRP_PARR_WORKING ADD PRIMARY KEY ( idSesion, idModulo );
ALTER TABLE TRP_PARR_WORKING ADD FOREIGN KEY ( idSesion ) 
                                 REFERENCES TRP_SESIONES ( idSesion )
                                 ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Registros de llamadas a parrafos
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS TRP_PERFORM ;
CREATE TABLE TRP_PERFORM (
    idSesion     VARCHAR(64)     NOT NULL  -- MD5 de la sesion
   ,idModulo     VARCHAR(64)     NOT NULL  -- MD5 del modulo
   ,orden        BIGINT UNSIGNED NOT NULL  -- Numero del mensaje    
   ,etiqueta     VARCHAR(64)     NOT NULL  -- Etiqueta: modulo, parrafo, nombre
   ,totElapsed   BIGINT UNSIGNED NOT NULL  -- Tiempo total
   ,totCpu       BIGINT UNSIGNED NOT NULL  -- Tiempo total en modo uid    
   ,totSuspend   BIGINT UNSIGNED NOT NULL  -- Tiempo total en modo uid       
   ,intElapsed   BIGINT UNSIGNED NOT NULL  -- Tiempo bloque
   ,intCpu       BIGINT UNSIGNED NOT NULL  -- Tiempo bloque en modo uid    
   ,intSuspend   BIGINT UNSIGNED NOT NULL  -- Tiempo bloque en modo kernel      
);

ALTER TABLE TRP_PERFORM ADD PRIMARY KEY ( idSesion , idModulo, etiqueta , orden );
ALTER TABLE TRP_PERFORM ADD FOREIGN KEY ( idSesion ) 
                            REFERENCES TRP_SESIONES ( idSesion )
                            ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Registros de uso de parrafos
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS TRP_PARRAFOS ;
CREATE TABLE TRP_PARRAFOS (
    idSesion     VARCHAR(64)     NOT NULL  -- MD5 de la sesion
   ,idModulo     VARCHAR(64)     NOT NULL  -- MD5 del modulo
   ,orden        BIGINT UNSIGNED NOT NULL  -- Numero del mensaje    
   ,etiqueta     VARCHAR(64)     NOT NULL  -- Nombre del parrafo
   ,veces        BIGINT UNSIGNED NOT NULL  -- Numero de instancias
   ,totElapsed   BIGINT UNSIGNED NOT NULL  -- Tiempo total
   ,totCpu       BIGINT UNSIGNED NOT NULL  -- Tiempo total en modo uid    
   ,totSuspend   BIGINT UNSIGNED NOT NULL  -- Tiempo total en modo uid       
   ,intElapsed   BIGINT UNSIGNED NOT NULL  -- Tiempo bloque
   ,intCpu       BIGINT UNSIGNED NOT NULL  -- Tiempo bloque en modo uid    
   ,intSuspend   BIGINT UNSIGNED NOT NULL  -- Tiempo bloque en modo kernel      
);

ALTER TABLE TRP_PARRAFOS ADD PRIMARY KEY ( idSesion , idModulo, etiqueta , orden );
ALTER TABLE TRP_PARRAFOS ADD FOREIGN KEY ( idSesion ) 
                            REFERENCES TRP_SESIONES ( idSesion )
                            ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Registros de llamadas a modulos
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS TRP_CALL ;
CREATE TABLE TRP_CALL (
    idSesion     VARCHAR(64)      NOT NULL  -- MD5 de la sesion
   ,orden        BIGINT UNSIGNED  NOT NULL  -- Numero del mensaje     
   ,idCalling    VARCHAR(64)      NOT NULL  -- MD5 del modulo llamante
   ,idCalled     VARCHAR(64)      NOT NULL  -- MD5 del modulo llamado
   ,modulo       VARCHAR(64)      NOT NULL  -- Nombre de la rutina llamada 
   ,veces        BIGINT UNSIGNED  NOT NULL  -- Numero de instancias
   ,totElapsed   BIGINT UNSIGNED NOT NULL  -- Tiempo total
   ,totCpu       BIGINT UNSIGNED NOT NULL  -- Tiempo total en modo uid    
   ,totSuspend   BIGINT UNSIGNED NOT NULL  -- Tiempo total en modo uid       
   ,intElapsed   BIGINT UNSIGNED NOT NULL  -- Tiempo bloque
   ,intCpu       BIGINT UNSIGNED NOT NULL  -- Tiempo bloque en modo uid    
   ,intSuspend   BIGINT UNSIGNED NOT NULL  -- Tiempo bloque en modo kernel      
);

ALTER TABLE TRP_CALL ADD PRIMARY KEY ( idSesion, orden, idCalling, idCalled );
ALTER TABLE TRP_CALL ADD FOREIGN KEY ( idSesion ) 
                         REFERENCES TRP_SESIONES ( idSesion )
                         ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- TABLAS SUMARIZADAS DE LAS EJECUCIONES
-- PREFIJO: SES
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Ejecuciones
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS SES_SESIONES ;
CREATE TABLE SES_SESIONES (
    idSesion     VARCHAR(64)      NOT NULL  -- Id de la sesion
   ,idVersion    BIGINT UNSIGNED  NOT NULL  -- Id del modulo principal
   ,elapsed      BIGINT UNSIGNED  NOT NULL  -- Elapsed time
   ,cpu          BIGINT UNSIGNED  NOT NULL  -- CPU time
   ,suspend      BIGINT UNSIGNED  NOT NULL  -- Suspend time
   ,leido        BIGINT UNSIGNED  NOT NULL  -- Registros procesados
   ,escrito      BIGINT UNSIGNED  NOT NULL  -- Registros generados
   ,finished     INTEGER          NOT NULL  -- Ha finalizado el proceso?
   ,uid          VARCHAR(32)      NOT NULL  -- uid     que lo ha ejecutado
   ,tms          TIMESTAMP        NOT NULL  -- Timestamp de ejecución
);

ALTER TABLE SES_SESIONES ADD PRIMARY KEY ( idSesion, idVersion );
ALTER TABLE SES_SESIONES ADD         KEY ( idVersion );
ALTER TABLE SES_SESIONES ADD         KEY ( tms );

ALTER TABLE SES_SESIONES ADD FOREIGN KEY ( idVersion ) 
                                 REFERENCES MOD_VERSIONES ( idVersion )
                                 ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Persistencia
-- En una misma sesion pueden existir varias ejecuciones
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS SES_PERSISTENCIA ;
CREATE TABLE SES_PERSISTENCIA (
    idSesion    VARCHAR(64)      NOT NULL  -- Id de la sesion
   ,idVersion   BIGINT UNSIGNED  NOT NULL  -- Id de la version modulo
   ,orden       BIGINT UNSIGNED  NOT NULL  -- Cuenta de ejecuciones
   ,idFile      INTEGER          NOT NULL  -- Id del fichero
   ,maestro     INTEGER          NOT NULL  -- Indicador de maestro
   ,acOpen      BIGINT UNSIGNED  NOT NULL  -- Apertura
   ,acClose     BIGINT UNSIGNED  NOT NULL  -- Cierre
   ,acInsert    BIGINT UNSIGNED  NOT NULL  -- Insert / Write
   ,acRead      BIGINT UNSIGNED  NOT NULL  -- Read   
   ,acUpdate    BIGINT UNSIGNED  NOT NULL  -- Update / Rewrite
   ,acDelete    BIGINT UNSIGNED  NOT NULL  -- Delete
   ,acSelect    BIGINT UNSIGNED  NOT NULL  -- Select
   ,acTotal     BIGINT UNSIGNED  NOT NULL  -- Total de registros
);

ALTER TABLE SES_PERSISTENCIA ADD PRIMARY KEY ( idSesion , idVersion , orden , idFile);
ALTER TABLE SES_PERSISTENCIA ADD FOREIGN KEY ( idSesion ) 
                                 REFERENCES SES_SESIONES ( idSesion )
                                 ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Acumulado de entradas/salidas realizadas
-- Total de registros leidos escritos etc en la sesion
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS SES_IO ;
CREATE TABLE SES_IO (
    idSesion    VARCHAR(64)      NOT NULL  -- Id de la sesion
   ,idVersion   BIGINT UNSIGNED  NOT NULL  -- Id de la version modulo    
   ,acOpen      BIGINT UNSIGNED  NOT NULL  -- Apertura
   ,acClose     BIGINT UNSIGNED  NOT NULL  -- Cierre
   ,acInsert    BIGINT UNSIGNED  NOT NULL  -- Insert / Write
   ,acRead      BIGINT UNSIGNED  NOT NULL  -- Read   
   ,acUpdate    BIGINT UNSIGNED  NOT NULL  -- Update / Rewrite
   ,acDelete    BIGINT UNSIGNED  NOT NULL  -- Delete
   ,acSelect    BIGINT UNSIGNED  NOT NULL  -- Select
   ,acTotal     BIGINT UNSIGNED  NOT NULL  -- Total de registros
   ,tms         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE SES_IO ADD PRIMARY KEY ( idSesion );
ALTER TABLE SES_IO ADD         KEY ( idVersion , tms );
ALTER TABLE SES_IO ADD FOREIGN KEY ( idSesion ) 
                       REFERENCES SES_SESIONES ( idSesion )
                       ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Tiempos consumidos en cada parrafo de cada modulo por sesion
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS SES_PARRAFOS ;
CREATE TABLE SES_PARRAFOS (
    idSesion       VARCHAR(64)      NOT NULL  -- Id de la sesion
   ,idVersion      BIGINT UNSIGNED  NOT NULL  -- Id de la version modulo
   ,orden          BIGINT UNSIGNED  NOT NULL  -- Varios modulos por sesion
   ,nombre         VARCHAR(64)      NOT NULL  -- Etiqueta: modulo, parrafo, nombre
   ,veces          BIGINT UNSIGNED  NOT NULL  -- Numero de veces que se ha ejecutado 

   ,totElapsed     BIGINT UNSIGNED  NOT NULL  -- Tiempo total
   ,totCpu         BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,totSuspend     BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,intElapsed     BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,intCpu         BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo uid    
   ,intSuspend     BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo kernel      

   ,avgTotElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,avgTotCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,avgTotSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,avgIntElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,avgIntCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo uid    
   ,avgIntSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo kernel      

   ,minTotElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo total
   ,minTotCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,minTotSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,minIntElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,minIntCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo uid    
   ,minIntSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo kernel      

   ,maxTotElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,maxTotCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,maxTotSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,maxIntElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,maxIntCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque   
   ,maxIntSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque   

);

ALTER TABLE SES_PARRAFOS ADD PRIMARY KEY ( idSesion, idVersion, orden, nombre );
ALTER TABLE SES_PARRAFOS ADD FOREIGN KEY ( idSesion ) 
                             REFERENCES SES_SESIONES ( idSesion )
                             ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Arbol de llamadas de la sesion
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS SES_ARBOL ;
CREATE TABLE SES_ARBOL (
    idSesion       VARCHAR(64)      NOT NULL  -- Id de la sesion
   ,idCalling      BIGINT UNSIGNED  NOT NULL  -- Id de la version del modulo llamante
   ,idCalled       BIGINT UNSIGNED  NOT NULL  -- Id de la version del modulo llamado (0 si no se monitoriza)
   ,nombre         VARCHAR(32)      NOT NULL  -- Nombre del modulo llamado
   ,veces          BIGINT UNSIGNED  NOT NULL  -- Numero de veces que se ha ejecutado 
   ,totElapsed     BIGINT UNSIGNED  NOT NULL  -- Tiempo total
   ,totCpu         BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,totSuspend     BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,avgElapsed     BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,avgCpu         BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,avgSuspend     BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,tms            TIMESTAMP        NOT NULL
);

ALTER TABLE SES_ARBOL ADD PRIMARY KEY ( idSesion, idCalling, idCalled);
ALTER TABLE SES_ARBOL ADD FOREIGN KEY ( idCalling ) 
                          REFERENCES MOD_VERSIONES ( idVersion )
                          ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- Modulos y tiempos consumidos en la sesion
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS SES_MODULOS ;
CREATE TABLE SES_MODULOS (
    idSesion       VARCHAR(64)      NOT NULL  -- Id de la sesion
   ,idVersion      BIGINT UNSIGNED  NOT NULL  -- Id de la version modulo
   ,orden          BIGINT UNSIGNED  NOT NULL  -- Varios modulos por sesion
   ,nombre         VARCHAR(64)      NOT NULL  -- Nombre del modulo
   ,veces          BIGINT UNSIGNED  NOT NULL  -- Numero de veces que se ha ejecutado 
   ,totElapsed     BIGINT UNSIGNED  NOT NULL  -- Tiempo total
   ,totCpu         BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,totSuspend     BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,intElapsed     BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,intCpu         BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo uid    
   ,intSuspend     BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo kernel      
   ,avgTotElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,avgTotCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,avgTotSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,avgIntElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,avgIntCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo uid    
   ,avgIntSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo kernel      
   ,minTotElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo total
   ,minTotCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,minTotSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,minIntElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,minIntCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo uid    
   ,minIntSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo kernel      
   ,maxTotElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,maxTotCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,maxTotSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,maxIntElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,maxIntCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque   
   ,maxIntSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque   
   ,tms            TIMESTAMP        NOT NULL  -- Timestamp de la sesion

);

ALTER TABLE SES_MODULOS ADD PRIMARY KEY ( idSesion, idVersion, orden );
ALTER TABLE SES_MODULOS ADD FOREIGN KEY ( idSesion ) 
                            REFERENCES SES_SESIONES ( idSesion )
                            ON DELETE CASCADE ;


-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- TABLAS SUMARIZADAS DEL USO DE MODULOS
-- PREFIJO: SUM
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS SUM_MODULOS ;
CREATE TABLE SUM_MODULOS (
    idVersion      BIGINT UNSIGNED  NOT NULL  -- Id de la version modulo
   ,idModulo       BIGINT UNSIGNED  NOT NULL  -- Id del modulo
   ,nombre         VARCHAR(64)      NOT NULL  -- Nombre del modulo
   ,veces          BIGINT UNSIGNED  NOT NULL  -- Numero de veces que se ha ejecutado 
   ,avgElapsed     BIGINT UNSIGNED  NOT NULL  -- Media de tiempo
   ,avgCpu         BIGINT UNSIGNED  NOT NULL  -- Media de CPU
   ,avgSuspend     BIGINT UNSIGNED  NOT NULL  -- Media de suspend
   ,minElapsed     BIGINT UNSIGNED  NOT NULL  -- Minimo de tiempo
   ,minCpu         BIGINT UNSIGNED  NOT NULL  -- Minimo de CPU
   ,minSuspend     BIGINT UNSIGNED  NOT NULL  -- Minimo de suspend
   ,maxElapsed     BIGINT UNSIGNED  NOT NULL  -- Minimo de tiempo
   ,maxCpu         BIGINT UNSIGNED  NOT NULL  -- Maximo de CPU
   ,maxSuspend     BIGINT UNSIGNED  NOT NULL  -- Maximo de Suspend
   ,avgLeido       BIGINT UNSIGNED  NOT NULL  -- Media de registros leidos
   ,avgEscrito     BIGINT UNSIGNED  NOT NULL  -- Media de registros escritos
   ,minLeido       BIGINT UNSIGNED  NOT NULL  -- Minimo de registros leidos
   ,minEscrito     BIGINT UNSIGNED  NOT NULL  -- Minimo de registros escritos
   ,maxLeido       BIGINT UNSIGNED  NOT NULL  -- Maximo de registros leidos
   ,maxEscrito     BIGINT UNSIGNED  NOT NULL  -- Maximo de registros escritos

);

ALTER TABLE SUM_MODULOS ADD PRIMARY KEY ( idVersion  );
ALTER TABLE SUM_MODULOS ADD FOREIGN KEY ( idVersion ) 
                            REFERENCES MOD_VERSIONES ( idVersion )
                            ON DELETE CASCADE ;


-- -------------------------------------------------------------------
-- Tiempos consumidos en cada parrafo de cada modulo por sesion
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS SUM_PARRAFOS ;
CREATE TABLE SUM_PARRAFOS (
    idVersion      BIGINT UNSIGNED  NOT NULL  -- Id de la version modulo
   ,nombre         VARCHAR(64)      NOT NULL  -- Etiqueta: modulo, parrafo, nombre     
   ,sesiones       BIGINT UNSIGNED  NOT NULL  -- Numero de sesiones
   ,veces          BIGINT UNSIGNED  NOT NULL  -- Numero de veces que se ha ejecutado 
   ,linea          INTEGER          NOT NULL  -- Linea dentro del modulo fuente   
   ,totElapsed     BIGINT UNSIGNED  NOT NULL  -- Tiempo total
   ,totCpu         BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,totSuspend     BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,intElapsed     BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,intCpu         BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo uid    
   ,intSuspend     BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo kernel      
   ,avgTotElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,avgTotCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,avgTotSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,avgIntElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,avgIntCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo uid    
   ,avgIntSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo kernel      
   ,minTotElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo total
   ,minTotCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,minTotSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,minIntElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,minIntCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo uid    
   ,minIntSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque en modo kernel      
   ,maxTotElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,maxTotCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,maxTotSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,maxIntElapsed  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque
   ,maxIntCpu      BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque   
   ,maxIntSuspend  BIGINT UNSIGNED  NOT NULL  -- Tiempo bloque   
   ,tms            TIMESTAMP        NOT NULL
);

ALTER TABLE SUM_PARRAFOS ADD PRIMARY KEY ( idVersion, nombre );
ALTER TABLE SUM_PARRAFOS ADD FOREIGN KEY ( idVersion ) 
                             REFERENCES MOD_VERSIONES ( idVersion )
                             ON DELETE CASCADE ;


-- -------------------------------------------------------------------
-- Arbol de llamadas
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS SUM_ARBOL ;
CREATE TABLE SUM_ARBOL (
    idCalling      BIGINT UNSIGNED  NOT NULL  -- Id de la version del modulo llamante
   ,idCalled       BIGINT UNSIGNED  NOT NULL  -- Id de la version del modulo llamado (0 si no se monitoriza)
   ,nombre         VARCHAR(32)      NOT NULL  -- Nombre del modulo llamado
   ,sesiones       BIGINT UNSIGNED  NOT NULL  -- Numero de sesiones monitorizadas
   ,veces          BIGINT UNSIGNED  NOT NULL  -- Numero de veces que se ha ejecutado 
   ,totElapsed     BIGINT UNSIGNED  NOT NULL  -- Tiempo total
   ,totCpu         BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,totSuspend     BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,avgElapsed     BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid    
   ,avgCpu         BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,avgSuspend     BIGINT UNSIGNED  NOT NULL  -- Tiempo total en modo uid       
   ,tms            TIMESTAMP        NOT NULL
);

ALTER TABLE SUM_ARBOL ADD PRIMARY KEY ( idCalling, idCalled, nombre );
ALTER TABLE SUM_ARBOL ADD FOREIGN KEY ( idCalling ) 
                          REFERENCES MOD_VERSIONES ( idVersion )
                          ON DELETE CASCADE ;

-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- TABLAS DE GESTION DE MENSAJES Y LOG
-- PREFIJO: LOG
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS LOG_LOGGING ;
CREATE TABLE LOG_LOGGING (
    secuencia    BIGINT UNSIGNED  NOT NULL AUTO_INCREMENT PRIMARY KEY -- Clave unica
   ,idAppl       BIGINT UNSIGNED  NOT NULL  -- Identificador de la aplicacion
   ,idModulo     BIGINT UNSIGNED  NOT NULL  -- Identificador del modulo
   ,idVersion    BIGINT UNSIGNED  NOT NULL  -- Identificador de la version
   ,idTipo       INTEGER          NOT NULL  -- Identificador del tipo de mensaje       
   ,idMsg        INTEGER          NOT NULL  -- Identificador del mensaje
   ,uid          VARCHAR(32)      NOT NULL  -- uid    
   ,objeto       VARCHAR(64)      NOT NULL  -- Nombre del objeto
   ,tms          TIMESTAMP        NOT NULL  DEFAULT CURRENT_TIMESTAMP
-- Campos para rellenar el mensaje   
   ,dato0        VARCHAR(64)      -- Campo 0
   ,dato1        VARCHAR(64)      -- Campo 2
   ,dato2        VARCHAR(64)      -- Campo 3
   ,dato3        VARCHAR(64)      -- Campo 3
   ,dato4        VARCHAR(64)      -- Campo 4
   ,dato5        VARCHAR(64)      -- Campo 5
   ,dato6        VARCHAR(64)      -- Campo 6
   ,dato7        VARCHAR(64)      -- Campo 7
   ,dato8        VARCHAR(64)      -- Campo 8
   ,dato9        VARCHAR(64)      -- Campo 9                          
);

ALTER TABLE LOG_LOGGING ADD INDEX ( tms DESC );
ALTER TABLE LOG_LOGGING ADD INDEX ( idTipo );
ALTER TABLE LOG_LOGGING ADD INDEX ( tms DESC, idMsg );
ALTER TABLE LOG_LOGGING ADD INDEX ( idAppl , idModulo );
ALTER TABLE LOG_LOGGING ADD INDEX ( uid );

-- -------------------------------------------------------------------
-- Tabla de mensajes 
-- Esta localizada para cada idioma disponible
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS LOG_MSG ;
CREATE TABLE LOG_MSG (
    idMsg        INTEGER          NOT NULL  -- Identificador del mensaje
   ,lang         CHAR(2)          NOT NULL  -- Codigo de idioma
   ,msg          VARCHAR(255)     NOT NULL  -- Formato del mensaje
);

ALTER TABLE LOG_MSG ADD PRIMARY KEY ( idMsg , lang );

-- -------------------------------------------------------------------
-- Tabla de tipos de mensajes
-- Contiene el teto descriptivo del tipo de mensaje
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS LOG_TIPO ;
CREATE TABLE LOG_TIPO (
    idTipo       INTEGER          NOT NULL  -- Identificador del mensaje
   ,lang         CHAR(2)          NOT NULL  -- Codigo de idioma
   ,msg          VARCHAR(255)     NOT NULL  -- Formato del mensaje
);

ALTER TABLE LOG_TIPO ADD PRIMARY KEY ( idTipo , lang );

-- -------------------------------------------------------------------
-- Tabla de reglas e issues
-- Contiene el teto descriptivo del tipo de mensaje
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS RUL_ISSUES ;
CREATE TABLE RUL_ISSUES (
    idGrupo      INTEGER          NOT NULL  -- Agrupacion de reglas
   ,idIssue      INTEGER          NOT NULL  -- Identificador del Issue
   ,severity     INTEGER          NOT NULL  -- Nivel de severidad
   ,comparador   INTEGER          NOT NULL  -- Indicador de <, <=, ==, >=, >
   ,valor        VARCHAR(64)      NOT NULL  -- Valor umbral
   ,msg          VARCHAR(255)     NOT NULL  -- Descrpcion
);

ALTER TABLE RUL_ISSUES ADD PRIMARY KEY ( idGrupo , idIssue );

-- -------------------------------------------------------------------
-- Tabla de aprobaciones
-- severity 99 -> Algoritmo de suma de totales
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS RUL_RULES ;
CREATE TABLE RUL_RULES (
    idGrupo      BIGINT UNSIGNED  NOT NULL  -- Area, Aplicacion, Modulo
   ,severity     INTEGER          NOT NULL  -- Nivel de severidad
   ,valor        INTEGER          NOT NULL  -- Valor umbral
   ,uid          VARCHAR(32)      NOT NULL  -- Usuario que lo ha creado
   ,tms          TIMESTAMP        NOT NULL  -- Timestamp

);

ALTER TABLE RUL_RULES ADD PRIMARY KEY ( idGrupo , severity );


-- ------------------------------------------------------------------- 
-- Tabla de sentencias CICS TS
-- Tipo : 1 - TS
--        2 - QR
--        3 - TS o QR dependiendo 
-- Las sentencias de varias palabras van separadas por underscore
--
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS CFG_CICS ;
CREATE TABLE CFG_CICS (
    verbo        VARCHAR(32)      NOT NULL  -- Sentencia CICS
   ,tipo         INTEGER          NOT NULL  -- TS/QR/Both
);

ALTER TABLE CFG_CICS ADD PRIMARY KEY ( verbo );

SET FOREIGN_KEY_CHECKS = 1 ;


COMMIT;