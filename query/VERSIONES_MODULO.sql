SELECT * 
    FROM ( SELECT idModulo, COUNT(idVersion) AS C FROM sdp.mod_versiones  group by idModulo) T
    WHERE C > 1;