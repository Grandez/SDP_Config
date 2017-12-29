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
-- 5 - Metodo (Se invoca a un metodo)
-- 6 - Expresion matematica
-- 7 - Valor

-- 9 - Especial/manual

-- Comparador
-- Si es mayor de 100, es la negacion
--  0 - Debe existir
-- El comparador =, >, < va por mascara
--  1 - Igual
--  2 - Mayor
--  4 - Menor
--  7 - Comienza
--  8 - Acaba
--  9 - Contiene
-- 10 - Match

-- -------------------------------------------------------------------

USE SDP;

-- -------------------------------------------------------------------
-- Los mensajes se corresponden con las claves numericas
-- -------------------------------------------------------------------

DELETE FROM RUL_GROUPS;
DELETE FROM RUL_ITEMS;
DELETE FROM RUL_RULES;
DELETE FROM RUL_DESC;
DELETE FROM RUL_CONDS;
DELETE FROM RUL_FORMULAS ;

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   1,  0, 100, 1, 'COM');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)             VALUES ( 100, 'xx', 'xx', 'Raiz');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)             VALUES ( 100, 'ES', 'es', 'Raiz');

-- -------------------------------------------------------------------
-- Grupo: 2 - Codigo fuente
-- Padre: 1 
-- Avisos que tiene que ver con el editor y la codificacion
-- Se chequean directamente en el analisis
-- -------------------------------------------------------------------

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   2,  1, 0, 200, 'LEX');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES ( 200, 'xx', 'XX', 'Codigo escrito');

INSERT INTO RUL_ITEMS  (idGroup, idItem, idDesc, activo,  clave, uid, tms) 
            VALUES     (      2,      1,      0,      1,  'TAB', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
                VALUES (      2,      1,        1,   20101,      0,        0,        2,    1,        100,    ' ',        0,   'SYSTEM', CURRENT_TIMESTAMP);
                
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES (  20101, 'xx', 'XX', 'No usar caracteres de tabulacion');

INSERT INTO RUL_ITEMS  (idGroup, idItem, idDesc, activo,  clave, uid, tms) 
            VALUES     (      2,      2,      0,      1,  'HEX', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
            VALUES     (      2,      2,       1,   210201,      0,        0,        2,    1,        100,    ' ',        0,   'SYSTEM', CURRENT_TIMESTAMP);
                
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES (  210201, 'xx', 'XX', 'Usar la codificacion hexadecimal para los caracteres no imprimibles');


-- -------------------------------------------------------------------
-- Grupo: 21 - COMENTARIOS
-- Padre:  2 - Analizador Lexico
-- -------------------------------------------------------------------

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  
            VALUES     (     21,        2,      0,     21, 'CMT');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)             VALUES (  21, 'xx', 'XX', 'Comentarios');

INSERT INTO RUL_ITEMS  (idGroup, idItem,  idDesc, activo,   clave, uid,      tms) 
            VALUES     (     21,      1,       0,      0,   'CMT', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,     idDesc, activo, priority, severity, tipo, comparador,  valor, uid,      tms) 
            VALUES     (     21,      1,       1,     210101,      0,        1,        3,    1,          7,    '*', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES (  210101, 'xx', 'XX', 'Los comentarios {comparador} {valor}');

INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,     idDesc, activo, priority, severity, tipo, propiedad, comparador,  valor, uid,      tms) 
            VALUES     (     21,      1,       4,     210104,      1,        0,        3,    5,  210104,          2,    '1', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES (  210104, 'xx', 'XX', 'No se deben crear lineas de comentarios aislados');
INSERT INTO RUL_FORMULAS (idFormula, idType, idSeq, formula)
            VALUES       (210104,         0,     0, 'Line.length()');
INSERT INTO RUL_FORMULAS (idFormula, idType, idSeq, formula)
            VALUES       (210104,         0,     1, 'Length');


-- -------------------------------------------------------------------
-- Grupo: 22 - Directivas de compilacion
-- Padre:  2 - Analizador Lexico
-- -------------------------------------------------------------------

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  
            VALUES     (     22,        2,      0,     22, 'CBL');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)             VALUES (  22, 'xx', 'XX', 'Directivas de compilacion');

INSERT INTO RUL_ITEMS  (idGroup, idItem, idDesc, activo,  clave, uid, tms) 
            VALUES     (     22,      1,      0,      0,  'CBL', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
                VALUES (     22,      1,        1,  220101,      0,        0,        5,    1,        101,    ' ',        0,   'SYSTEM', CURRENT_TIMESTAMP);
                
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES ( 220101, 'xx', 'XX', 'No usar directivas de compilacion en codigo');

INSERT INTO RUL_ITEMS  (idGroup, idItem, idDesc, activo,  clave, uid, tms) 
            VALUES     (     22,      2,      0,      0,  'EJECT', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
                VALUES (     22,      2,        1,  220201,      0,        0,        4,    1,        101,    ' ',        0,   'SYSTEM', CURRENT_TIMESTAMP);
                
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES ( 220201, 'xx', 'XX', 'No usar directivas de compilacion en codigo');

INSERT INTO RUL_ITEMS  (idGroup, idItem, idDesc, activo,  clave, uid, tms) 
            VALUES     (     22,      3,      0,      0,  'SKIP', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
                VALUES (     22,      3,        1,  220301,      0,        0,        4,    1,        101,    ' ',        0,   'SYSTEM', CURRENT_TIMESTAMP);
                
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES ( 220301, 'xx', 'XX', 'No usar directivas de compilacion en codigo');

-- -------------------------------------------------------------------
-- Grupo:  9 - Modulo completo
-- Padre:  1 - Raiz
-- -------------------------------------------------------------------


INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   9,  1, 0, 90000, 'SQA');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (   90000, 'xx', 'XX', 'Calidad');


-- -------------------------------------------------------------------
-- Grupo: 91 - Control de numero de issues por severidad
--           - Se gestiona de manera independiente
-- Padre:  9 - Modulo
-- -------------------------------------------------------------------

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (  91,  9, 0, 91, 'RUL');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  91, 'xx', 'XX', 'Issues');

INSERT INTO RUL_ITEMS  (idGroup, idItem, idDesc, activo,  clave, uid, tms) 
            VALUES     (     91,      1,      0,      0,  'RULES', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
                VALUES (     91,      1,       0,   910100,      0,        0,        5,    7,      102,    '6',        0,   'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
                VALUES (     91,      1,       1,   910100,      0,        0,        5,    7,      102,    '5',        0,   'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
                VALUES (     91,      1,       2,   910100,      0,        0,        5,    7,      102,    '4',        0,   'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
                VALUES (     91,      1,       3,   910100,      0,        0,        5,    7,      102,    '3',        0,   'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
                VALUES (     91,      1,       4,   910100,      0,        0,        5,    7,      102,    '2',        0,   'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
                VALUES (     91,      1,       5,   910100,      0,        0,        5,    7,      102,    '1',        0,   'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, propiedad, comparador,  valor, idSample,   uid,      tms) 
                VALUES (     91,      1,      99,   910199,      0,        0,        5,    6,    910199,        102,    '3',        0,   'SYSTEM', CURRENT_TIMESTAMP);
                
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES (  910100, 'xx', 'XX', 'El numero maximo de incidencias de nivel {IdRule} {Comparador} {Valor}');
INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES (  910199, 'xx', 'XX', 'El resultado de aplicar la formula {Propiedad} {Comparador} {Valor}');

INSERT INTO RUL_FORMULAS (idFormula, idType, idSeq, formula)
            VALUES       (910199,         1,     0, 'Formula1');
INSERT INTO RUL_FORMULAS (idFormula, idType, idSeq, formula)
            VALUES       (910199,         1,     1, 'SUM({IssuesCounts} * ({IssuesLevels} + 1)) / (1 + SUM({IssuesCounts}))');

-- -------------------------------------------------------------------
-- Grupo: 92 - Control de mantenibilidad etc
--           - Se gestiona de manera independiente
-- Padre:  9 - Modulo
-- -------------------------------------------------------------------

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (  92,  9, 0, 92, 'MNT');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  92, 'xx', 'XX', 'Mantenibilidad');

INSERT INTO RUL_ITEMS  (idGroup, idItem, idDesc, activo,   clave,  uid, tms) 
            VALUES     (     92,      1,      0,      0,  'MANT', 'SYSTEM', CURRENT_TIMESTAMP);

-- -------------------------------------------------------------------
-- Grupo: 93 - Control de cobertura de codigo
--           - Se gestiona de manera independiente
-- Padre:  9 - Modulo
-- -------------------------------------------------------------------

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (  93,  9, 0, 93, 'COV');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  93, 'xx', 'XX', 'Cobertura');

INSERT INTO RUL_ITEMS  (idGroup, idItem, idDesc, activo,   clave,  uid, tms) 
            VALUES     (     93,      1,      0,      0,  'COV', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor, idSample,   uid,      tms) 
            VALUES     (     93,      1,       1,   910101,      0,        0,        5,    7,          4,    '80',        0,   'SYSTEM', CURRENT_TIMESTAMP);

INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES (  930101, 'xx', 'XX', 'Porcentaje minimo de codigo que debe ser ejecutado');

-- -------------------------------------------------------------------
-- Grupo: 95 - Control de nombre del modulo
-- Padre:  9 - Modulo
-- -------------------------------------------------------------------

INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (  95,  9, 0, 95, 'NAM');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  95, 'xx', 'XX', 'Nomenclatura');

INSERT INTO RUL_ITEMS  (idGroup, idItem, idDesc,   activo,    clave,  uid, tms) 
            VALUES     (     95,      1,      0,     9501,  'NAM', 'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_CONDS  (idCond,   idDesc, tipo, comparador,  valor, propiedad, idSample,   uid,      tms) 
            VALUES     (  9501,   950101, 7,          1,       '1',      9501,       0,   'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_FORMULAS (idFormula, idType, idSeq, formula)
            VALUES       (9501,           0,     0, 'Module.hasOnlyCobol()');
INSERT INTO RUL_FORMULAS (idFormula, idType, idSeq, formula)
            VALUES       (9501,           0,     1, 'hasOnlyCobol');
            

INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor,            idSample,   uid,      tms) 
            VALUES     (     95,      1,       1,   950101,      0,        0,        4,    7,         10,   '^[A-Z0-9]{3}M',        0,   'SYSTEM', CURRENT_TIMESTAMP);

INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES (  950101, 'xx', 'XX', 'El nombre del modulo debe seguir las condiciones establecidas');

INSERT INTO RUL_ITEMS  (idGroup, idItem, idDesc, activo,   clave,  uid, tms) 
            VALUES     (     95,      2,      0, 950201,   'NAM', 'SYSTEM', CURRENT_TIMESTAMP);
            
INSERT INTO RUL_CONDS    (idCond,   idDesc, tipo, comparador,  valor, propiedad, idSample,   uid,      tms) 
            VALUES       (950201,   950201,    7,          1,    '1', 9502,       0,   'SYSTEM', CURRENT_TIMESTAMP);
INSERT INTO RUL_FORMULAS (idFormula, idType, idSeq, formula)
            VALUES       (9502,           0,     0, 'Module.hasDB2()');
INSERT INTO RUL_FORMULAS (idFormula, idType, idSeq, formula)
            VALUES       (9502,           0,     1, 'hasDB2');

INSERT INTO RUL_RULES  (idGroup, idItem,  idRule,   idDesc, activo, priority, severity, tipo, comparador,  valor,            idSample,   uid,      tms) 
            VALUES     (     95,      2,       1,   950201,      0,        0,        4,    7,         10,   '^[A-Z0-9]{3}D',        0,   'SYSTEM', CURRENT_TIMESTAMP);

INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, txt) VALUES (  950201, 'xx', 'XX', 'Si el modulo contiene DB2 ni CICS debe contener la letra M en la cuarta posicion');

-- 
-- INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (  2,   203, 1, 0, 'EJECT', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor,        uid,      tms) 
--                 VALUES (  0203,   020301,      1,    0,        2,    1,          0,  'EJECT',      'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020301, 'xx', 'xx', 'No es necesario imprimir el codigo');
-- INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020301, 'ES', 'es', 'No es necesario imprimir el codigo');
-- 
-- INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (  2,   204, 1, 0, 'SKIP', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor,                   uid,      tms) 
--                 VALUES (  0204,   020401,      1,    0,        2,    1,          0,  'SKIP',                  'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020401, 'xx', 'xx', 'No es necesario imprimir el codigo');
-- INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020401, 'ES', 'es', 'No es necesario imprimir el codigo');
-- 
-- INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (  2,   205, 1, 0, 'DIRECTIVE', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor,                        uid,      tms) 
--                 VALUES (  0205,   020501,      1,    0,        2,    1,          0,  'DIRECTIVE',                  'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020401, 'xx', 'xx', 'No se pueden usar directivas de compilacion en el codigo');
-- INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  020401, 'ES', 'es', 'No se pueden usar directivas de compilacion en el codigo');
-- 
-- 
-- 
-- -- -------------------------------------------------------------------
-- -- Grupo: PROGRAMA
-- -- Padre: 1 - Avisos sobre el programa en global
-- -- -------------------------------------------------------------------
-- 
-- INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   3,  1, 1, 3, 'COB');
-- INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg)            VALUES (   3, 'xx', 'xx', 'Programa');
-- INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg)            VALUES (   3, 'ES', 'es', 'Programa');
-- 
-- INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (  3,   301, 1, 0, '-',         'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, prty, severity, tipo, comparador,  valor,                        uid,      tms) 
--                 VALUES (  0301,   030101,      1,    0,        3,    1,          0,  '-'                           'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  030101, 'xx', 'xx', 'No dividir el literal en varias lineas');
-- INSERT INTO RUL_DESC   (idDesc,  idLang, idDialect, msg) VALUES (  030101, 'ES', 'es', 'No dividir el literal en varias lineas');
-- 
-- 
-- 
-- 
-- -- -------------------------------------------------------------------
-- -- Grupo: CODIGO COBOL
-- -- Padre: 1 - Avisos sobre la codificacion
-- -- -------------------------------------------------------------------
-- 
-- INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   4,  1, 1, 4, 'COB');
-- INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   4, 'xx', 'xx', 'Codigo COBOL');
-- INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   4, 'ES', 'es', 'Codigo COBOL');
-- 
-- INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   5,  1, 1, 3, 'SQL');
-- INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   5, 'xx', 'xx', 'Codigo SQL');
-- INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   5, 'ES', 'es', 'Codigo SQL');
-- 
-- INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idDesc, prefix)  VALUES (   6,  1, 1, 3, 'CIC');
-- INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   6, 'xx', 'xx', 'Codigo CICS');
-- INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, msg)             VALUES (   6, 'ES', 'es', 'Codigo CICS');
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (  12,  1206, 1, 0, 'REPLACE', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
--                 VALUES (  1206,   120601,      1,        3,    1,          1,    'REPLACE', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                     VALUES (  120601, 'xx', 'xx', 'No esta permitido el uso de la sentencia REPLACE');
-- 
-- 
-- INSERT INTO RUL_GROUPS (idGroup, idParent, activo, idName)  VALUES (  14,  1, 1, 'IDENTIFICATION');
-- INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)     VALUES (  14, 'xx', 'xx', 'Controles de IDENTIFICATION DIVISION');
-- 
-- INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms)  VALUES (     14,    1401, 1, 0, 'DATE-WRITTEN', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
--                 VALUES (  1401,   140101,      1,        2,    1,          1,    'DATE-WRITTEN', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                      VALUES ( 140101, 'xx', 'xx', 'No es necesario indicar DATE-WRITTEN');
-- 
-- INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms)  VALUES (     14,    1402, 1, 0, 'DATE-COMPILED', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
--                 VALUES (  1402,   140201,      1,        2,    1,          1,    'DATE-COMPILED', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                      VALUES ( 140201, 'xx', 'xx', 'No es necesario indicar DATE-COMPILED');
-- 
-- INSERT INTO RUL_ITEMS  (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms)  VALUES (     14,    1403, 1, 0, 'AUTHOR', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
--                 VALUES (  1403,   140301,      1,        3,    1,          0,    'AUTHOR', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                      VALUES ( 140301, 'xx', 'xx', 'Es necesario indicar la sentencia AUTHOR');
-- 
-- INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
--                 VALUES (  1403,   140302,      1,        3,    4,          3,    '1', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                      VALUES ( 140302, 'xx', 'xx', 'Es necesario indicar AUTHOR');
-- 
-- INSERT INTO RUL_ISSUES (idItem,  idIssue, activo, severity, tipo, comparador,   valor, uid, tms) 
--                 VALUES (  1404,   140401,      1,        4,    9,          2,    'NAME', 'SYSTEM', CURRENT_TIMESTAMP);
-- INSERT INTO RUL_DESC   (cdgMsg, idLang, idDialect, msg)                      VALUES ( 140401, 'xx', 'xx', 'Es nombre del programa es diferente del nombre del miembro');
-- 
-- 
-- 
-- -- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 2,  0);
-- -- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   2, 'xx', 'xx', 'Programa');
-- -- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 3,  0);
-- -- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   3, 'xx', 'xx', 'COPYS e INCLUDES');
-- -- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 4,  0);
-- -- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   4, 'xx', 'xx', 'Variables');
-- -- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 5,  0);
-- -- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   5, 'xx', 'xx', 'Bloques de codigo');
-- -- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 6,  0);
-- -- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   6, 'xx', 'xx', 'Parrafos y secciones');
-- -- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 7,  0);
-- -- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   7, 'xx', 'xx', 'Sentencias');
-- -- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 8,  0);
-- -- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   8, 'xx', 'xx', 'SQL');
-- -- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 9,  0);
-- -- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES (   9, 'xx', 'xx', 'CICS');
-- -- 
-- -- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 101,  1);
-- -- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES ( 101, 'xx', 'xx', 'Comentarios');
-- -- 
-- -- INSERT INTO RUL_GROUPS  (idGroup, idParent) VALUES ( 102,  1);
-- -- INSERT INTO RUL_DESC    (cdgMsg, idLang, idDialect, msg) VALUES ( 102, 'xx', 'xx', 'Estructura');
-- -- -- Issues a nivel codigo (Codigo 0)
-- -- 
-- -- INSERT INTO RUL_ISSUES      (idItem , idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 102001,  10200107, 1, 4, 1, 'SOURCE-COMPUTER', 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (  10200107, 'xx', 'xx', 'No es necesario indicar SOURCE-COMPUTER');
-- -- INSERT INTO RUL_ISSUES      (idItem , idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 102001,  10200108, 1, 4, 0, 'SOURCE-COMPUTER', 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (  10200108, 'xx', 'xx', 'Es necesario indicar SOURCE-COMPUTER');
-- -- 
-- -- INSERT INTO RUL_ISSUES      (idItem , idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 102001,  10200109, 1, 4, 1, 'OBJECT-COMPUTER', 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (  10200109, 'xx', 'xx', 'No es necesario indicar OBJECT-COMPUTER');
-- -- INSERT INTO RUL_ISSUES      (idItem , idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 102001,  10200110, 1, 4, 0, 'OBJECT-COMPUTER', 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (  10200110, 'xx', 'xx', 'Es necesario indicar OBJECT-COMPUTER');
-- -- 
-- -- -- Issues a nivel codigo (Codigo 0)
-- -- INSERT INTO RUL_ITEMS       (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (   1,  1001, 1, 50001, '', 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_ISSUES      (idItem , idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 1001,  1, 1, 4, 1, '', 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (   100101, 'xx', 'xx', 'Uso de directivas de compilacion en el codigo');
-- -- 
-- -- 
-- -- 
-- -- INSERT INTO RUL_ITEMS       (idGroup, idItem,  activo, keyNum, keyTxt, uid, tms) VALUES (   1,  1005, 1, 50005, '', 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_ISSUES      (idItem,  idIssue, activo, severity, comparador, tipo, valor, uid, tms) VALUES ( 1005, 1, 1, 4, 1, '', 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES ( 10100501, 'xx', 'xx', 'No usar caracteres no imprimibles');
-- -- 
-- -- 
-- 
-- 
-- 
-- 
-- -- INSERT INTO RUL_ISSUES      (idItem, idIssue, severity, comparador, tipo, valor, cdgMsg) VALUES ( 1, 1010, 4, 0,   'N/A' , 10);
-- -- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES (  10, 'xx', 'xx', 'Las divisiones deben ser explicitas en el modulo fuente');
-- 
-- 
-- 
-- 
-- -- INSERT INTO RUL_ISSUES      (idGroup, idIssue, severity, comparador, tipo, valor, cdgMsg) VALUES ( 0,    1, 4, 0,   'N/A' , 1);
-- -- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES ( 1, 'xx', 'xx', 'El nombre del modulo es diferente del archivo fuente');
-- 
-- 
-- -- INSERT INTO RUL_ISSUES      (idGroup, idIssue, severity, comparador, tipo, valor, cdgMsg) VALUES ( 2,  2001, 4, 0,   'N/A' , 2001);
-- -- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES ( 2001, 'xx', 'xx', 'No se recomienda el uso de REPLACING');
-- 
-- -- INSERT INTO RUL_ISSUES      (idGroup, idIssue, severity, comparador, tipo, valor, cdgMsg) VALUES ( 2,  2002, 4, 0,   'N/A' , 2002);
-- -- INSERT INTO RUL_DESC (cdgMsg, idLang, idDialect, msg) VALUES ( 2002, 'xx', 'xx', 'No se recomienda el uso de SUPRESS');
-- 
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 0,   10, 5, 1,    '75' , 'Nivel de cobertura de codigo');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 0,   11, 5, 1,    '75' , 'Nivel de complejidad ciclomatica total');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 0,   12, 5, 1,  '1000' , 'Maximo numero de lineas de codigo');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 0,   13, 5, 1,  '1000' , 'Maximo numero de parrafos');
-- -- 
-- -- 
-- -- -- Issues a nivel variable
-- -- 
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 1001, 2, 0, 'N/A' , 'Variable no utilizada');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 1002, 1, 0, 'N/A' , 'Variable no utilizada');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 1003, 0, 0, 'N/A' , 'Variable leida');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 1004, 0, 0, 'N/A' , 'Variable escrita');
-- -- 
-- -- -- Issues a nivel copy
-- -- 
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 2, 2001, 2, 0, 'N/A' , 'La COPY deberia ser de nivel 01');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2002, 1, 0, 'N/A' , 'La COPY no deberia ser de nivel 01');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2003, 0, 0, 'N/A' , 'La COPY no deberia contener niveles 77');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2004, 0, 0, 'N/A' , 'La COPY no deberia tener mas de un grupo de variables');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2005, 0, 0, 'N/A' , 'La COPY deberia ser un parrafo');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2006, 0, 0, 'N/A' , 'No se deberian utilizar Copybooks de codigo');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2007, 0, 0, 'N/A' , 'Un Copybook no debe incluir otro Copybook');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2008, 0, 0, 'N/A' , 'COPY no utilizada');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2009, 0, 0, 'N/A' , 'COPY con variables no utilizadas');
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 1, 2010, 0, 0, 'N/A' , 'No se permite usar REPLACING');
-- -- 
-- -- 
-- -- -- Issues a nivel modulo
-- -- INSERT INTO RUL_ISSUES (idGroup, idIssue, severity, comparador, tipo, valor, msg) VALUES ( 5, 1004, 0, 0, 'N/A' , 'Variable escrita');
-- -- 
-- -- DELETE FROM RUL_RULES;
-- -- 
-- -- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0,  1, 10, 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0,  2, 10, 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0,  3, 10, 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0,  4,  5, 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0,  5,  0, 'SYSTEM', CURRENT_TIMESTAMP);
-- -- INSERT INTO RUL_RULES (idGroup, severity, tipo, valor, uid, tms) VALUES ( 0, 99, 50, 'SYSTEM', CURRENT_TIMESTAMP);

-- Comparador
-- Si es mayor de 100, es la negacion
--  0 - Debe existir
-- El comparador =, >, < va por mascara
--  1 - Igual
--  2 - Mayor
--  4 - Menor
--  7 - Comienza
--  8 - Acaba
--  9 - Contiene
-- 10 - Match

INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  0, 'xx', 'XX', 'debe existir');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  1, 'xx', 'XX', 'debe ser igual a');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  2, 'xx', 'XX', 'debe ser mayor que');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  3, 'xx', 'XX', 'debe ser mayor o igual a');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  4, 'xx', 'XX', 'debe ser menor de');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  5, 'xx', 'XX', 'debe menor o igual a');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  7, 'xx', 'XX', 'debe comenzar por');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  8, 'xx', 'XX', 'debe acabar con');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES (  9, 'xx', 'XX', 'debe contener');
INSERT INTO RUL_DESC   (idDesc, idLang, idDialect, txt)      VALUES ( 10, 'xx', 'XX', 'debe expresarse como');
COMMIT;