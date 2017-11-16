FROM postgres:9.4

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-9.4-postgis-2.3 \
        postgresql-9.4-postgis-2.3-scripts \
        && rm -rf /var/lib/apt/lists/*
