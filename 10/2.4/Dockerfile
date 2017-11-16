FROM postgres:10

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-10-postgis-2.4 \
        postgresql-10-postgis-2.4-scripts \
        && rm -rf /var/lib/apt/lists/*

COPY create_extension_postgis.sh /docker-entrypoint-initdb.d/
