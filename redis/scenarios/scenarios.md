### Scenario #0
After starting redis docker container (See [here](/README.md)) launch next command:

`make run_redis_scenario-0`
This scenario is used for healthcheck.

### Scenario #1
Before launching this scenario open 9 terminal windows, go to docker sandbox directory in each terminal and enter there next commands:

1. Terminal: `docker exec -it redis redis-cli`
2. Terminal: `watch -n 2 -d "docker exec -ti redis redis-cli SCAN 0 COUNT 5"`
3. Terminal: `watch -n 2 -d "docker exec -ti redis redis-cli SCAN 0 MATCH user:1*"`
4. Terminal: `watch -n 2 -d "docker exec -ti redis redis-cli MGET 1st_int 2nd_str 3rd_exp 4th_exp 5th_exp"`
5. Terminal: `watch -n 2 -d "printf 'MULTI\nEXISTS 2nd_str\nTYPE 2nd_str\nSTRLEN 2nd_str\nTTL 2nd_str\nEXEC\n' | docker exec -i redis redis-cli"`
6. Terminal: `watch -n 2 -d "printf 'MULTI\nTYPE user:1:id\nTYPE user:1:firstname\nTYPE user:1:lastname\nTYPE user:1:hobby\nTYPE user:1:token\nEXEC\n' | docker exec -i redis redis-cli"`
7. Terminal: `watch -n 2 -d "docker exec -ti redis redis-cli MGET user:1:id user:1:firstname user:1:lastname user:1:hobby user:1:token"`
8. Terminal: `watch -n 2 -d "printf 'MULTI\nTTL user:1:id\nTTL user:1:firstname\nTTL user:1:lastname\nTTL user:1:hobby\nTTL user:1:token\nEXEC\n' | docker exec -i redis redis-cli"`
9. Terminal: `watch -n 2 -d "printf 'MULTI\nTYPE user:1:id\nTYPE user:1:firstname\nTYPE user:1:lastname\nTYPE user:1:hobby\nTYPE user:1:token\nEXEC\n' | docker exec -i redis redis-cli"`

It helps you see how Redis works inside.

After all run `make run_redis_scenario-1`

This scenario runs simple commands that works with strings, integers and TTL, like SET, GET, DEL, INCR, DECR, MSET, MGET, EXPIRE, PEXPIRE, etc.

### Scenario #2
*TODO* HASH, LIST
### Scenario #3
*TODO* SETS, SORTED SETS
### Scenario #4
*TODO* PUB/SUB, GEO
