-- hacerlo por programa o por pantalla


-- -------------------------------------------------------------------
-- SERENDIPITY
--
-- Reglas
--
-- Autor: Javier Gonzalez
--
-- Grupos
-- 0 - Source - Cosas generales de edicion
-- 2 - COPYS
-- 1 - Variables
--
-- Severidad
-- 0 - Ninguna
-- 1 - Menor 
-- 2 - Media
-- 3 - Alta
-- 4 - Severa
-- 5 - Bloqueante

-- Tipo
-- 1 - Verbo / Palabra
-- 2 - Opcion
-- 3 - LValues
-- 4 - RValues

-- 9 - Especial/manual

-- Comparador
--  0 - No debe existir
--  1 - Debe existir
--  2 - igual
--  3 - Mayor o igual
--  4 - Menor o igual
--  5 - Tipo
-- -------------------------------------------------------------------

USE SDP;

-- -------------------------------------------------------------------
-- Los mensajes se corresponden con las claves numericas
-- -------------------------------------------------------------------

DELETE FROM RUL_GROUPS;
DELETE FROM RUL_ITEMS;
DELETE FROM RUL_ISSUES;
DELETE FROM RUL_DESC;

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   1,  0, 1, 1, 'COM');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   1, 'XX', 'XX', 'Raiz');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   1, 'ES', 'es', 'Raiz');

-- -------------------------------------------------------------------
-- Grupo: 2 - Codigo fuente
-- Padre: 1 
-- Avisos que tiene que ver con el editor y la codificacion
-- Se chequean directamente en el analisis
-- -------------------------------------------------------------------

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   2,  1, 1, 2, 'SRC');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   2, 'XX', 'XX', 'Codigo fuente');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   2, 'ES', 'es', 'Codigo fuente');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES ( 02,  0201, 1, 0, 'TAB', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor, uid,      tms) 
                VALUES (  0201,   020101,      1,    0,        2,    1,          0,    ' ', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  210101, 'XX', 'XX', 'No usar caracteres tabulacion');
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  210101, 'ES', 'es', 'No usar caracteres tabulacion');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (  2,   202, 1, 0, ' ', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor, uid,      tms) 
                VALUES (  0202,   020201,      1,    0,        2,    1,          0,    ' ', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020201, 'XX', 'XX', 'No usar caracteres no imprimibles');
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020201, 'ES', 'es', 'No usar caracteres no imprimibles');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (  2,   203, 1, 0, 'EJECT', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor,        uid,      tms) 
                VALUES (  0203,   020301,      1,    0,        2,    1,          0,  'EJECT',      'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020301, 'XX', 'XX', 'No es necesario imprimir el codigo');
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020301, 'ES', 'es', 'No es necesario imprimir el codigo');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (  2,   204, 1, 0, 'SKIP', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor,                   uid,      tms) 
                VALUES (  0204,   020401,      1,    0,        2,    1,          0,  'SKIP',                  'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020401, 'XX', 'XX', 'No es necesario imprimir el codigo');
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020401, 'ES', 'es', 'No es necesario imprimir el codigo');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (  2,   205, 1, 0, 'DIRECTIVE', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor,                        uid,      tms) 
                VALUES (  0205,   020501,      1,    0,        2,    1,          0,  'DIRECTIVE',                  'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020401, 'XX', 'XX', 'No se pueden usar directivas de compilacion en el codigo');
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020401, 'ES', 'es', 'No se pueden usar directivas de compilacion en el codigo');



-- -------------------------------------------------------------------
-- Grupo: 21 - COMENTARIOS
-- Padre:  2 - Codigo fuente
-- -------------------------------------------------------------------

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (  21,  2, 1, 21, 'CMT');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (  21, 'XX', 'XX', 'Comentarios');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (  21, 'ES', 'es', 'Comentarios');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES ( 21,  2101, 1, 0, 'D', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor, uid,      tms) 
                VALUES (  2101,   210101,      1,    0,        1,    1,          0,    'D', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  210101, 'XX', 'XX', 'No usar codigo de depuracion');
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  210101, 'ES', 'es', 'No usar codigo de depuracion');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES ( 21,  2102, 1, 0, '/', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor, uid,      tms) 
                VALUES (  2102,   210201,      1,    0,        1,    1,          0,    '/', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg) VALUES (  210201, 'XX', 'XX', 'Usar solo caracter asterisco para comentarios');
INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg) VALUES (  210201, 'ES', 'es', 'Usar solo caracter asterisco para comentarios');


-- -------------------------------------------------------------------
-- Grupo: PROGRAMA
-- Padre: 1 - Avisos sobre el programa en global
-- -------------------------------------------------------------------

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   3,  1, 1, 3, 'COB');
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg)            VALUES (   3, 'XX', 'XX', 'Programa');
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg)            VALUES (   3, 'ES', 'es', 'Programa');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (  3,   301, 1, 0, '-',         'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor,                        uid,      tms) 
                VALUES (  0301,   030101,      1,    0,        3,    1,          0,  '-'                           'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  030101, 'XX', 'XX', 'No dividir el literal en varias lineas');
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  030101, 'ES', 'es', 'No dividir el literal en varias lineas');




-- -------------------------------------------------------------------
-- Grupo: CODIGO COBOL
-- Padre: 1 - Avisos sobre la codificacion
-- -------------------------------------------------------------------

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   4,  1, 1, 4, 'COB');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   4, 'XX', 'XX', 'Codigo COBOL');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   4, 'ES', 'es', 'Codigo COBOL');

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   5,  1, 1, 3, 'SQL');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   5, 'XX', 'XX', 'Codigo SQL');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   5, 'ES', 'es', 'Codigo SQL');

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   6,  1, 1, 3, 'CIC');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   6, 'XX', 'XX', 'Codigo CICS');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   6, 'ES', 'es', 'Codigo CICS');







INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (  12,  1206, 1, 0, 'REPLACE', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
                VALUES (  1206,   120601,      1,        3,    1,          1,    'REPLACE', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                     VALUES (  120601, 'XX', 'XX', 'No esta permitido el uso de la sentencia REPLACE');


INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idName)  VALUES (  14,  1, 1, 'IDENTIFICATION');
INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)     VALUES (  14, 'XX', 'XX', 'Controles de IDENTIFICATION DIVISION');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms)  VALUES (     14,    1401, 1, 0, 'DATE-WRITTEN', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
                VALUES (  1401,   140101,      1,        2,    1,          1,    'DATE-WRITTEN', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                      VALUES ( 140101, 'XX', 'XX', 'No es necesario indicar DATE-WRITTEN');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms)  VALUES (     14,    1402, 1, 0, 'DATE-COMPILED', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
                VALUES (  1402,   140201,      1,        2,    1,          1,    'DATE-COMPILED', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                      VALUES ( 140201, 'XX', 'XX', 'No es necesario indicar DATE-COMPILED');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms)  VALUES (     14,    1403, 1, 0, 'AUTHOR', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
                VALUES (  1403,   140301,      1,        3,    1,          0,    'AUTHOR', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                      VALUES ( 140301, 'XX', 'XX', 'Es necesario indicar la sentencia AUTHOR');

INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
                VALUES (  1403,   140302,      1,        3,    4,          3,    '1', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                      VALUES ( 140302, 'XX', 'XX', 'Es necesario indicar AUTHOR');

INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
                VALUES (  1404,   140401,      1,        4,    9,          2,    'NAME', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                      VALUES ( 140401, 'XX', 'XX', 'Es nombre del programa es diferente del nombre del miembro');



-- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 2,  0);
-- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   2, 'XX', 'XX', 'Programa');
-- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 3,  0);
-- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   3, 'XX', 'XX', 'COPYS e INCLUDES');
-- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 4,  0);
-- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   4, 'XX', 'XX', 'Variables');
-- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 5,  0);
-- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   5, 'XX', 'XX', 'Bloques de codigo');
-- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 6,  0);
-- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   6, 'XX', 'XX', 'Parrafos y secciones');
-- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 7,  0);
-- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   7, 'XX', 'XX', 'Sentencias');
-- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 8,  0);
-- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   8, 'XX', 'XX', 'SQL');
-- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 9,  0);
-- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   9, 'XX', 'XX', 'CICS');
-- 
-- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 101,  1);
-- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES ( 101, 'XX', 'XX', 'Comentarios');
-- 
-- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 102,  1);
-- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES ( 102, 'XX', 'XX', 'Estructura');
-- -- Issues a nivel codigo (Codigo 0)
-- 
-- INSERT INTO RUL_ISSUES      (idItem , idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 102001,  10200107, 1, 4, 1, 'SOURCE-COMPUTER', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (  10200107, 'XX', 'XX', 'No es necesario indicar SOURCE-COMPUTER');
-- INSERT INTO RUL_ISSUES      (idItem , idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 102001,  10200108, 1, 4, 0, 'SOURCE-COMPUTER', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (  10200108, 'XX', 'XX', 'Es necesario indicar SOURCE-COMPUTER');
-- 
-- INSERT INTO RUL_ISSUES      (idItem , idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 102001,  10200109, 1, 4, 1, 'OBJECT-COMPUTER', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (  10200109, 'XX', 'XX', 'No es necesario indicar OBJECT-COMPUTER');
-- INSERT INTO RUL_ISSUES      (idItem , idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 102001,  10200110, 1, 4, 0, 'OBJECT-COMPUTER', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (  10200110, 'XX', 'XX', 'Es necesario indicar OBJECT-COMPUTER');
-- 
-- -- Issues a nivel codigo (Codigo 0)
-- INSERT INTO RUL_ITEMS       (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (   1,  1001, 1, 50001, '', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_ISSUES      (idItem , idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 1001,  1, 1, 4, 1, '', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (   100101, 'XX', 'XX', 'Uso de directivas de compilacion en el codigo');
-- 
-- 
-- 
-- INSERT INTO RUL_ITEMS       (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (   1,  1005, 1, 50005, '', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_ISSUES      (idItem,  idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 1005, 1, 1, 4, 1, '', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES ( 10100501, 'XX', 'XX', 'No usar caracteres no imprimibles');
-- 
-- 




-- INSERT INTO RUL_ISSUES      (idItem, idIssue, severity, comparador, tipo, valor, cdgMsg) VALUES ( 1, 1010, 4, 0,   'N/A' , 10);
-- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (  10, 'XX', 'XX', 'Las divisiones deben ser explicitas en el modulo fuente');




-- INSERT INTO RUL_ISSUES      (idGroup, idIssue, severity, comparador, tipo, valor, cdgMsg) VALUES ( 0,    1, 4, 0,   'N/A' , 1);
-- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES ( 1, 'XX', 'XX', 'El nombre del modulo es diferente del archivo fuente');


-- INSERT INTO RUL_ISSUES      (idGroup, idIssue, severity, comparador, tipo, valor, cdgMsg) VALUES ( 2,  2001, 4, 0,   'N/A' , 2001);
-- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES ( 2001, 'XX', 'XX', 'No se recomienda el uso de REPLACING');

-- INSERT INTO RUL_ISSUES      (idGroup, idIssue, severity, comparador, tipo, valor, cdgMsg) VALUES ( 2,  2002, 4, 0,   'N/A' , 2002);
-- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES ( 2002, 'XX', 'XX', 'No se recomienda el uso de SUPRESS');

-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 0,   10, 5, 1,    '75' , 'Nivel de cobertura de codigo');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 0,   11, 5, 1,    '75' , 'Nivel de complejidad ciclomatica total');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 0,   12, 5, 1,  '1000' , 'Maximo numero de lineas de codigo');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 0,   13, 5, 1,  '1000' , 'Maximo numero de parrafos');
-- 
-- 
-- -- Issues a nivel variable
-- 
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 1001, 2, 0, 'N/A' , 'Variable no utilizada');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 1002, 1, 0, 'N/A' , 'Variable no utilizada');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 1003, 0, 0, 'N/A' , 'Variable leida');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 1004, 0, 0, 'N/A' , 'Variable escrita');
-- 
-- -- Issues a nivel copy
-- 
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 2, 2001, 2, 0, 'N/A' , 'La COPY deberia ser de nivel 01');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2002, 1, 0, 'N/A' , 'La COPY no deberia ser de nivel 01');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2003, 0, 0, 'N/A' , 'La COPY no deberia contener niveles 77');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2004, 0, 0, 'N/A' , 'La COPY no deberia tener mas de un grupo de variables');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2005, 0, 0, 'N/A' , 'La COPY deberia ser un parrafo');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2006, 0, 0, 'N/A' , 'No se deberian utilizar Copybooks de codigo');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2007, 0, 0, 'N/A' , 'Un Copybook no debe incluir otro Copybook');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2008, 0, 0, 'N/A' , 'COPY no utilizada');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2009, 0, 0, 'N/A' , 'COPY con variables no utilizadas');
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2010, 0, 0, 'N/A' , 'No se permite usar REPLACING');
-- 
-- 
-- -- Issues a nivel modulo
-- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 5, 1004, 0, 0, 'N/A' , 'Variable escrita');
-- 
-- DELETE FROM RUL_RULES;
-- 
-- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0,  1, 10, 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0,  2, 10, 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0,  3, 10, 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0,  4,  5, 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0,  5,  0, 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0, 99, 50, 'SYSTEM', CURRENT_TIMESTAMP);

COMMIT;