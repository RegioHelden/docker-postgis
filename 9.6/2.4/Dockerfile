FROM postgres:9.6

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-9.6-postgis-2.4 \
        postgresql-9.6-postgis-2.4-scripts \
        && rm -rf /var/lib/apt/lists/*
