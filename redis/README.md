# Redis

> Redis is an in-memory data structure store used as a database, cache, and message broker. It supports strings, hashes, lists, sets, sorted sets, and more.

This setup runs two containers:

- redis – the Redis server
- redis/redisinsight:latest – a web-based Redis GUI (RedisInsight)

The environment can be started with:

`make redis_start`

and stopped with:

`make redis_stop`

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

## Scenarios

For Redis, example CLI scenarios are provided to demonstrate:

- Working with different data structures

- Running commands from the terminal

- Practical usage patterns

These scenarios help you understand Redis behavior in real-world cases.

[Scenarios](/redis/scenarios/scenarios.md):
* [redis-scenario-0](/redis/scenarios/redis-scenario-0.sh) *Connectivity check*
* [redis-scenario-1](/redis/scenarios/redis-scenario-1.sh) *Demonstrate commands for simple types: GET, SET, EXPIRE, etc.*
* redis-scenario-2 *TODO: HASH, LIST*
* redis-scenario-3 *TODO: SETS, SORTED SETS*
* redis-scenario-4 *TODO: PUB/SUB, GEO*