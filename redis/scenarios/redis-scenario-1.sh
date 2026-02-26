#!/bin/bash
# redis_scenario1.sh
# Scenario #1 command execution with 2 seconds delay

DELAY=2
CLI="docker exec -i redis redis-cli"

echo "=== Scenario #1: Working Simple Types ==="

# 0️⃣ Clear database before starting
echo "FLUSHDB"
$CLI FLUSHDB
sleep $DELAY

# 1️⃣ SET и GET
echo "SET 1st_int 100"
$CLI SET 1st_int 100
sleep $DELAY

echo "SET 2nd_str Hello"
$CLI SET 2nd_str "Hello"
sleep $DELAY

echo "GET 1st_int"
$CLI GET 1st_int
sleep $DELAY

echo "GET 2nd_str"
$CLI GET 2nd_str
sleep $DELAY

# 2️⃣ SET NX / XX
echo "SET 2nd_str World NX"
$CLI SET 2nd_str "World" NX
sleep $DELAY

echo "SET 1st_int 200 XX"
$CLI SET 1st_int 200 XX
sleep $DELAY

# 3️⃣ SET GET
echo "SET 2nd_str Redis GET"
$CLI SET 2nd_str "Redis" GET
sleep $DELAY

# 4️⃣ SET с TTL / PX / EXAT / KEEPTTL
echo "SET 3rd_exp Temp EX 10"
$CLI SET 3rd_exp "Temp" EX 10
sleep $DELAY

echo "SET 4th_exp TempPX PX 15000"
$CLI SET 4th_exp "TempPX" PX 15000
sleep $DELAY

echo "SET 5th_exp TempEXAT EXAT $(($(date +%s)+20))"
$CLI SET 5th_exp "TempEXAT" EXAT $(($(date +%s)+20))
sleep $DELAY

echo "SET 2nd_str Redis KEEPTTL"
$CLI SET 2nd_str "Redis" KEEPTTL
sleep $DELAY

# 5️⃣ GETEX
echo "GETEX 3rd_exp EX 5"
$CLI GETEX 3rd_exp EX 5
sleep $DELAY

# 6️⃣ DEL / UNLINK
echo "DEL 1st_int"
$CLI DEL 1st_int
sleep $DELAY

echo "UNLINK 4th_exp"
$CLI UNLINK 4th_exp
sleep $DELAY

# 7️⃣ INCR / INCRBY / DECR / DECRBY
echo "SET counter 10"
$CLI SET counter 10
sleep $DELAY

echo "INCR counter"
$CLI INCR counter
sleep $DELAY

echo "INCRBY counter 5"
$CLI INCRBY counter 5
sleep $DELAY

echo "DECR counter"
$CLI DECR counter
sleep $DELAY

echo "DECRBY counter 3"
$CLI DECRBY counter 3
sleep $DELAY

# 8️⃣ COPY / RENAME
echo "COPY 2nd_str 2nd_str_copy"
$CLI COPY 2nd_str 2nd_str_copy
sleep $DELAY

echo "RENAME 2nd_str 2nd_str_renamed"
$CLI RENAME 2nd_str 2nd_str_renamed
sleep $DELAY

# 9️⃣ SETRANGE / GETRANGE / APPEND
echo "SET mystr HelloWorld"
$CLI SET mystr "HelloWorld"
sleep $DELAY

echo "SETRANGE mystr 5 _Redis"
$CLI SETRANGE mystr 5 "_Redis"
sleep $DELAY

echo "GET mystr"
$CLI GET mystr
sleep $DELAY

echo "GETRANGE mystr 0 4"
$CLI GETRANGE mystr 0 4
sleep $DELAY

echo "APPEND mystr !!!"
$CLI APPEND mystr "!!!"
sleep $DELAY

echo "GET mystr"
$CLI GET mystr
sleep $DELAY

# 🔟 MSET / MGET
echo "MSET user:1:id 1 user:1:firstname John user:1:lastname Deer user:1:hobby DevOps"
$CLI MSET user:1:id 1 user:1:firstname "John" user:1:lastname "Deer" user:1:hobby "DevOps"
sleep $DELAY

echo "MGET user:1:id user:1:firstname user:1:lastname user:1:hobby"
$CLI MGET user:1:id user:1:firstname user:1:lastname user:1:hobby
sleep $DELAY

# 1️⃣1️⃣ SET с EX / EXPIRE / PEXPIRE / PEXPIREAT
echo "SET user:1:token #22c55e EX 10"
$CLI SET user:1:token "#22c55e" EX 10
sleep $DELAY

echo "EXPIRE 2nd_str_renamed 15"
$CLI EXPIRE 2nd_str_renamed 15
sleep $DELAY

echo "PEXPIRE 2nd_str_copy 20000"
$CLI PEXPIRE 2nd_str_copy 20000
sleep $DELAY

echo "PEXPIREAT 5th_exp $(($(date +%s%3N)+30000))"
$CLI PEXPIREAT 5th_exp $(($(date +%s%3N)+30000))
sleep $DELAY

# 1️⃣2️⃣ INCR user:1:id
echo "INCR user:1:id"
$CLI INCR user:1:id
sleep $DELAY

# 1️⃣3️⃣ KEYS по маске
echo "KEYS user:1*"
$CLI KEYS user:1*
sleep $DELAY

# 🔚 Конец — очистка базы
echo "FLUSHDB"
$CLI FLUSHDB
sleep $DELAY

echo "=== Scenario completed ==="