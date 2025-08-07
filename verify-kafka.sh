#!/bin/bash
# verify-kafka.sh

echo "Checking Kafka topics..."
docker exec kafka kafka-topics --bootstrap-server kafka:9092 --list

echo "Creating required topics if they don't exist..."
docker exec kafka kafka-topics --bootstrap-server kafka:9092 --create --if-not-exists --topic connect-configs --partitions 1 --replication-factor 1
docker exec kafka kafka-topics --bootstrap-server kafka:9092 --create --if-not-exists --topic connect-offsets --partitions 1 --replication-factor 1
docker exec kafka kafka-topics --bootstrap-server kafka:9092 --create --if-not-exists --topic connect-status --partitions 1 --replication-factor 1

echo "Verifying topic configurations..."
for topic in connect-configs connect-offsets connect-status; do
    echo "Configuration for $topic:"
    docker exec kafka kafka-topics --bootstrap-server kafka:9092 --describe --topic $topic
done