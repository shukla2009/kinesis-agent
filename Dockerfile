FROM zendesk/amazon-kinesis-agent:latest
MAINTAINER Rahul Shukla <shukla2009@gmail.com>
ENV CLOUDWATCH_EMIT_METRICS=false \
    AWS_REGION=ap-southeast-1 \
    KINESIS_FILE_PATTERN="/wootag/dc/event*.json" \
    KINESIS_STREAM=stream \
    KINESIS_PARTITION_KEY_OPTION=RANDOM \
    LOG_LEVEL=info

COPY config.sh config.sh

CMD ./config.sh && /usr/bin/start-aws-kinesis-agent -L $LOG_LEVEL -l /dev/stdout