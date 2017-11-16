#!/bin/bash

set -Eeuo pipefail

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

for pg_version in [0-9]*; do
    for postgis_version in $pg_version/[0-9]*; do
        postgis_version=${postgis_version##*/}
        sed -e 's/%%PG_VERSION%%/'"$pg_version"'/g' \
            -e 's/%%POSTGIS_VERSION%%/'"$postgis_version"'/g' \
            Dockerfile.template > $pg_version/$postgis_version/Dockerfile
        travis_env="  - SUBDIR=$pg_version/$postgis_version\n${travis_env:-}"
    done
done

sed -e 's@%%TRAVIS_ENV%%@'"$travis_env"'@' .travis.yml.template > .travis.yml
