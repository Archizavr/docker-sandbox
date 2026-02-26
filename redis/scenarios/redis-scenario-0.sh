#!/bin/bash
# redis_scenario0.sh
# Scenario #0 command execution with 2 seconds delay

DELAY=2
CLI="docker exec -i redis redis-cli"

echo "=== Scenario #0: Healthcheck ==="

# 0️⃣ Check connection
echo "PING"
$CLI PING
sleep $DELAY

echo "ECHO"
$CLI ECHO "Hello from Redis!"
sleep $DELAY

echo "INFO"
$CLI INFO
sleep $DELAY

echo "TIME"
$CLI TIME
sleep $DELAY

echo "COMMAND COUNT"
$CLI COMMAND COUNT
sleep $DELAY

echo "DBSIZE" # get number of keys in current database
$CLI DBSIZE
sleep $DELAY

echo "FLUSHDB" # clear current database"
$CLI FLUSHDB
sleep $DELAY

echo "=== Scenario completed ==="