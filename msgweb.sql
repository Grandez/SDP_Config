USE SDP;

DELETE FROM WEB_MESSAGES;

INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'AUTOR','Javier González Grández (2015)'                                                                 );

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- COMMON
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'PERIOD_ALL'                       ,'Todo'                                                               );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'PERIOD_TODAY'                     ,'Hoy'                                                                );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'PERIOD_WEEK'                      ,'Semana'                                                             );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'PERIOD_FORTHNIGHT'                ,'Quincena'                                                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'PERIOD_MONTH'                     ,'Mes'                                                                );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'PERIOD_QUARTER'                   ,'Trimestre'                                                          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'PERIOD_SEMESTER'                  ,'Semestre'                                                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'PERIOD_YEAR'                      ,'Año'                                                                );

 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
 -- AREA
 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 



INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'TITLE_RESUMEN','Resumen'                                                            );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'TITLE_EJECUCION','Estadísticas de ejecución'                                        );

-- Alertas
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'ALERT_TITLE'                           ,'Alertas'                                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'ALERT_ABENDS'                          ,'Aplicaciones Erroneas'                     );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'ALERT_TIME_ELAPSED'                    ,'Exceso en tiempo de respuesta'             );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'ALERT_TIME_CPU'                        ,'Exceso en tiempo de CPU'                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'ALERT_TIME_SUS'                        ,'Exceso en tiempo Suspend'                  );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'ALERT_MEDIA_OUT'                       ,'Modulos fuera de su media'                 );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'ALERT_FILTRO'                          ,'Pulsar para aplicar filtro'                );

-- Stadisticas
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'STATS_TITLE'                           ,'Estadisticas'                              ); 
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'STATS_APPL'                            ,'Subaplicaciones'                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'STATS_MODULES'                         ,'Modulos'                                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'STATS_MONITOR'                         ,'Modulos monitorizados'                     );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'STATS_VARIATION'                       ,'Variación'                                 );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'STATS_EXECUTION'                       ,'Ejecuciones'                               );

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- MODULO
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- DESCRIPTION
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_DESCRIPTION'                  , 'Descripcion'                                   );

-- RESUMEN
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_SUMM_TITLE'                   ,'Resumen'                                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_SUMM_MEMBER'                  ,'Miembro'                                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_SUMM_NAME'                    ,'Nombre'                                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_SUMM_AUTHOR'                  ,'Autor'                                          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_SUMM_DATE'                    ,'Ultima compilacion'                             );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_SUMM_USER'                    ,'Usuario'                                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_SUMM_VERSIONS'                ,'Versiones'                                      );

-- COMENTARIOS
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_CMT_TITLE'                    ,'Comentarios'                            );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_CMT_CMT'                      ,'Lineas comentadas'                      );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_CMT_BLANKS'                   ,'Lineas en blanco'                       );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_CMT_BLOCKS'                   ,'Bloque de documentacion'                );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_CMT_DECORATORS'               ,'Decoradores'                            );

-- COMENTARIOS
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_VERB_TITLE'                    ,'Sentencias'                      );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_VERB_DATA'                     ,'Manejo de datos'                 );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_VERB_CTRL'                     ,'Control'                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_VERB_IO'                       ,'Entrada/Salida'                  );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_VERB_ARIT'                     ,'Aritmeticas'                     );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_VERB_FLOW'                     ,'Control de flujo'                );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_VERB_LANG'                     ,'COBOL'                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_VERB_CICS'                     ,'CICS'                            );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_VERB_SQL'                      ,'SQL / DB2'                       );

-- ATRIBUTOS
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ATTR_TITLE'                   ,'Atributos'                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ATTR_MAIN'                    ,'Modulo principal'                 );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ATTR_CICS'                    ,'CICS'                             );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ATTR_SQL'                     ,'DB2'                              );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ATTR_MQ'                      ,'MQ'                               );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ATTR_FILE'                    ,'Fichero'                          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ATTR_MODS'                    ,'Subrutinas'                       );

-- SQALE

INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_SQALE_TITLE'                  ,'Indicadores'                     );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ALE_REUSE'                    ,'Reusabilidad'                    );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ALE_MANT'                     ,'Mantenibilidad'                  );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ALE_EFICCIENCY'               ,'Eficiencia'                      );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ALE_ACCURACY'                 ,'Fiabilidad'                      );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ALE_OTHER'                    ,'Indicador'                       );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ALE_TOTAL'                    ,'General'                         );

-- ISSUES
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ISSUE_TITLE'                  ,'Issues'                          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ISSUE_5'                      ,'Bloqueantes'                     );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ISSUE_4'                      ,'Severos'                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ISSUE_3'                      ,'Altos'                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ISSUE_2'                      ,'Bajos'                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ISSUE_1'                      ,'Leves'                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ISSUE_0'                      ,'Informativos'                    );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_ISSUE_TOTAL'                  ,'Total'                           );
                                                                                                                                                          );
-- PERSISTENCIA                                                                                                                                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_PERS_TITLE'                  ,'Persistencia'                     );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_PERS_FILES'                  ,'Ficheros'                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_PERS_FILES_IO'               ,'Entrada/Salida'                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_PERS_FILES_I'                ,'Entrada'                          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_PERS_FILES_O'                ,'Salida'                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_PERS_TABLES'                 ,'Tablas'                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_PERS_TABLES_IO'              ,'Entrada/Salida'                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_PERS_TABLES_I'               ,'Entrada'                          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_PERS_TABLES_O'               ,'Salida'                           );
                                                                                                                                                          );
-- DEPENDENCIAS                                                                                                                                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_DEPS_TITLE'                  ,'Dependencias'                     );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_DEPS_COPYS'                  ,'Copybooks'                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_DEPS_CPY_FILE'               ,'Ficheros'                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_DEPS_CPY_DATA'               ,'Variables de trabajo'             );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_DEPS_CPY_LINK'               ,'Intercambio de datos'             );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_DEPS_CPY_CODE'               ,'Codigo'                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_DEPS_MODULES'                ,'Modulos / Transacciones'          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_DEPS_CALL'                   ,'Modulos'                          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_DEPS_TRAN'                   ,'Transacciones'                    );
                                                                                                                                                          
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --                                                                       );
-- GRAFICOS                                                                                                                                               );
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --                                                                       );
                                                                                                                                                         
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'GRF_TIT_PARR_LINES'                  ,'Sentencias por parrafo'       );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'GRF_TIT_PARR_CC'                     ,'Complejidad ciclomatica'      );
                                                                                                                                                          
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --                                                                       
-- REGLAS                                                                                                                                                 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --                                                                       
                                                                                                                                                          
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_RULE_NAME'                  ,'Regla'                             );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_STATE'                      ,'Estado'                            );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_SEVERITY'                   ,'Severidad'                         );
                                                                                                                                                            
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_CMP_EXIST'                  , 'Debe existir '                    );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_CMP_EQ'                     , 'Igual a '                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_CMP_GT'                     , 'Mayor de '                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_CMP_LT'                     , 'Menor que '                       );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_CMP_GE'                     , 'Mayor o igual a '                 );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_CMP_LE'                     , 'Menor o igual a '                 );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_CMP_BEG'                    , 'Comienza por '                    );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_CMP_END'                    , 'Acaba con '                       );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_CMP_HAS'                    , 'Contiene '                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_CMP_MATCH'                  , 'se expresa como  '                 
                                                                                                                                                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_DESCRIPTION'                , 'Descripcion'                      );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_RULES_0_TITLE'              , 'Reglas no excluyentes'            );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_RULES_1_TITLE'              , 'Reglas excluyentes'               );
                                                                                                                                                            
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_RULE_PRIORITY'              , 'Orden'                            );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_RULE_SEVERITY'              , 'Severidad'                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_RULE_NAME'                  , 'Regla'                            );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_RULE_STATUS'                , 'Estado'                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_RULE_STATUS_DESC1'           , 'Activo'                          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RUL_RULE_STATUS_DESC'           , 'Activo:Inactivo:Heredado:Condicional' );
                                                                                     
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_LINEAS','Lineas'                                                       );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_SENTENCIAS','Sentencias'                                               );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_NO_ALLOW','Sentencias no permitidas'                                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_PARRAFOS','Parrafos'                                                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_DEP_DATA','Dep. datos'                                                 );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_DEP_MOD','Dep. modulos'                                                );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_EXECS','Ejecuciones'                                                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_LAST_EXEC','Ult. Ejecución'                                            );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_PARSED_TXT'                   , 'Completo:Parcial:Erroneo'             );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MOD_RES_AUTHOR'                   ,'Autor'                                 );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_LINES','Líneas'                                                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_STMTS','Sentencias'                                                    );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_COVER','Cobertura'                                                     );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_CPY_WRK','Dep. datos'                                                  );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_CPY_PRC','Dep. módulos'                                                );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_LAST_COMP','Última compilación'                                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_USER','Usuario'                                                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_EXECS','Ejecuciones'                                                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'RES_LAST_EXEC','Últ. ejecución'                                            );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'APPL','Aplicaciones'                                                       );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MODS','Modulos'                                                            );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'LOG','Mensajes'                                                            );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'MONITOR','Modulos monitorizados'                                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'PER_VAR','Variación en el período'                                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'PER_EXE','Ejecuciones en el período'                                       );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'LOG_ID','Id.'                                                              );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'LOG_OBJ','Objeto'                                                          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'LOG_DATE','Fecha'                                                          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'LOG_UID','Usuario'                                                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'LOG_MSG','Mensaje'                                                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'NO_INFO','No hay informacion disponible'                                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'NO_DATA','No hay datos de ejecuciones'                                     );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'NO_DATA_RANGE','En el rango de fechas seleccionado'                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'NO_EXE_SEL','No hay ejecuciones para la seleccion'                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'BTN_COMPARAR','Comparar'                                                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'BTN_NOCOMPARAR','Anular'                                                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'PNL_ORDEN','Orden'                                                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'WIN_MAX','Ampliar'                                                         );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'GRF_MOD_EXEC','Módulos por número de ejecuciones'                          );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'GRF_TIMES','Tiempo consumido'                                              );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'GRF_EXECS','Ejecuciones de módulos'                                        );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'TIT_APP_VOL','Aplicaciones por volumen'                                    );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'TIT_PARRAFOS','Parrafos'                                                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'TIT_PARR_USO','Parrafos por uso'                                           );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'TIT_PARR_CONSUMO','Parrafos por consumo'                                   );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'TIT_COMPLEJIDAD','Complejidad'                                             );
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'TIT_SENTENCIAS','Sentencias'                                               );
                                                                                                                                                                
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'TXT_MODULOS','modulos'                                                     );
                                                                                                                                                                  
INSERT INTO WEB_MESSAGES (idLang, idDialect, idGroup, txtKey, txtValue) VALUES ('es','ES',1,'TXT_MAXIMO','Maximo'                                                       );
-- ,'TXT_TERCER','Tercer cuartil'
-- ,'TXT_MEDIANA','Mediana'
-- ,'TXT_PRIMER','Primer cuartil'
-- ,'TXT_MINIMO','Minimo'
-- 
-- ,'CBO_DIA','Dia'
-- ,'CBO_SEMANA','Semana'
-- ,'CBO_MES','Mes'
-- ,'CBO_TRIMESTRE','Trimestre'
-- ,'CBO_TODOS','Todos'
-- 
-- ,'LBL_TIME_MS','Tiempo (milisegundos)'
-- 
-- ,'ARB_EXE','Ejecuciones:'
-- ,'ARB_LAST','Ultima ejecución:'
-- ,'ARB_TIME','Media tiempo:'
-- ,'ARB_CPU','% CPU:'
-- ,'ARB_SUS','% Suspend:'
-- 
-- ,'RES_SHOW_EXE','Mostrar ejecuciones'
--     ,'RES_SHOW_SRC','Pulsar para mostrar código fuente'
--     ,'RES_SHOW_ARB','Pulsar para mostrar árbol de llamadas'
-- 
-- 
--     ,'STAT_EXECS','Ejecuciones en el período'
--     ,'STAT_ABEND','Ejecuciones fallidas'
--     ,'STAT_USER','Tiempo de usuario (mSg)'
--     ,'STAT_MIN','Mínimo'
--     ,'STAT_MAX','Máximo'
--     ,'STAT_AVG','Medio'
--     ,'STAT_CPU','Tiempo de CPU (mSg)'
--     ,'STAT_IO','Entradas/Salidas'
--     ,'STAT_READ','Media de registros procesados'
--     ,'STAT_WRITE','Media de registros generados'
--     ,'STAT_AVG_IO','Media de operaciones E/S'
--     ,'STAT_MOD','Módulos'
--     ,'STAT_MOD_DIRECT','Invocados directamente'
--     ,'STAT_MOD_SESION','Media de invocaciones por sesión'
-- 
--     ,'CLICK_DETAIL','Pulsar para detalle'
--     ,'CICK_COVER','Porcentaje de lineas de código ejecutadas'
--     ,'CLICK_CC','Complejidad ciclomática acumulada'
--     ,'CLICK_MAX','Pulsar para maximizar'
--     ,'CLICK_RESTORE','Pulsar para restaurar'
--     ,'CICK_ARBOL','Pulsar para mostrar arbol de llamadas'
-- 
--     ,'WIN_TITLE_RES','Resumen'
--     ,'WIN_SRC_STMT','Sentencias'
--     ,'WIN_SRC_IO','Entrada/Salida'
--     ,'WIN_SRC_DATOS','Trat. datos'
--     ,'WIN_SRC_FLUJO','Control de flujo'
--     ,'WIN_SRC_CTRL','Control'
--     ,'WIN_SRC_ARIT','Op. Aritméticas'
--     ,'WIN_SRC_OTH','Otras'
--     ,'WIN_SRC_TOTAL','Total Sentencias'
-- 
--     ,'WIN_RUT_TITLE','Dependencias de modulos (Primer nivel)'
--     ,'WIN_RUT_NAME','Nombre'
--     ,'WIN_RUT_TIPO','Tipo'
--     ,'WIN_RUT_ESTADO','Estado'

COMMIT;