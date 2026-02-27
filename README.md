# Docker Sandbox

## Prerequisite

Docker should be installed
``` bash
docker --version

docker compose version
```
Both commands should display versions.

## Projects

### PostreSQL

Start server PostreSQL
``` bash
make pg_start
```
[Open console](http://localhost:8080 "Adminer") (localhost)

Stop server PostreSQL
``` bash
make pg_stop
```
More detail: [PostgreSQL commands](/postgres/README.md)


### Redis

Start server Redis
``` bash
make redis_start
```
[Open console](http://localhost:5540/ "Redis Insight") (localhost)

Stop server Redis
``` bash
make redis_stop
```
More detail: [Redis commands](/redis/README.md)