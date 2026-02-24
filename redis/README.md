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

Try execute those commands in console:
* SET user:1 "Artemy" - set key to hold the string value;
* GET user:1 - retrieve the value of a key;
* INCR num - increment the integer value of a key by 1;
* DECR num - decrement the integer value of a key by 1;
* EXPIRE session:1 10 - set a timeout on a key;
* TTL session:1 - returns the remaining time to live of a key that has a timeout;
* KEYS * - show all keys in database;
* INFO - get information about database;
* DBSIZE - get database size (number of objects);
* FLUSHDB - clear current database;
* FLUSHALL - clear all databases on server;
* Ctrl + c - leave console

Check rest commands in official [documentation](https://redis.io/tutorials/howtos/quick-start/cheat-sheet/).