USE SDP;

DELETE FROM SDP_DEPENDENCIAS;


INSERT INTO SDP_DEPENDENCIAS (modulo, variable , called , uid, tms) VALUES ( 'IVP20040' , 'IVPNORUT' ,  'IVP20002' ,  'IVP' , CURRENT_TIMESTAMP  );
INSERT INTO SDP_DEPENDENCIAS (modulo, variable , called , uid, tms) VALUES ( 'IVP20041' , 'IVPNORUT' ,  'IVP20001' ,  'IVP' , CURRENT_TIMESTAMP  );
INSERT INTO SDP_DEPENDENCIAS (modulo, variable , called , uid, tms) VALUES ( 'IVP20041' , 'IVPNORUT' ,  'IVP20002' ,  'IVP' , CURRENT_TIMESTAMP  );
INSERT INTO SDP_DEPENDENCIAS (modulo, variable , called , uid, tms) VALUES ( 'IVP20042' , 'IVPNORU0' ,  'IVP20001' ,  'IVP' , CURRENT_TIMESTAMP  );
INSERT INTO SDP_DEPENDENCIAS (modulo, variable , called , uid, tms) VALUES ( 'IVP20042' , 'IVPNORU0' ,  'IVP20002' ,  'IVP' , CURRENT_TIMESTAMP  );


COMMIT;

