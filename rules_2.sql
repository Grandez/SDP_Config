USE SDP;

UPDATE RUL_RULES  SET activo = 0 WHERE idGroup =  2 AND idItem = 1 AND idRule = 1;
UPDATE RUL_RULES  SET activo = 0 WHERE idGroup = 21 AND idItem = 1 AND idRule = 2;
UPDATE RUL_RULES  SET activo = 0 WHERE idGroup = 21 AND idItem = 1 AND idRule = 3;
UPDATE RUL_RULES  SET activo = 0 WHERE idGroup = 21 AND idItem = 1 AND idRule = 4;
COMMIT;