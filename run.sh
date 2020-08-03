#!/bin/bash
echo " "
echo "================= Variabels list ======================"
echo " "
echo PBF-link=$PBFlink
echo DB-Host=$DBHost
echo DB-Port=$DBPort
echo DB-Name=$DBName
echo PGUSER=$PGUSER
echo PGPASSWORD=$PGPASSWORD
echo CACHE=$CACHE
echo NUM_PROCESSES=$NUMPROCESSES
echo Stylefile=$StyleFile
echo " "
echo "================= Downloading data ======================"
echo " "
wget $PBFlink
mv *.osm.pbf data.osm.pbf
echo " "
echo "================= Copy default stylefile==================="
echo " "
cp /default/default.style /userdirectory/default.style
echo " "
echo "================= Running osm2pgsql ======================"
echo " "
osm2pgsql --create --slim --drop --style /userdirectory/$StyleFile --database $DBName --cache $CACHE --number-processes $NUMPROCESSES --host $DBHost --port $DBPort --username $PGUSER data.osm.pbf
echo " "
echo "================= Cleaniung up ======================"
echo " "
rm data.osm.pbf
echo " "
echo "================= Finished ======================"
echo " "
