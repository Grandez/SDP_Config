:
:       SERENDIPITY
:
: Cargador de tablas para IVP Bloque 0
:
: Author:   Javier Gonzalez
: Version:  1.0
: Date:     08/2017
:

@echo off
:D:\Servers\SGDB\Maria\bin\mysql -u SDP --password="sdp" < p:\SDP\Config\config0.sql
:D:\Servers\SGDB\Maria\bin\mysql -u SDP --password="sdp" < p:\SDP\Config\rules_all.sql
D:\Servers\SGDB\Maria\bin\mysql -u SDP --password="sdp" < p:\SDP\Config\test0.sql 