SELECT COUNT(*) as cics FROM mod_versiones where cics = 1;
SELECT COUNT(*) as mq FROM mod_versiones where mq = 1;
SELECT COUNT(*) as sgdb FROM mod_versiones where sgdb = 1;

SELECT COUNT(*) as nada    FROM mod_versiones where cics = 0 and sgdb = 0 and mq = 0;
SELECT COUNT(*) as mq      FROM mod_versiones where cics = 0 and sgdb = 0 and mq = 1;
SELECT COUNT(*) as db      FROM mod_versiones where cics = 0 and sgdb = 1 and mq = 0;
SELECT COUNT(*) as db_mq   FROM mod_versiones where cics = 0 and sgdb = 1 and mq = 1;
SELECT COUNT(*) as cics    FROM mod_versiones where cics = 1 and sgdb = 0 and mq = 0;
SELECT COUNT(*) as cics_mq FROM mod_versiones where cics = 1 and sgdb = 0 and mq = 1;
SELECT COUNT(*) as cics_db FROM mod_versiones where cics = 1 and sgdb = 1 and mq = 0;
SELECT COUNT(*) as todo    FROM mod_versiones where cics = 1 and sgdb = 1 and mq = 1;
