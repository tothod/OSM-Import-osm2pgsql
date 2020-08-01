# OSM-Import-osm2pgsql

This is a development docker container that will be used to easily import OpenStreetMap-data into a Postgis database.

## Running container

Simple run of container (will probobly not work):
...
docker run tothod/osm-import-osm2pgsql
...

## Volume

Userfiles is stored in volume:
...
-v /userdirectory
...

## Enviroment variables
Most instructions to make this container work is set by enviroment variables.

### Database variabels
These are the variabels to let osm2pgsql know where the database is.

ENV DBHost localhost
ENV DBPort 5432
ENV DBName gis
ENV PGUSER gisuser
ENV PGPASSWORD password

### Performence variabels
These are variables to set recources availible to osm2pgsql.

ENV CACHE 400
ENV NUMPROCESSES 2

### OSM-Database
Variable to include link to PBF data.

FROM ubuntu
ENV PBFlink https://download.geofabrik.de/asia/thailand-latest.osm.pbf
