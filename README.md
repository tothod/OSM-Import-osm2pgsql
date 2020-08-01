# OSM-Import-osm2pgsql

This is a development docker container that will be used to easily import OpenStreetMap-data into a Postgis database.

## Running container

Simple run of container (will probobly not work):
**docker run tothod/osm-import-osm2pgsql**

## Volume

Userfiles is stored in volume:
**-v /userdirectory**

## Enviroment variables
Most instructions to make this container work is set by enviroment variables.
VAR | Default
----|----------
TZ | Europe/Stockholm

### Database variabels
These are the variabels to let osm2pgsql know where the database is.
VAR | Default
----|----------
DBHost | localhost
DBPort | 5432
DBName | gis
PGUSER | gisuser
PGPASSWORD | password

### Performence variabels
These are variables to set recources availible to osm2pgsql.
VAR | Default
----|----------
CACHE | 400
NUMPROCESSES | 2

### OSM-Database
Variable to include link to PBF data.
VAR | Default
----|----------
PBFlink | https://download.geofabrik.de/asia/thailand-latest.osm.pbf
