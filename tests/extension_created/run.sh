#!/bin/bash

docker run --rm -u postgres $1 psql -A -c '\x on' -c '\dx' | grep ^Name
