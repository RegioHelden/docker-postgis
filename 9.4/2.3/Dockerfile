FROM postgres:9.4

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
        postgresql-9.4-postgis-2.3 \
        && rm -rf /var/lib/apt/lists/*
