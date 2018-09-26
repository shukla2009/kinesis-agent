#!/bin/bash

echo \
  "{ \
    \"checkpointFile\": \"/tmp/aws-kinesis-agent-checkpoints/main.log\",
    \"cloudwatch.emitMetrics\": $CLOUDWATCH_EMIT_METRICS, \
    \"kinesis.endpoint\": \"kinesis.$AWS_REGION.amazonaws.com\", \
    \"cloudwatch.endpoint\": \"monitoring.$AWS_REGION.amazonaws.com\", \
    \"flows\": [ \
      { \
        \"filePattern\": \"$KINESIS_FILE_PATTERN\", \
        \"kinesisStream\": \"$KINESIS_STREAM\", \
        \"partitionKeyOption\": \"RANDOM\"
      }
    ] \
  }" > /etc/aws-kinesis/agent.json