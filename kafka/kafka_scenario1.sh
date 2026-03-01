#!/bin/bash

DELAY=2
CLI="docker exec -i kafka-1 /opt/kafka/bin/kafka-console-producer.sh"
BROKER="kafka-1:19092"
TOPIC="tts.irina.in"

send_message() {
  local msg="$1"
  echo "Producing: $msg"
  echo "$msg" | $CLI --bootstrap-server $BROKER --topic $TOPIC
}

# 1️⃣ Create the Topic and Send the first message
echo "Step 1️⃣: Creating topic: $TOPIC"
docker exec -ti kafka-1 /opt/kafka/bin/kafka-topics.sh --bootstrap-server $BROKER --create --topic $TOPIC --partitions 2 --replication-factor 1
echo

echo "Step 2️⃣ : Sending Message #1 and #2 to topic: $TOPIC"
echo "Message #1" | $CLI --bootstrap-server $BROKER --topic $TOPIC
echo "Message #2" | $CLI --bootstrap-server $BROKER --topic $TOPIC
sleep $DELAY
echo

echo "Step 3️⃣ : Start console [1,2] to show group list and console [2,1] to show NEW messages in topic: $TOPIC"
echo
echo "ACTION1: Start console [1,2] to display groups by command: "
echo "watch -d \"docker exec -it kafka-1 /opt/kafka/bin/kafka-consumer-groups.sh --bootstrap-server kafka-1:19092 --list\" "
echo
echo "ACTION2: Start console [2,1] to new messages by command: "
echo "docker exec -it kafka-1 /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka-1:19092 --topic $TOPIC --property print.key=true --property print.partition=true --property print.offset=true"
read -rsp $'Press any key to continue...\n' -n 1 key
echo

echo "Step 4️⃣ : Start console [3,1] to show ALL messages in topic: $TOPIC"
echo
echo "ACTION: Start console [3,1] to display All messages by command:"
echo "docker exec -it kafka-1 /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka-1:19092 --topic $TOPIC --from-beginning --property print.key=true --property print.partition=true --property print.offset=true"
read -rsp $'Press any key to continue...\n' -n 1 key
echo

echo "Step 5️⃣ : Start Group 1 Consumer console [2,2] to show ALL? messages in topic: $TOPIC"
echo
echo "ACTION: Start Group#1 console [2,2] to display ALL? messages :"
echo "docker exec -it kafka-1 /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka-1:19092 --topic $TOPIC --group group1 --property print.key=true --property print.partition=true --property print.offset=true"
read -rsp $'Press any key to continue...\n' -n 1 key
echo

echo "Step 6️⃣ : Start Group 1 Consumer console [3,2] to show ALL? messages in topic: $TOPIC"
echo
echo "ACTION: Start Group#1 console [3,2] to display ALL? messages : "
echo "docker exec -it kafka-1 /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka-1:19092 --topic $TOPIC --from-beginning --group group1 --property print.key=true --property print.partition=true --property print.offset=true"
echo
read -rsp $'Press any key to continue...\n' -n 1 key
echo

echo "Step 7️⃣ : Start Group 2 Consumer consoles [1,3], [2,3] and [3,3] to show ALL messages in topic: $TOPIC"
echo
echo "ACTION1: Start Group#2 console [1,3] to display ALL messages : "
echo "docker exec -it kafka-1 /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka-1:19092 --topic $TOPIC --group group2 --from-beginning --property print.key=true --property print.partition=true --property print.offset=true"
echo
echo "ACTION2: Start Group#2 console [2,3] to display ALL messages with the same command as above: "
echo
echo "ACTION3: Start Group#2 console [3,3] to display ALL messages with the same command as above: "
read -rsp $'Press any key to continue...\n' -n 1 key
echo

echo "Step 8️⃣ : Send Message #3 to topic: $TOPIC"
echo "Message #3" | $CLI --bootstrap-server $BROKER --topic $TOPIC
sleep $DELAY
echo

echo "Step 9️⃣ : Send Messages #4 to topic: $TOPIC"
echo "Message #4" | $CLI --bootstrap-server $BROKER --topic $TOPIC
sleep $DELAY
echo

echo "Step 1️⃣0️⃣ : Stop Consoles [2,1], [2,2], [3,1] and [3,2]"
echo
echo "ACTION: Stop consoles [2,1], [2,2], [3,1] and [3,2] by pressing Ctrl+C in each console"
echo
read -rsp $'Press any key to continue...\n' -n 1 key
echo

echo "Step 1️⃣1️⃣ : Send Message #4 to topic: $TOPIC"
echo "Message #4" | $CLI --bootstrap-server $BROKER --topic $TOPIC
sleep $DELAY
echo

echo "Step 1️⃣2️⃣ : Send Messages #5 to topic: $TOPIC"
echo "Message #5" | $CLI --bootstrap-server $BROKER --topic $TOPIC
sleep $DELAY
echo

echo "Step 1️⃣3️⃣ : Start Consoles [2,1], [2,2], [3,1] and [3,2]"
echo
echo "ACTION: Start consoles [2,1], [2,2], [3,1] and [3,2] using the commands from earlier in this scenario"
echo
read -rsp $'Press any key to continue...\n' -n 1 key
echo

echo "Step 1️⃣4️⃣ : Send Messages #6 to topic: $TOPIC"
echo "Message #6" | $CLI --bootstrap-server $BROKER --topic $TOPIC
sleep $DELAY

echo
echo "Step 1️⃣5️⃣ : Send Messages #7 to topic: $TOPIC"
echo "Message #7" | $CLI --bootstrap-server $BROKER --topic $TOPIC
sleep $DELAY
echo
read -rsp $'Press any key to continue...\n' -n 1 key
echo

echo "Step 1️⃣6️⃣ : Sending a badly formatted JSON message to topic: $TOPIC"
echo
echo "{" > temp_bad_messages.txt
echo "\"orderId\": 123," >> temp_bad_messages.txt
echo "\"userId\": 42," >> temp_bad_messages.txt
echo "\"status\": \"CREATED\"," >> temp_bad_messages.txt
echo "\"total\": 99.90" >> temp_bad_messages.txt
echo "}" >> temp_bad_messages.txt
cat temp_bad_messages.txt
$CLI  --bootstrap-server $BROKER --topic $TOPIC < temp_bad_messages.txt
rm -f temp_bad_messages.txt
sleep $DELAY
echo
read -rsp $'Press any key to continue...\n' -n 1 key
echo

# 4️⃣ Goodly formatted JSON message (single line)
echo "Step 1️⃣7️⃣ : Sending a well formatted JSON message to topic: $TOPIC"
echo "{\"orderId\": 123,\"userId\": 42,\"status\": \"CREATED\",\"total\": 99.90}" > temp_good_messages.txt
$CLI  --bootstrap-server $BROKER --topic $TOPIC < temp_good_messages.txt
rm -f temp_good_messages.txt
sleep $DELAY
echo
read -rsp $'Press any key to continue...\n' -n 1 key
echo

# 5️⃣ Multiple messages with user_id prefix (not valid JSON, but we want to show how to produce multiple messages at once)
echo "Step 1️⃣8️⃣ : Sending multiple messages with key, but without separator to topic: $TOPIC"
echo "1:{"orderId": 223,"userId": 123,"status": "CREATED","total": 99.90}" > temp_key_orders.txt
echo "2:{"orderId": 224,"userId": 124,"status": "SHIPPED","total": 149.50}" >> temp_key_orders.txt
$CLI  --bootstrap-server $BROKER --topic $TOPIC < temp_key_orders.txt
rm -f temp_key_orders.txt
sleep $DELAY
echo
read -rsp $'Press any key to continue...\n' -n 1 key
echo

echo "Step 1️⃣9️⃣ : Sending multiple messages with key and separator to topic: $TOPIC"
echo "1:{"orderId": 223,"userId": 123,"status": "CREATED","total": 99.90}" > temp_key_orders.txt
echo "2:{"orderId": 224,"userId": 124,"status": "SHIPPED","total": 149.50}" >> temp_key_orders.txt
echo "3:{"orderId": 225,"userId": 125,"status": "DELIVERED","total": 79.99}" >> temp_key_orders.txt
$CLI  --bootstrap-server $BROKER --topic $TOPIC --property parse.key=true --property key.separator=:< temp_key_orders.txt
rm -f temp_key_orders.txt
sleep $DELAY

echo
echo "Done."
