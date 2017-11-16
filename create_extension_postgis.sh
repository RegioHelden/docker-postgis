#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER $POSTGRES_DB <<- EOF
    CREATE EXTENSION IF NOT EXISTS postgis;
    CREATE EXTENSION IF NOT EXISTS postgis_topology;
    CREATE EXTENSION IF NOT EXISTS address_standardizer;
EOF
