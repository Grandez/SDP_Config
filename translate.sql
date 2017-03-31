USE SDP;

DELETE FROM CFG_TRANSLATE;

-- Codigos generales

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'SDP' ,  0 ,  'No'             );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'SDP' ,  1 ,  'Yes'            );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'ES' , 'SDP' ,  0 ,  'No'             );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'ES' , 'SDP' ,  1 ,  'Si'             );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.estado' ,  0 ,  'No info'             );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.estado' ,  1 ,  'Completo'            );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.estado' ,  2 ,  'Parcial'             );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.estado' ,  3 ,  'Parcial sin dudas'   );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.estado' , 10 ,  'Solo CICS'           );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.estado' , 80 ,  'Ignorado'            );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.estado' , 90 ,  'Incorrecto'          );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.estado' , 91 ,  'Codigo no soportado' );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.estado' , 95 ,  'Eror de analisis'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.estado' , 99 ,  'ERROR'               );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.missing' ,  0 ,  'Completo'          );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.missing' ,  1 ,  'Incompleto'        );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.missing' ,  2 ,  'Erroneas'          );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.copys' ,  0 ,  'Completo'            );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.copys' ,  1 ,  'Incompleto'          );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.copys' ,  2 ,  'COPYs Ignoradas'     );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.copys' ,  3 ,  'COPYs Erroneas'      );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.tipo'  ,  0 ,  'No identificado'     );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.tipo'  ,  1 ,  'Programa'            );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.tipo'  ,  2 ,  'COPY'                );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_VERSIONES.tipo'  ,  3 ,  'INCLUDE'             );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.fichero'  , 254 ,  'Bool'      );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.sgdb'     , 254 ,  'Bool'      );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.cics'     , 254 ,  'Bool'      );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.mq'       , 254 ,  'Bool'      );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.dynam'    , 254 ,  'Bool'      );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.ts'       , 254 ,  'Bool'      );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.dinamico' , 254 ,  'Bool'      );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.callsMode   ' ,255 ,  'Mask'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.callsMode   ' ,  0 ,  'No'      );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.callsMode   ' ,  1 ,  'CALL'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.callsMode   ' ,  2 ,  'LINK'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.callsMode   ' ,  4 ,  'XCTL'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.callsMode   ' ,  8 ,  'TRAN'    );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.callsType   ' ,255 ,  'Mask'     );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.callsType   ' ,  0 ,  'No'       );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.callsType   ' ,  1 ,  'Estatico' );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_SUMMARY.callsType   ' ,  2 ,  'Dinamico' );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.tipo    ' ,255 ,  'Mask'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.tipo    ' ,  1 ,  'CALL'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.tipo    ' ,  2 ,  'LINK'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.tipo    ' ,  4 ,  'XCTL'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.tipo    ' ,  8 ,  'TRAN'    );
                                                                                                                   
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.mode    ' ,  1 ,  'Estatico'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.mode    ' ,  2 ,  'Dinamico'    );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.status    ' ,  0 ,  'No identificado'  );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.status    ' ,  1 ,  'Variable'         );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.status    ' ,  2 ,  'Declarada'        );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.status    ' ,  4 ,  'Manual'           );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.status    ' ,  8 ,  'Verificada'       );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.status    ' , 16 ,  'Sin info.'        );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_CALLS.metodo    ' , 253 ,  'MOD_SUMMARY.callsMode'  );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'CALLED.STATUS       ' , 253 , 'MOD_CALLS.status'  );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'CALLED.MODE         ' , 253,  'MOD_CALLS.modo'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'CALLED.METHOD       ' , 253,  'MOD_SUMMARY.callsMode'  );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'TREE.STATUS         ' , 253,  'Sin informacion'   );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'TREE.MODE           ' , 253,  'MOD_CALLS.modo'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'TREE.METHOD         ' , 253,  'MOD_SUMMARY.callsMode'  );


INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.tipo    ' ,  0 ,  'No identificado'  );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.tipo    ' ,  1 ,  'COPY'             );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.tipo    ' ,  2 ,  'INCLUDE'          );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.tipo    ' ,  4 ,  'Modulo'           );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.tipo    ' ,  8 ,  'Transaccion'      );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.subTipo ' ,  0 ,  'General'          );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.subTipo ' ,  1 ,  'Variables'        );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.subTipo ' ,  2 ,  'Linkage'          );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.subTipo ' ,  5 ,  'Codigo'           );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.subTipo ' , 10 ,  'Fichero'          );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.subTipo ' , 11 ,  'Registro'         );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.subTipo ' , 20 ,  'Tabla'            );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.subTipo ' , 21 ,  'Cursor'           );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.subTipo ' , 22 ,  'Statement'        );

INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.Estado  ' ,  0 ,  'Analizado'        );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.Estado  ' ,  1 ,  'No disponible'    );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.Estado  ' ,  2 ,  'Ignorado'         );
INSERT INTO CFG_TRANSLATE (lang, idField , idValue , msg) VALUES ( 'XX' , 'MOD_COPYS.Estado  ' ,  3 ,  'Erroeno'          );


COMMIT;

