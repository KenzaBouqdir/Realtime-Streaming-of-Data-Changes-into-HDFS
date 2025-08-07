#!/bin/bash

# Wait for Kafka Connect to be ready
echo "Waiting for Kafka Connect to be ready..."
while ! curl -s -f http://kafka-connect:8083/connectors > /dev/null; do
    sleep 5
done

# Delete existing connectors if they exist
curl -X DELETE http://kafka-connect:8083/connectors/postgres-source || true
curl -X DELETE http://kafka-connect:8083/connectors/hdfs-sink || true

# Deploy Postgres source connector
echo "Deploying Postgres source connector..."
curl -X POST -H "Content-Type: application/json" \
    --data @postgres-source.json \
    http://kafka-connect:8083/connectors

# Wait for source connector to be established
sleep 10

# Deploy HDFS sink connector
echo "Deploying HDFS sink connector..."
curl -X POST -H "Content-Type: application/json" \
    --data @hdfs-sink.json \
    http://kafka-connect:8083/connectors

# Check connector status
echo "Checking connector statuses..."
curl -s http://kafka-connect:8083/connectors/postgres-source/status | jq
curl -s http://kafka-connect:8083/connectors/hdfs-sink/status | jq