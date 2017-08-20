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

DELETE FROM CFG_CODIGOS;

-- Tipos de modulos (Grupo 1)

INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 ,  0 , 'XX' , 'Unknow'            );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 10 , 'XX' , 'Area / Application');
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 11 , 'XX' , 'Area'              );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 12 , 'XX' , 'Application'       );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 20 , 'XX' , 'Program'           );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 21 , 'XX' , 'Main program'      );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 22 , 'XX' , 'Module'            );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 30 , 'XX' , 'Copy'              );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 31 , 'XX' , 'Working copy'      );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 32 , 'XX' , 'Code working'      );

INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 ,  0 , 'ES' , 'No identificado'   );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 10 , 'ES' , 'Area / Aplicacion' );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 11 , 'ES' , 'Area'              );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 12 , 'ES' , 'Aplicacion'        );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 20 , 'ES' , 'Programa'          );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 21 , 'ES' , 'Programa principal');
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 22 , 'ES' , 'Rutina'            );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 30 , 'ES' , 'Copy'              );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 31 , 'ES' , 'Copy Working'      );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  1 , 32 , 'ES' , 'Copy Codigo'       );

-- Tipos de dependencias (Grupo 2)

INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 ,  1 , 'XX' , 'General copy'      );

INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 10 , 'XX' , 'General copy'      );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 11 , 'XX' , 'File description'  );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 13 , 'XX' , 'Working copybook'  );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 14 , 'XX' , 'Linkage copybook'  );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 15 , 'XX' , 'Code copybook'     );

INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 20 , 'XX' , 'Module'            );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 21 , 'XX' , 'Static Module'     );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 22 , 'XX' , 'Dynamic Module'    );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 23 , 'XX' , 'Variable'          );

INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 ,  1 , 'ES' , 'General copy'      );

INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 10 , 'ES' , 'Copy General'      );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 11 , 'ES' , 'Copybook ficheros' );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 13 , 'ES' , 'Copybook Working'  );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 14 , 'ES' , 'Copybook Linkage'  );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 15 , 'ES' , 'Copybook codigo'   );

INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 20 , 'ES' , 'Modulo'            );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 21 , 'ES' , 'Modulo estatico'   );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 22 , 'ES' , 'Modulo dinamico'   );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  2 , 23 , 'ES' , 'Variable'          );


-- Agrupacion de los parametros de configuracion (Grupo 3)

INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  0 , 'XX' , 'General'           );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  1 , 'XX' , 'Messaging'         );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  2 , 'XX' , 'Parser'            );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  3 , 'XX' , 'Web'               );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  4 , 'XX' , 'Databaes'          );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  5 , 'XX' , 'System'            );

INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  0 , 'ES' , 'General'           );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  1 , 'ES' , 'Mensajeria'        );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  2 , 'ES' , 'Parser'            );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  3 , 'ES' , 'Web'               );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  4 , 'ES' , 'Base de datos'     );
INSERT INTO CFG_CODIGOS (grupo , codigo , lang , valor) VALUES (  3 ,  5 , 'ES' , 'Sistema'           );
