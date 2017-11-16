FROM postgres:9.3

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
        postgresql-9.3-postgis-2.3 \
        && rm -rf /var/lib/apt/lists/*
