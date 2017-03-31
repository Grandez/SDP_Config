############################################################
# TOOL
# Genera un fichero para insertar registros en db2
#
# Parametros:
#    Tabla
#    Numero registros
#    Salto
#
# Parametros: Directorio 
#
# Autor: Javier Gonzalez
###########################################################

TABLE=SDPDATA1
COUNT=99999
EACH=1


if [ $# -gt 0 ] ; then
   TABLE=$1
   shift
fi   

if [ $# -gt 0 ] ; then
   COUNT=$1
   shift
fi

if [ $# -gt 0 ] ; then
   EACH=$1
   shift
fi   

count=0

while [ $count -lt $COUNT ] ; do
   (( count += 1 ))
   if (( $count % $EACH == 0 )) ; then
       ms=$count
       while [ ${#ms} -ne 6 ];  do  ms="0"$ms ; done
       echo "INSERT INTO $TABLE (TXTID , TXTDATA, TXTTMS) VALUES ( $count , \"Texto de prueba $count \" , \"2016-01-01-01.01.01.$ms\" ); "
   fi    
done
