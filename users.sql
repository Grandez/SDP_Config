-- ---------------------------------------------------------
-- Script para la creacion y carga de usuarios en MySQL
-- Ejecutar como usuario root en mysql
--
-- source users.sql
--
-- Autor: Javier Gonzalez
--
-- ---------------------------------------------------------

CREATE USER 'myadmin'@'%' IDENTIFIED BY '1qazxsw2$';

GRANT ALL PRIVILEGES ON *.* TO 'myadmin'@'%' WITH GRANT OPTION;

CREATE USER 'SDP'@'%' IDENTIFIED BY 'sdp';

GRANT ALL PRIVILEGES ON *.* TO 'SDP'@'%' WITH GRANT OPTION;