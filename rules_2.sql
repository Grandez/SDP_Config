USE SDP;

UPDATE RUL_RULES  SET activo = 0 WHERE idGroup = 2 AND idItem = 1 AND idRule = 1;

COMMIT;