# Realtime-Streaming-of-Data-Changes-into-HDFS

This project implements a real-time, enterprise-style data pipeline that captures **data changes** from a PostgreSQL database (CDC), streams them through **Apache Kafka**, and stores them in a **Hadoop HDFS data lake** for further processing and analytics.

The work was completed as part of the **CSC5356 – Data Engineering** course in the Master of Science in Big Data Analytics program at **Al Akhawayn University**.

---

## 🚀 Pipeline Overview

**PostgreSQL (CDC)** → **Kafka Broker + Schema Registry** → **Kafka Connect** → **HDFS Sink** → **Hadoop Data Lake**

- **CDC (Change Data Capture)**: Implemented using **Debezium PostgreSQL connector** to detect and stream INSERT, UPDATE, DELETE events.
- **Kafka Broker**: Handles high-throughput streaming of change events.
- **Schema Registry**: Manages Avro schemas for compatibility and evolution.
- **Kafka Connect HDFS Sink**: Writes events from Kafka topics into HDFS in Avro format, partitioned by time.
- **HDFS (Data Lake)**: Stores the events for batch analytics.

---

## 🛠️ Tech Stack

- **PostgreSQL** (CDC enabled with logical replication)
- **Debezium PostgreSQL Source Connector**
- **Apache Kafka** (KRaft mode)
- **Confluent Schema Registry**
- **Kafka Connect HDFS Sink Connector**
- **Hadoop HDFS** (NameNode + DataNode in Docker)
- **Docker Compose** (multi-container setup)
- **Grafana / Kafka UI** (for monitoring - optional)

