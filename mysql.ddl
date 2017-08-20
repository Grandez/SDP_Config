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

-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- TABLAS DE CONFIGURACION Y GENERALES
-- PREFIJO: CFG
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Tabla de configuracion de sistema
-- Cuando no hay acceso a la base de datos se corresponde con el
-- fichero de propiedades
-- -------------------------------------------------------------------
 
DROP   TABLE IF EXISTS CFG_CONFIGURACION;
CREATE TABLE CFG_CONFIGURACION  (
    clave    VARCHAR  (127) NOT NULL
   ,valor    VARCHAR  (255) NOT NULL 
   ,grupo    INTEGER        NOT NULL
   ,tipo     INTEGER        NOT NULL 
   ,mask     VARCHAR  (127) 
   ,minimo   VARCHAR   (32)
   ,maximo   VARCHAR   (32)
   ,tooltip  INTEGER        NOT NULL
   ,uid      VARCHAR(32)    DEFAULT 'SYSTEM'
   ,tms      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    

);

ALTER TABLE CFG_CONFIGURACION ADD PRIMARY KEY ( clave );

-- -------------------------------------------------------------------
-- Tablas de codigos
-- Contiene las descripciones de los codigos 
-- localizadas para cada idioma disponible
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS CFG_CODIGOS ;
CREATE TABLE CFG_CODIGOS (
    grupo        INTEGER     NOT NULL  -- Grupo de codigos  
   ,codigo       INTEGER     NOT NULL  -- Identificador
   ,lang         VARCHAR(02) NOT NULL  -- Codigo de idioma
   ,valor        VARCHAR(64) NOT NULL  -- Descripcion     
);

ALTER TABLE CFG_CODIGOS ADD PRIMARY KEY ( grupo , codigo , lang);

-- -------------------------------------------------------------------
-- Tabla de descripciones de codigos numericos
-- Esta localizada para cada idioma disponible
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS CFG_TRANSLATE ;
CREATE TABLE CFG_TRANSLATE (
    idField      VARCHAR(255)     NOT NULL  -- Identificador del campo
   ,idValue      INTEGER          NOT NULL  -- Valor
   ,lang         CHAR(2)          NOT NULL  -- Codigo de idioma
   ,msg          VARCHAR(255)     NOT NULL  -- Formato del mensaje
);

ALTER TABLE CFG_TRANSLATE ADD PRIMARY KEY ( idField , idValue, lang );

-- -------------------------------------------------------------------
-- Tabla de formulas
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS CFG_FORMULAS ;
CREATE TABLE CFG_FORMULAS (
    idFormula    INTEGER          NOT NULL  -- Identificador de la formula
   ,idSeq        INTEGER          NOT NULL  -- Secuencia, cada una es un OR
   ,formula      VARCHAR(255)     NOT NULL  -- Formula en textto
);

ALTER TABLE CFG_FORMULAS ADD PRIMARY KEY ( idFormula , idSeq );

-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- TABLAS OPERATIVAS BASE
-- PREFIJO: SDP
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------

-- ----------------------------------------------------------
-- Areas y aplicaciones
-- ----------------------------------------------------------

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
   ,archivo      VARCHAR(255)    NOT NULL  -- Nombre del archivo
   ,tipo         INTEGER         NOT NULL  -- Tipo de archivo (0 - Codigo, 1 - COPY, 2 - INCLUDE)
   ,firma        VARCHAR(64)     NOT NULL  -- firma digital del archivo   
   ,numModulos   INTEGER         NOT NULL  -- Numero de modulos
   ,estado       INTEGER         NOT NULL  -- Estado del analisis
   ,uid          VARCHAR(32)     NOT NULL
   ,tms          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
);

ALTER TABLE SDP_FILES   ADD PRIMARY KEY   ( idFile );
ALTER TABLE SDP_FILES   ADD UNIQUE  KEY   ( archivo , tipo );

-- -------------------------------------------------------------------
-- Modulo fuente original comprimido
-- -------------------------------------------------------------------

DROP   TABLE IF EXISTS SDP_SOURCES CASCADE ;
CREATE TABLE SDP_SOURCES (
    idFile    BIGINT UNSIGNED  NOT NULL  -- Identificador de la version del modulo
   ,source    MEDIUMBLOB       NOT NULL  -- Fuente en formato ZIP
);

ALTER TABLE SDP_SOURCES ADD PRIMARY KEY ( idFile );
ALTER TABLE SDP_SOURCES ADD FOREIGN KEY ( idFile ) 
                           REFERENCES SDP_FILES ( idFile )
                           ON DELETE CASCADE ;

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
   ,activo       INTEGER         NOT NULL  -- Activo (1) o Inactivo(0)
   ,versiones    INTEGER         NOT NULL  -- Numero de versiones
   ,uid          VARCHAR(32)     NOT NULL
   ,tms          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
);

ALTER TABLE SDP_MODULOS ADD PRIMARY KEY   ( idAppl , idModulo , tipo );
ALTER TABLE SDP_MODULOS ADD         KEY   ( idModulo , tipo );
ALTER TABLE SDP_MODULOS ADD FOREIGN KEY(idAppl) 
                              REFERENCES SDP_APLICACIONES (idAppl )
                              ON DELETE CASCADE;

-- ----------------------------------------------------------
-- Dependencias manuales
-- Se cargan de manera manual para resolver dependencias que
-- no se pueden inferir en el analisis estatico
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS SDP_DEPENDENCIAS ;
CREATE TABLE SDP_DEPENDENCIAS (
    modulo       VARCHAR(64)     NOT NULL  -- Nombre del modulo llamante
   ,variable     VARCHAR(64)     NOT NULL  -- Nombre de la variable no identificada
   ,called       VARCHAR(64)               -- Modulo llamado. Si null, no se considerara dependencia
   ,uid          VARCHAR(32)     NOT NULL
   ,tms          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
);

ALTER TABLE SDP_DEPENDENCIAS ADD PRIMARY KEY ( modulo , variable, called );

-- ----------------------------------------------------------
-- Excepciones de Issues
-- Se activan por Web
-- no se pueden inferir en el analisis estatico
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS SDP_ISSUES_EXCEP ;
CREATE TABLE SDP_ISSUES_EXCEP (
    modulo       VARCHAR(64)     NOT NULL  -- Nombre del modulo llamante
   ,idSeq        INTEGER         NOT NULL  -- Numero de secuencia 
   ,idIssue      INTEGER         NOT NULL  -- Tipo de issue
   ,begLine      INTEGER         NOT NULL  -- Inicio de linea   
   ,bloque       VARCHAR(64)     NOT NULL  -- Bloque donde se ha identificado
   ,firma        VARCHAR(64)     NOT NULL  -- firma digital
   ,uid          VARCHAR(32)     NOT NULL
   ,tms          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
);

ALTER TABLE SDP_ISSUES_EXCEP ADD PRIMARY KEY ( modulo , idSeq, idIssue, begLine, bloque);

-- ----------------------------------------------------------      
-- ----------------------------------------------------------
-- TABLAS DE INFORMACION DE UN MODULO
-- PREFIJO: MOD
-- ----------------------------------------------------------
-- ----------------------------------------------------------

-- ----------------------------------------------------------
-- Un modulo tiene varias versiones
-- Esta tabla contiene la referencia al mismo y 
-- y la informacion de control
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_VERSIONES CASCADE ;
CREATE TABLE MOD_VERSIONES (
    idModulo     BIGINT UNSIGNED  NOT NULL  -- Id del modulo
   ,idVersion    BIGINT UNSIGNED  NOT NULL  -- Id de la version 
   ,idFile       BIGINT UNSIGNED  NOT NULL  -- Id del archivo
   ,offsetBeg    INTEGER          NOT NULL  -- Offset de inicio del modulo dentro del archivo
   ,offsetEnd    INTEGER          NOT NULL  -- Offset de fin del modulo dentro del archivo
   ,nombre       VARCHAR(32)      NOT NULL  -- Nombre del modulo 
   ,tipo         INTEGER          NOT NULL  -- Tipo de modulo     
   ,estado       INTEGER          NOT NULL  --  0 - Sin info /  1 - Completo /  2 - Parcial pero sin dudas
                                            -- 11 - Ignorado / 99 - Analizado solo CICS 
   ,missing      INTEGER          NOT NULL  -- Tiene copys no procesadas (0 - No / 1 - Missing / 2 - erroneas)
   ,arbol        INTEGER          NOT NULL  -- El arbol de llamadas esta completo (1 - Si, 0 - No)
   ,descripcion  VARCHAR(512)     NOT NULL  -- Posible comentario
   ,autor        VARCHAR(64)      NOT NULL  -- Autor
   ,uid          VARCHAR(32)      NOT NULL  -- uid que crea o actualiza   
   ,tms          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
);

ALTER TABLE MOD_VERSIONES ADD PRIMARY KEY ( idVersion );
ALTER TABLE MOD_VERSIONES ADD UNIQUE  KEY ( idModulo , idVersion);      
ALTER TABLE MOD_VERSIONES ADD FOREIGN KEY(idModulo) 
                              REFERENCES SDP_MODULOS (idModulo )
                              ON DELETE CASCADE;

-- ----------------------------------------------------------
-- Esta tabla contiene los atributos basicos del modulo
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_SUMMARY CASCADE ;
CREATE TABLE MOD_SUMMARY (
    idVersion    BIGINT UNSIGNED  NOT NULL  -- Secuencia de la version 
   ,fichero      INTEGER          NOT NULL  -- Flag tiene ficheros
   ,sgdb         INTEGER          NOT NULL  -- Flag tiene SQL
   ,cics         INTEGER          NOT NULL  -- Flag tiene CICS
   ,mq           INTEGER          NOT NULL  -- Flag tiene MQ   
   ,callsCount   INTEGER          NOT NULL  -- Numero de modulos invocados
   ,callsMode    INTEGER          NOT NULL  -- Mascara llamadas (1: CALL 2: LINK 4: XCTL)
   ,callsType    INTEGER          NOT NULL  -- Mascara dinamico (1: Si : 2: Estatico)
   ,ts           INTEGER          NOT NULL  -- Indicador TS: 1 / Si - 0 - No
   ,tsmode       INTEGER          NOT NULL  -- Valor de ts
   ,memoria      BIGINT UNSIGNED  NOT NULL  -- Memoria utilizada                
   ,dinamico     INTEGER          NOT NULL  -- Aloca memoria (0 - No, 1 - Si)   
);

ALTER TABLE MOD_SUMMARY ADD PRIMARY KEY ( idVersion );
ALTER TABLE MOD_SUMMARY ADD FOREIGN KEY(idVersion) 
                            REFERENCES MOD_VERSIONES (idVersion )
                            ON DELETE CASCADE;

-- ----------------------------------------------------------
-- Datos resumidos de la version referentes al codigo
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_CODIGO CASCADE ;
CREATE TABLE MOD_CODIGO (
    idVersion     BIGINT UNSIGNED         NOT NULL  -- Identificador de la version
   ,lineas        INTEGER                 NOT NULL  -- Lineas del modulo
   ,parrafos      INTEGER                 NOT NULL  -- Parrafos
   ,sentencias    INTEGER                 NOT NULL  -- Sentencias
   ,blancos       INTEGER                 NOT NULL  -- Lineas en blanco
   ,comentarios   INTEGER                 NOT NULL  -- Lineas de comentarios
   ,bloques       INTEGER                 NOT NULL  -- Bloques de comentarios
   ,decoradores   INTEGER                 NOT NULL  -- Comentarios decoradores
   ,verbosData    INTEGER                 NOT NULL  -- Sentencias
   ,verbosIO      INTEGER                 NOT NULL  -- Sentencias   
   ,verbosControl INTEGER                 NOT NULL  -- Sentencias   
   ,verbosFlujo   INTEGER                 NOT NULL  -- Sentencias
   ,verbosArit    INTEGER                 NOT NULL  -- Sentencias   
   ,verbosLang    INTEGER                 NOT NULL  -- Sentencias   
   ,verbosCics    INTEGER                 NOT NULL  -- Sentencias    
   ,verbosSQL     INTEGER                 NOT NULL  -- Sentencias       
   ,ficheros      INTEGER                 NOT NULL  -- Persistencia    
   ,loops         INTEGER                 NOT NULL  -- Numero de bucles (No se considera anidacion)

);

ALTER TABLE MOD_CODIGO ADD PRIMARY KEY ( idVersion );
ALTER TABLE MOD_CODIGO ADD FOREIGN KEY ( idVersion ) 
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

DROP   TABLE IF EXISTS MOD_COPYS ;
CREATE TABLE MOD_COPYS (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,modulo       VARCHAR(64)     NOT NULL  -- Nombre del modulo o copy
   ,tipo         INTEGER         NOT NULL  -- Tipo de dependencia (COPY, INCLUDE)
   ,subTipo      INTEGER         NOT NULL  -- Subtipo (En funcion de donde se declare (Registro, tabla, link, ...)
   ,refs         INTEGER         NOT NULL  -- Numero de referencias en el modulo
   ,estado       INTEGER         NOT NULL  -- Verificado o no (0/1)
   ,idFile       BIGINT UNSIGNED NOT NULL  -- Id del fichero
   ,idCopy       BIGINT UNSIGNED NOT NULL  -- Id de la copy
);

ALTER TABLE MOD_COPYS ADD PRIMARY KEY ( idVersion , modulo, tipo );
ALTER TABLE MOD_COPYS ADD FOREIGN KEY ( idVersion ) 
                                 REFERENCES MOD_VERSIONES ( idVersion )
                                 ON DELETE CASCADE ;

-- ----------------------------------------------------------
-- Guarda los tokens en el caso de que haya un token REPLACING
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_REPLACING ;
CREATE TABLE MOD_REPLACING (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,idCopy       BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo    
   ,linea        INTEGER         NOT NULL  -- Linea donde aparece la COPY
   ,orden        INTEGER         NOT NULL  -- Secuencia
   ,text1        VARCHAR(255)    NOT NULL  -- Texto a cambiar (from)
   ,text2        VARCHAR(255)    NOT NULL  -- Texto nuevo     (to)   
);

ALTER TABLE MOD_REPLACING ADD PRIMARY KEY ( idVersion , idCopy, linea, orden);
ALTER TABLE MOD_REPLACING ADD FOREIGN KEY ( idVersion ) 
                                 REFERENCES MOD_VERSIONES ( idVersion )
                                 ON DELETE CASCADE ;

DROP   TABLE IF EXISTS MOD_CALLS ;
CREATE TABLE MOD_CALLS (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,modulo       VARCHAR(64)     NOT NULL  -- Nombre del modulo invocado
   ,metodo       INTEGER         NOT NULL  -- Tipo de dependencia (CALL / LINK / XCTL / TRANSID)
   ,modo         INTEGER         NOT NULL  -- Modo : Estatico/dinamico
   ,refs         INTEGER         NOT NULL  -- Numero de referencias en el modulo
   ,estado       INTEGER         NOT NULL  -- Manual / Automatico / Variable
   ,ejecutado    INTEGER         NOT NULL  -- se ha ejecutado (1 = si)
);

ALTER TABLE MOD_CALLS ADD PRIMARY KEY ( idVersion , modulo);
ALTER TABLE MOD_CALLS ADD FOREIGN KEY ( idVersion ) 
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
   ,idGroup      INTEGER         NOT NULL  -- Grupo
   ,idItem       INTEGER         NOT NULL  -- Item
   ,idRule       INTEGER         NOT NULL  -- Regla   
   ,severity     INTEGER         NOT NULL  -- Nivel de severidad
   ,begLine      INTEGER         NOT NULL  -- Inicio de linea
   ,begColumn    INTEGER         NOT NULL  -- Inicio de columna
   ,endLine      INTEGER         NOT NULL  -- Fin de linea
   ,endColumn    INTEGER         NOT NULL  -- Fin de columna
   ,bloque       VARCHAR(64)     NOT NULL  -- Bloque donde se ha identificado / Parrafo
   ,firma        VARCHAR(64)     NOT NULL  -- firma digital   
   ,idException  BIGINT UNSIGNED NOT NULL  -- Id de la excepcion
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

ALTER TABLE MOD_ISSUES_EXCEP ADD PRIMARY KEY ( idVersion , idSeq);
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

ALTER TABLE MOD_ISSUES_EXCEP_DESC ADD PRIMARY KEY ( idVersion , idException, idData);
ALTER TABLE MOD_ISSUES_EXCEP_DESC ADD FOREIGN KEY ( idVersion , idException ) 
                                  REFERENCES MOD_ISSUES_EXCEP ( idVersion , idException)
                                  ON DELETE CASCADE ;

-- ----------------------------------------------------------
-- Sentencias SQL
-- ----------------------------------------------------------

DROP   TABLE IF EXISTS MOD_SQL ;
CREATE TABLE MOD_SQL (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,begLine      INTEGER         NOT NULL  -- Inicio de linea / Secuencia
   ,verb         VARCHAR(64)     NOT NULL  -- Verbo
   ,complexity   INTEGER         NOT NULL  -- Complejidad de la sentencia
   ,explanation  INTEGER         NOT NULL  -- explain
   ,firma        VARCHAR(64)     NOT NULL  -- firma digital    
);

ALTER TABLE MOD_SQL ADD PRIMARY KEY ( idVersion , begLine);
ALTER TABLE MOD_SQL ADD         KEY ( idVersion , firma);
ALTER TABLE MOD_SQL ADD FOREIGN KEY ( idVersion ) 
                           REFERENCES MOD_VERSIONES ( idVersion )
                           ON DELETE CASCADE ;

DROP   TABLE IF EXISTS MOD_SQL_STMT CASCADE ;
CREATE TABLE MOD_SQL_STMT (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,begLine      INTEGER         NOT NULL  -- Numero de secuencia 
   ,firma        VARCHAR(64)     NOT NULL  -- firma
   ,stmt         MEDIUMBLOB      NOT NULL  -- Fuente en formato ZIP
);

ALTER TABLE MOD_SQL_STMT ADD PRIMARY KEY ( idVersion , begLine);
ALTER TABLE MOD_SQL_STMT ADD FOREIGN KEY ( idVersion , begLine) 
                           REFERENCES MOD_SQL ( idVersion , begLine )
                           ON DELETE CASCADE ;

-- ----------------------------------------------------------
-- Grafos 
-- ----------------------------------------------------------

-- Lista de grafos
DROP   TABLE IF EXISTS MOD_GRAPHS ;
CREATE TABLE DCG_GRAPHS (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,idGrafo      INTEGER         NOT NULL  -- Id del subgrafo
   ,level        INTEGER         NOT NULL  -- Minimo nivel de profundidad del subgrafo
   ,name         VARCHAR(64)     NOT NULL  -- Nombre del grafo
);

ALTER TABLE DCG_GRAPHS ADD PRIMARY KEY ( idVersion , idGrafo  );
ALTER TABLE DCG_GRAPHS ADD FOREIGN KEY ( idVersion ) 
                                   REFERENCES MOD_VERSIONES ( idVersion )
                                   ON DELETE CASCADE ;

DROP   TABLE IF EXISTS DCG_NODES ;
CREATE TABLE DCG_NODES (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,idGrafo      INTEGER         NOT NULL  -- Tipo de nodo
   ,idNode       INTEGER         NOT NULL  -- Id del nodo
   ,tipo         INTEGER         NOT NULL  -- Tipo de nodo
   ,nombre       VARCHAR(64)     NOT NULL  -- Nombre del nodo
   ,subgraph     INTEGER         NOT NULL  -- Es un subgrafo (1 = Si)
);

ALTER TABLE DCG_NODES ADD PRIMARY KEY ( idVersion , idGrafo, idNode  );
ALTER TABLE DCG_NODES ADD FOREIGN KEY ( idVersion ) 
                                 REFERENCES MOD_VERSIONES ( idVersion )
                                 ON DELETE CASCADE ;

DROP   TABLE IF EXISTS DCG_EDGES ;
CREATE TABLE DCG_EDGES (
    idVersion    BIGINT UNSIGNED NOT NULL  -- Id de la verson del modulo
   ,idGrafo      INTEGER         NOT NULL  -- Id del grafo
   ,idFrom       INTEGER         NOT NULL  -- Nodo origen
   ,idTo         INTEGER         NOT NULL  -- Nodo destino
);

ALTER TABLE DCG_EDGES ADD PRIMARY KEY ( idVersion , idGrafo, idFrom, idTo  );
ALTER TABLE DCG_EDGES ADD FOREIGN KEY ( idVersion ) 
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
   ,indice       INTEGER         NOT NULL  -- Numero de orden
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

DROP TABLE IF EXISTS RUL_ITEMS ;
CREATE TABLE RUL_ITEMS (
    idGroup      INTEGER          NOT NULL  -- Agrupacion de reglas
   ,idItem       INTEGER          NOT NULL  -- Identificador del item
   ,activo       INTEGER          NOT NULL  -- 0 - No 1 - Activo
   ,keyNum       INTEGER                    -- Clave numerica
   ,keyTxt       VARCHAR(64)                -- Clave texto
   ,uid          VARCHAR(32)      NOT NULL  -- Usuario que activa/desactiva
   ,tms          TIMESTAMP        NOT NULL  -- Fecha de modificacion
);
ALTER TABLE RUL_ITEMS ADD PRIMARY KEY ( idGroup , idItem );
ALTER TABLE RUL_ITEMS ADD FOREIGN KEY ( idGroup ) 
                             REFERENCES RUL_GROUPS ( idGroup )
                             ON DELETE CASCADE ;


DROP TABLE IF EXISTS RUL_ISSUES ;
CREATE TABLE RUL_ISSUES (
    idGroup      INTEGER          NOT NULL  -- Agrupacion de reglas
   ,idItem       INTEGER          NOT NULL  -- Agrupacion de reglas
   ,idIssue      INTEGER          NOT NULL  -- Identificador del Issue
   ,activo       INTEGER          NOT NULL  -- 0 - No 1 - Activo
   ,severity     INTEGER          NOT NULL  -- Nivel de severidad
   ,comparador   INTEGER          NOT NULL  -- Codigo de operacion
   ,tipo         INTEGER          NOT NULL  -- Tipo del valor
   ,valor        VARCHAR(64)      
   ,uid          VARCHAR(32)      NOT NULL  -- Usuario que activa/desactiva
   ,tms          TIMESTAMP        NOT NULL  -- Fecha de modificacion
);

ALTER TABLE RUL_ISSUES ADD PRIMARY KEY ( idGroup, idItem , idIssue );

DROP TABLE IF EXISTS RUL_DESC ;
CREATE TABLE RUL_DESC (
    idGroup      INTEGER          NOT NULL  -- Agrupacion de reglas
   ,idItem       INTEGER          NOT NULL  -- Agrupacion de reglas
   ,idIssue      INTEGER          NOT NULL  -- Identificador del Issue
   ,idLang       CHAR(2)          NOT NULL  -- Codigo del idioma
   ,idDialect    CHAR(2)          NOT NULL  -- Codigo del dialecto
   ,msg          VARCHAR(255)     NOT NULL  -- Texto

);

ALTER TABLE RUL_DESC ADD PRIMARY KEY ( idGroup, idItem, idIssue, idLang, idDialect );


-- Tabla con las funciones de DB2

DROP TABLE IF EXISTS SQL_FUNCTIONS ;
CREATE TABLE SQL_FUNCTIONS (
    name         VARCHAR(64)      NOT NULL  -- Nombre de la funcion
   ,tipo         INTEGER          NOT NULL  -- tipo de funcion
   ,peso         INTEGER          NOT NULL  -- peso de la complejidad
   ,issue        INTEGER          NOT NULL  -- Issue si procede

);

ALTER TABLE SQL_FUNCTIONS ADD PRIMARY KEY ( name );

-- Tabla con los registros

DROP TABLE IF EXISTS SQL_REGISTERS ;
CREATE TABLE SQL_REGISTERS (
    name         VARCHAR(64)      NOT NULL  -- Nombre de la funcion
   ,peso         INTEGER          NOT NULL  -- peso de la complejidad
   ,issue        INTEGER          NOT NULL  -- Issue si procede

);

ALTER TABLE SQL_REGISTERS ADD PRIMARY KEY ( name );

SET FOREIGN_KEY_CHECKS = 1 ;


COMMIT;	