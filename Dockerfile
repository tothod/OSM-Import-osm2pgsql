FROM ubuntu
ENV PBFlink https://download.geofabrik.de/asia/thailand-latest.osm.pbf
ENV StyleFile default.style
ENV DBHost localhost
ENV DBPort 5432
ENV DBName gis
ENV PGUSER gisuser
ENV PGPASSWORD password
ENV CACHE 400
ENV NUMPROCESSES 2
ENV TZ=Europe/Stockholm
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
  && echo "============== Installing dependencies ===================" \
  && echo " " \
  && apt-get update \
  && apt-get install -y git \
  && apt-get install -y wget \
  && apt-get install -y make \
  && apt-get install -y cmake \
  && apt-get install -y g++ \
  && apt-get install -y libboost-dev \
  && apt-get install -y libboost-system-dev \
  && apt-get install -y libboost-filesystem-dev \
  && apt-get install -y libexpat1-dev \
  && apt-get install -y zlib1g-dev \
  && apt-get install -y libbz2-dev \
  && apt-get install -y libpq-dev \
  && apt-get install -y libproj-dev \
  && apt-get install -y lua5.3 \
  && apt-get install -y liblua5.3-dev \
  && echo " " \
  && echo "============ Installing OSM2PGSQL =========================" \
  && echo " " \
  && git clone git://github.com/openstreetmap/osm2pgsql.git \
  && mkdir osm2pgsql/build
WORKDIR osm2pgsql/build
RUN cmake .. \
  && make \
  && make install
WORKDIR /
RUN rm -r osm2pgsql \
  &&echo " " \
  && echo "============ Creating Userdirectory =========================" \
  && echo " " \
  && mkdir userdirectory \
  && mkdir default
COPY default.style /default/*
COPY run.sh /run.sh
VOLUME /userdirectory
WORKDIR /
CMD ["/bin/bash", "run.sh"]
