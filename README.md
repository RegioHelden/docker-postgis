# regiohelden/postgis

[![Build Status](https://travis-ci.org/RegioHelden/docker-postgis.svg?branch=master)](https://travis-ci.org/RegioHelden/docker-postgis)

Simple docker image for PostgreSQL+PostGIS.
This image builds upon the [official docker postgres](https://hub.docker.com/_/postgres/) image and
simply adds the postgis packages to it.

# Usage

Being based on the [official docker postgres](https://hub.docker.com/_/postgres/), this image inherits
all of its environment variables.

## Example usage
### ... with docker

```
docker run -it --rm regiohelden/postgis:10_2.4
```

## ... with docker-compose

```yaml
---
db:
    image: regiohelden/postgis:10_2.4
    environment:
      POSTGRES_USER: app
      POSTGRES_PASSWORD: app
---
```

# Limitations

Currentl, only the non-alpine versions are built.
