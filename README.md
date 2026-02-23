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

Start server
``` bash
make pg_start
```
[Open console](http://localhost:8080 "Adminer")

Stop server
``` bash
make pg_stop
```
More detail: [PostgreSQL commands](/postgres/README.md)
