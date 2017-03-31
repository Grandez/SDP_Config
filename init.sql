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

INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (   1 ,  'General'              ,     0 ,       50 , 'U000001' , CURRENT_TIMESTAMP , 'Aplicacion para modulos no identificados');
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (   2 ,  'Test'                 ,     0 ,      125 , 'U000002' , CURRENT_TIMESTAMP , 'Aplicacion de pruebas'                   );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (   3 ,  'Cuentas Personales'   ,     0 ,      250 , 'U000003' , CURRENT_TIMESTAMP , 'Cuentas personales'                      );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (   4 ,  'Prestamos y creditos' ,     0 ,     1250 , 'U000004' , CURRENT_TIMESTAMP , 'Prestamos y creditos'                    );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (   5 ,  'Fondos'               ,     0 ,      250 , 'U000005' , CURRENT_TIMESTAMP , 'Fondos de inversion'                     );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (   6 ,  'Recursos Humanos'     ,     0 ,      135 , 'U000006' , CURRENT_TIMESTAMP , 'Sistemas de recuros humanos'             );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (   7 ,  'Contabilidad'         ,     0 ,     2450 , 'U000007' , CURRENT_TIMESTAMP , 'Sistemas contables'                      ); 
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           (   8 ,  'Tesoreria'            ,     0 ,     1750 , 'U000008' , CURRENT_TIMESTAMP , 'Tesoreria'                               ); 

INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           ( 101 ,  'IVP'                  ,     2 ,      50 , 'U000002' , CURRENT_TIMESTAMP , 'Installation Verification Process'       );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           ( 102 ,  'Sort'                 ,     2 ,      75 , 'U000002' , CURRENT_TIMESTAMP , 'Ordenaciones'                            );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           ( 103 ,  'Arbol'                ,     2 ,      100, 'U000002' , CURRENT_TIMESTAMP , 'Montaje de arboles'                       );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           ( 104 ,  'Errores'              ,     2 ,      100, 'U000002' , CURRENT_TIMESTAMP , 'Programas erroneos'                       );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           ( 105 ,  'Avisos'               ,     2 ,      100, 'U000002' , CURRENT_TIMESTAMP , 'Avisos web'                               );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           ( 106 ,  'Sinteticos'           ,     2 ,      100, 'U000002' , CURRENT_TIMESTAMP , 'Programas sinteticos'                     );
INSERT INTO SDP_APLICACIONES (  idAppl , aplicacion              , padre , volumen , uid       , tms               , descripcion)
            VALUES           ( 107 ,  'Variables'            ,     2 ,      100, 'U000002' , CURRENT_TIMESTAMP , 'Programas sinteticos'                     );
                         

                         
DELETE FROM SDP_REL_APP_MOD;

INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES (   1 , '*'     ,   0 , 10000 , 'system');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 101 , 'IVP*'  , 300 ,  1000 , 'system');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 102 , 'SRT*'  , 300 ,  1000 , 'system');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 103 , 'ARB*'  , 300 ,  1000 , 'system');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 104 , 'BAD*'  , 300 ,  1000 , 'system');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 105 , 'COV*'  , 300 ,  1000 , 'system');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 106 , 'SDP*'  , 300 ,  1000 , 'system');
INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 106 , 'WRT*'  , 300 ,  1000 , 'system');

INSERT INTO SDP_REL_APP_MOD ( idAppl , mask , fijo , peso , uid    ) VALUES ( 107 , 'IVP15*', 500 ,    30 , 'system');

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

-- --------------------------------------------------------
-- Configuracion
-- Grupo 0 - Datos generales
-- Grupo 1 - Mensajeria
-- Grupo 2 - Parser
-- Grupo 3 - Web
-- Grupo 5 - Base de datos / Sistema
-- --------------------------------------------------------

DELETE FROM CFG_CONFIGURACION;

INSERT INTO CFG_CONFIGURACION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'inst.name' , 'Serendipity');

INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      2 ,    4, 'N/A' , 'N/A' , 'N/A', 'parser.dir.input' , 'p:/cases/in');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      2 ,    4 , 'N/A' , 'N/A' , 'N/A', 'parser.dir.output' , 'p:/cases/out');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      2 ,    2 , '[0-9]+' , '0' , '72', 'parser.margin.left' , '7');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      2 ,    2 , '[0-9]+' , '12' , '255', 'parser.margin.right' , '72');
                              
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      1 ,    1 , 'N/A' ,    '1' , '255', 'jms.type' , 'WMQ');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      1 ,    1 , 'N/A' ,    '1' , '255', 'jms.queue.manager' , 'QMGR_SDP');

INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      1 ,    1 , 'N/A' ,    '1' , '255', 'jms.queue.parser' , 'SDP.PARSER');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      1 ,    1 , 'N/A' ,    '1' , '255', 'jms.queue.TRAPPER' , 'SDP.TRAPPER');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      1 ,    1 , 'N/A' ,    '1' , '255', 'jms.queue.collector' , 'SDP.COLLECTOR');

INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      1 ,    1 , 'N/A' ,    '1' , '255', 'jms.queue.output' , 'SDP.CONSOLIDATOR');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      1 ,    1 , 'N/A' ,    '1' , '255', 'jms.hostname' , 'localhost');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      1 ,    2 , 'N/A' ,    '1' , '5', 'jms.port' , '1414');

INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (   50000,     1 ,    2 , '[0-9]+' , '1' , '60', 'jms.wait' , '1');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (   50000,     1 ,    2 , '[0-9]+' , '1' , '100', 'jms.group' , '10');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (   50000,     1 ,    2 , '[0-9]+' , '0' , '1000000', 'jms.commit.interval' , '1');

INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (   50000,     3 ,    2 , '[0-4]' , '0' , '4', 'date.interval' , '0');

INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask,     minimo, maximo, clave               , valor) VALUES
                              (  50000,      5 ,    2, '[0-9]+' , '1'  , '25'  , 'code.max.versions' , '1');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask,     minimo, maximo, clave               , valor) VALUES
                              (  50000,      5 ,    2, '[0-9]+' , '1'  , '100' , 'code.min.coverage' , '75');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask,     minimo, maximo, clave               , valor) VALUES
                              (  50000,      5 ,    2, '[0-9]+' , '0'  , '1000' , 'code.max.complexity' , '15');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask,     minimo, maximo, clave               , valor) VALUES
                              (  50000,      5 ,    2, '[0-9]+' , '0'  , '1000' , 'code.max.complexity.parr' , '10');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask,     minimo, maximo, clave               , valor) VALUES
                              (  50000,      5 ,    2, '[0-9]+' , '0'  , '1000' , 'code.max.sentences' , '25');


INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask,     minimo, maximo, clave               , valor) VALUES
                              (  50000,      5 ,    2, '[0-9]+' , 'N/A'  , 'N/A' , 'sesion.desv.elapsed' , '25');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask,     minimo, maximo, clave               , valor) VALUES
                              (  50000,      5 ,    2, '[0-9]+' , 'N/A'  , 'N/A' , 'sesion.desv.input' , '10');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask,     minimo, maximo, clave               , valor) VALUES
                              (  50000,      5 ,    2, '[0-9]+' , 'N/A'  , 'N/A' , 'sesion.desv.output' , '10');

INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask,     minimo, maximo, clave               , valor) VALUES
                              (  50000,      3 ,    2, '[0-9]+' , '100'  , '1000' , 'web.log.max.records' , '250');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask,     minimo, maximo, clave               , valor) VALUES
                              (  50000,      3 ,    1, 'N/A' , 'N/A'  , 'N/A' , 'web.log.tms.interval' , 'H');


COMMIT;

