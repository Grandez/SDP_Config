USE SDP;

UPDATE RUL_ITEMS  SET activo = 0 WHERE idGroup = 2 and idItem = 1;

COMMIT;