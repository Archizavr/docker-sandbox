## Troubleshooting

Check Redis container is running:
``` bash
docker exec -it redis redis-cli --version
# redis-cli 8.6.1
docker exec -it redis redis-cli PING
# PONG
```

Connect to Redis console:
``` bash
docker exec -it redis redis-cli
```

Check rest commands in official [documentation](https://redis.io/tutorials/howtos/quick-start/cheat-sheet/).

Check how Redis works by launching [scenarios](/redis/scenarios/scenarios.md):
* [redis-scenario-0](/redis/scenarios/redis-scenario-0.sh) *Connectivity check*
* [redis-scenario-1](/redis/scenarios/redis-scenario-1.sh) *Demonstrate commands for simple types: GET, SET, EXPIRE, etc.*
* redis-scenario-2 *TODO: HASH, LIST*
* redis-scenario-3 *TODO: SETS, SORTED SETS*
* redis-scenario-4 *TODO: PUB/SUB, GEO*