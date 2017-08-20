USE SDP;
-- --------------------------------------------------------
-- Aplicaciones
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Configuracion
-- Grupo 0 - Datos generales
-- Grupo 1 - Mensajeria
-- Grupo 2 - Parser
-- Grupo 3 - Web
-- Grupo 5 - Base de datos / Sistema
-- --------------------------------------------------------

DELETE FROM CFG_CONFIGURACION;

INSERT INTO CFG_CONFIGURACION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'inst.name' , 'Serendipity');

INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      2 ,    4, 'N/A' , 'N/A' , 'N/A', 'parser.dir.input' , 'p:/cases/in');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      2 ,    4 , 'N/A' , 'N/A' , 'N/A', 'parser.dir.output' , 'p:/cases/out');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      2 ,    2 , '[0-9]+' , '0' , '72', 'parser.margin.left' , '7');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      2 ,    2 , '[0-9]+' , '12' , '255', 'parser.margin.right' , '72');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      2 ,    2 , '[0-9]+' , '0' , '255', 'sdp.application.base' , '1');
INSERT INTO CFG_CONFIGURACION (tooltip , grupo , tipo, mask, minimo, maximo, clave, valor) VALUES
                              (  50000,      2 ,    2 , '[0-1]' , '0' , '1', 'sdp.auto.aplicacion' , '1');

                              
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

