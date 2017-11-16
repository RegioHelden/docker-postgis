#!/bin/bash
set -eo pipefail

image="$1"

export POSTGRES_USER='my cool postgres user'
export POSTGRES_PASSWORD='my cool postgres password'
export POSTGRES_DB='my cool postgres database'

cname="postgres-container-$RANDOM-$RANDOM"
cid="$(docker run -d -e POSTGRES_USER -e POSTGRES_PASSWORD -e POSTGRES_DB --name "$cname" "$image")"
trap "docker rm -vf $cid > /dev/null" EXIT

psql() {
    docker run --rm -i \
        --link "$cname":postgres \
        --entrypoint psql \
        -e PGPASSWORD="$POSTGRES_PASSWORD" \
        "$image" \
        --host postgres \
        --username "$POSTGRES_USER" \
        --dbname "$POSTGRES_DB" \
        --quiet --no-align --tuples-only \
        "$@"
}

output=$(mktemp)
. ~/official-images/test/retry.sh --tries "$POSTGRES_TEST_TRIES" --sleep "$POSTGRES_TEST_SLEEP" "psql -c '\dx' > $output"
cat $output | cut -d'|' -f 1
rm $output
