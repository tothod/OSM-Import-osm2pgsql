#!/bin/bash
echo " "
echo "================= Variabels list ======================"
echo " "
echo PBF-link=$PBFlink
echo DB-Host=$DBHost
echo DB-Portk=$DBPort
echo DB-Name=$DBName
echo PGUSER=$PGUSER
echo PGPASSWORD=$PGPASSWORD
echo CACHE=$CACHE
echo NUM_PROCESSES=$NUMPROCESSES
echo " "
echo "================= Running osm2pgsql ======================"
echo " "
osm2pgsql --create -- database $DBName --cache $CACHE --number-processes $NUM_PROCESSES --host $DBHost -port $DBPort --username $PGUSER $PBFlink
echo " "
echo "================= Finished ======================"
echo " "
