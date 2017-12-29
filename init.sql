-- -------------------------------------------------------------------
-- Proyecto Fin de Carrera
--
-- Datos de carga iniciales para el sistema
-- Autor: Javier Gonzalez
--
-- -------------------------------------------------------------------

USE SDP;
-- --------------------------------------------------------
-- Aplicaciones
-- --------------------------------------------------------

DELETE FROM SDP_APLICACIONES;

INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid        , tms               , descripcion)
            VALUES           (   1 ,  'General'                  ,     0 ,       50, 'U000001'  , CURRENT_TIMESTAMP , 'Aplicacion para modulos no identificados'  );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid        , tms               , descripcion)
            VALUES           (   2 ,  'No etiquetadas'           ,     0 ,       50, 'SYSTEM'   , CURRENT_TIMESTAMP , 'Aplicaciones no etiquetadas por el usuario');
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid        , tms               , descripcion)
            VALUES           (   3 ,  'No monitorizadas'         ,     0 ,       50, 'U000001'  , CURRENT_TIMESTAMP , 'Aplicacion no moitorizadas'                );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid        , tms               , descripcion)
            VALUES           (   4 ,  'SDP'                      ,     0 ,       50, 'U000001'  , CURRENT_TIMESTAMP , 'Aplicaciones del sistema'                  );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid        , tms               , descripcion)
            VALUES           (   5 ,  'Web'                      ,     0 ,       50, 'SYSTEM'   , CURRENT_TIMESTAMP , 'Aplicaciones Web'                          );

INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  401    , 'IVP'                   ,     4 ,      50 , 'SYSTEM'  , CURRENT_TIMESTAMP , 'Installation Verification Process'          );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  402    , 'Test'                  ,     4 ,      125, 'SYSTEM'  , CURRENT_TIMESTAMP , 'Aplicaciones de pruebas'                    );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  403    , 'Sinteticos'            ,     4 ,      100, 'SYSTEM'  , CURRENT_TIMESTAMP , 'Programas sinteticos'                       );

INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  411    , 'Sort'                  ,   402 ,      75 , 'SYSTEM'  , CURRENT_TIMESTAMP , 'Ordenaciones'                            );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  412    , 'Arbol'                 ,   402 ,      100, 'SYSTEM'  , CURRENT_TIMESTAMP , 'Montaje de arboles'                       );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  413    , 'Errores'               ,   402 ,      100, 'SYSTEM'  , CURRENT_TIMESTAMP , 'Programas erroneos'                       );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  414    , 'Avisos'                ,   402 ,      100, 'SYSTEM'  , CURRENT_TIMESTAMP , 'Avisos web'                               );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  415    , 'Variables'             ,   402 ,      100, 'SYSTEM'  , CURRENT_TIMESTAMP , 'Programas sinteticos'                     );
            
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  11 ,  'Cuentas Personales'   ,     0 ,      250 , 'U000003' , CURRENT_TIMESTAMP , 'Cuentas personales'                      );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  12 ,  'Prestamos y creditos' ,     0 ,     1250 , 'U000004' , CURRENT_TIMESTAMP , 'Prestamos y creditos'                    );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  13 ,  'Fondos'               ,     0 ,      250 , 'U000005' , CURRENT_TIMESTAMP , 'Fondos de inversion'                     );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  14 ,  'Recursos Humanos'     ,     0 ,      135 , 'U000006' , CURRENT_TIMESTAMP , 'Sistemas de recuros humanos'             );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  15 ,  'Contabilidad'         ,     0 ,     2450 , 'U000007' , CURRENT_TIMESTAMP , 'Sistemas contables'                      ); 
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (  16 ,  'Tesoreria'            ,     0 ,     1750 , 'U000008' , CURRENT_TIMESTAMP , 'Tesoreria'                               ); 

                         

                         
DELETE FROM SDP_REL_APP_MOD;

INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES (   1 , '*'     ,   0 , 10000 , 'SYSTEM');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 401 , 'IVP*'  , 300 ,  1000 , 'SYSTEM');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 411 , 'SRT*'  , 300 ,  1000 , 'SYSTEM');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 412 , 'ARB*'  , 300 ,  1000 , 'SYSTEM');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 413 , 'BAD*'  , 300 ,  1000 , 'SYSTEM');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 414 , 'COV*'  , 300 ,  1000 , 'SYSTEM');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES (   4 , 'SDP*'  , 300 ,  1000 , 'SYSTEM');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 415 , 'WRT*'  , 300 ,  1000 , 'SYSTEM');

DELETE FROM CFG_CODES;

-- Tipos de modulos (Grupo 1)

INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 ,  0 , 'xx', 'XX' , 'Unknow'            );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 10 , 'xx', 'XX' , 'Area / Application');
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 11 , 'xx', 'XX' , 'Area'              );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 12 , 'xx', 'XX' , 'Application'       );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 20 , 'xx', 'XX' , 'Program'           );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 21 , 'xx', 'XX' , 'Main program'      );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 22 , 'xx', 'XX' , 'Module'            );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 30 , 'xx', 'XX' , 'Copy'              );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 31 , 'xx', 'XX' , 'Working copy'      );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 32 , 'xx', 'XX' , 'Code working'      );

INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 ,  0 , 'es', 'ES' , 'No identificado'   );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 10 , 'es', 'ES' , 'Area / Aplicacion' );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 11 , 'es', 'ES' , 'Area'              );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 12 , 'es', 'ES' , 'Aplicacion'        );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 20 , 'es', 'ES' , 'Programa'          );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 21 , 'es', 'ES' , 'Programa principal');
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 22 , 'es', 'ES' , 'Rutina'            );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 30 , 'es', 'ES' , 'Copy'              );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 31 , 'es', 'ES' , 'Copy Working'      );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  1 , 32 , 'es', 'ES' , 'Copy Codigo'       );

-- Tipos de dependencias (Grupo 2)

INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 ,  1 , 'xx', 'XX' , 'General copy'      );

INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 10 , 'xx', 'XX' , 'General copy'      );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 11 , 'xx', 'XX' , 'File description'  );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 13 , 'xx', 'XX' , 'Working copybook'  );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 14 , 'xx', 'XX' , 'Linkage copybook'  );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 15 , 'xx', 'XX' , 'Code copybook'     );

INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 20 , 'xx', 'XX' , 'Module'            );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 21 , 'xx', 'XX' , 'Static Module'     );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 22 , 'xx', 'XX' , 'Dynamic Module'    );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 23 , 'xx', 'XX' , 'Variable'          );

INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 ,  1 , 'es', 'ES' , 'General copy'      );

INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 10 , 'es', 'ES' , 'Copy General'      );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 11 , 'es', 'ES' , 'Copybook ficheros' );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 13 , 'es', 'ES' , 'Copybook Working'  );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 14 , 'es', 'ES' , 'Copybook Linkage'  );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 15 , 'es', 'ES' , 'Copybook codigo'   );

INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 20 , 'es', 'ES' , 'Modulo'            );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 21 , 'es', 'ES' , 'Modulo estatico'   );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 22 , 'es', 'ES' , 'Modulo dinamico'   );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  2 , 23 , 'es', 'ES' , 'Variable'          );


-- Agrupacion de los parametros de configuracion (Grupo 3)

INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  0 , 'xx', 'XX' , 'General'           );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  1 , 'xx', 'XX' , 'Messaging'         );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  2 , 'xx', 'XX' , 'Parser'            );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  3 , 'xx', 'XX' , 'Web'               );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  4 , 'xx', 'XX' , 'Databases'         );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  5 , 'xx', 'XX' , 'System'            );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 , 99 , 'xx', 'XX' , 'Configuration'     );

INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  0 , 'es', 'ES' , 'General'           );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  1 , 'es', 'ES' , 'Mensajeria'        );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  2 , 'es', 'ES' , 'Parser'            );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  3 , 'es', 'ES' , 'Web'               );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  4 , 'es', 'ES' , 'Base de datos'     );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 ,  5 , 'es', 'ES' , 'Sistema'           );
INSERT INTO CFG_CODES (grp , code , idLang , idDialect, data) VALUES (  3 , 99 , 'es', 'ES' , 'Configuracion'     );
