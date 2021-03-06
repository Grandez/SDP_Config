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

DELETE FROM CFG_CONFIGURATION;

INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'inst.name' , 'Serendipity');

-- For Eclipse
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sdp.dir.config', 'P:/SDP/config');

-- Default name for conf directory
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sdp.dir.config.relative', 'config');

-- list of files to be ignored (Bad or incorrect)
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sdp.file.ignore', 'ignore.txt');

-- Directory for documents
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sdp.dir.docs ', ' P:/SDP/Docs');

--  Number of versions for each module
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sdp.max.versions', '1');             

-- Si no existe una aplicacion asociada
-- El modulo va al "bote"
-- Esta directiva crea una aplicacion ficticia si no existe
-- de acuerdo con la mascara [A-Z0-9]{n]
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sdp.auto.application', '2');
--  Aplicacion a la que pertenecera la nueva creada
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sdp.application.base', '1');

-- #####################################################################
-- # Parser configuration
-- #####################################################################


-- # parser.dir.input', 'P:/Cobol/GRF
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.dir.input', 'P:/SDP/BBVA/wrk');
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.dir.output', 'P:/SDP/BBVA/out');
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.margin.left', '7');
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.margin.right', '72');

-- # Caracteres a expandir por cada tab
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.tab', '1');

-- # Directorios de COPYS

INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.dir.copy.0', 'P:/SDP/BBVA/CPYWRK');
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.dir.copy.1', 'P:/SDP/BBVA/CPY');
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.dir.copy.2', 'P:/SDP/BBVA/DCLWRK');
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.dir.copy.3', 'P:/SDP/BBVA/DCL');

-- # Extensiones para los ficheros de COPYS
-- # Deben empezar con punto para poder poner sin extension
-- # Es decir, el punto se quita

INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.copy.ext.0', '.');
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.copy.ext.1', '.cpy');
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.copy.ext.2', '.cbl');

-- # Guardar los fuentes
-- # Si no, no se podran mostrar los issues
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.save.source', 'true');
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.save.copys', 'true');

-- # Iteraciones para identificar las llamadas a modulos
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.tree.depth ', '1');

-- #####################################################################
-- # Dialecto COBOL
-- # MFCobol
-- # OpenCobol
-- # ZCobol
-- #####################################################################

INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.dialect', 'ZCobol');

-- #####################################################################
-- # Elementos a perfilar por defecto
-- #####################################################################

-- # Verificar profiler o hacer defecto del pgm
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'profiler.verify', 'false');    
 -- # Perfilar o no perfilar 
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'profiler.profile', 'true');    

-- # Hacer Suspend en CICS
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'profiler.suspend', 'true');     

-- # Perfilar los modulos
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'profiler.module    ', ' true'); 
-- # Perfilar el uso de parrafos
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'profiler.paragraph ', ' true'); 
-- # Perfilar parrafos por llamadas
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'profiler.perform   ', ' true'); 
-- # Perfilar las llamadas a modulos
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'profiler.call      ', ' true'); 
-- # Perfilar sentenias SQL
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'profiler.sql       ', ' true'); 
-- # Perfilar sentencias CICS
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'profiler.cics      ', ' true'); 

-- # Nivel de profundidad del perfilado
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'profiler.depth ', ' 9999');     


-- # Componentes a parsear por defecto
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.flags', '1111111111111111');

-- #####################################################################
-- # normal - No lanza un trap por cada perform, si no por cada llamada
-- # fine   - Lanza un trap por cada parrafo ejecutado
-- #####################################################################

INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'parser.trap.level', 'normal');


-- #####################################################################
-- # DEFINICIONES PARA LA GENERACION DE EXCEL
-- #####################################################################

-- # Caracter de concatenacion de valores de mascara. Ej.: CALL/LINK
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'excel.mask', '/');
-- # Caracter de concatenacion de codigos y valores. Ej.: 1$Estatico 
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'excel.concatenate', '$');
-- # Prefijo de las funciones
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'excel.prefix', 'SDP');
-- # Separador de nombre de las funciones excel
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'excel.delimiter', '_');
-- # Funcion vacia
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'excel.empty', 'TOOLS_EMPTY');

-- #####################################################################
-- # DEFINICIONES DEL SISTEMA DE MENSAJERIA
-- #####################################################################
-- # Valores de JMS
-- #   WMQ    -> Websphere MQSeries en modo binding
-- #   WMQJMS -> Websphere MQSeries en modo JMS 
-- #   HTTP   -> Webservice
-- #####################################################################

INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.type', 'HTTP');
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.url.trapper', 'localhost:8080/SDPWebPersister');

-- # Numero de mensajes a agrupar antes de enviar uno                 
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.group', '10');                       

-- Tiempo de espera en segundos para el siguiente mensaje
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.wait', '1');           
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.commit.interval', '1');

-- # QManager a utilizar
-- # Si se quiere usar el QManager por defecto comentar la clave

INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.queue.manager   ', 'SDP.QMGR');     

-- Cola para el proceso de analisis (Parser)        
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.queue.parser    ', 'SDP.PARSER');     
-- Cola para el proceso SDPTRAPB    (Trapper)   
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.queue.trapper   ', 'SDP.TRAPPER');    
-- Cola para el collector de mensajes
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.queue.collector ', 'SDP.COLLECTOR');  
-- La usa el propio collector 
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.queue.output    ', 'SDP.COLLECTOR');  

INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.hostname', 'localhost');
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'jms.port', '1414');

--  # Porcentaje minimo de cobertura del codigo
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'code.min.coverage', '75');          
 --  # Complejidad maxima por parrafo
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'code.max.complexity.parr', '10');   
--  # Complejidad maxima total
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'code.max.complexity', '15');         
--  # Numero de sentencias por parrafo
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'code.max.sentences', '25');          

-- # Porcentaje maximo de desviacion de una ejecucion respecto a la media
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sesion.desv.elapsed', '25');    
-- # Porcentaje maximo de desviacion de registros leidos
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sesion.desv.input', '10');      
-- # Porcentaje maximo de desviacion de registros escritos
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sesion.desv.output', '10');     

-- # Intervalor de logging cuando se filtra por Timestamp
-- # s ', ' Segundo
-- # m ', ' minuto
-- # h ', ' hora
-- # d ', ' dia

INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'web.log.tms.interval', '1h');
-- # Maximo numero de registros si no hay filtro    
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'web.log.max.records', '250');  


INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sgdb.name', 'mariadb');  
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'sgdb.mariadb.loader', 'mysql -u SDP --password="sdp" < $file');  

INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'ivp.config.file', 'P:/SDP/Config/ivp.xml');  
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'ivp.input.dir', 'P:/SDP/Cobol');  
INSERT INTO CFG_CONFIGURATION (tooltip, grupo , tipo, mask, minimo, maximo, clave, valor) VALUES   (  50000,     0 ,    1, 'N/A' , 'N/A' , 'N/A', 'ivp.loader', 'IVPLoader');  
COMMIT;
