#!/bin/bash

# Check if the first argument (remote host) is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <remote-host>"
    exit 1
fi

REMOTE=$1

ssh -i keys/spark_admin_ssh_key ubuntu@$REMOTE "
  spark/bin/spark-submit \
    --class WordCount \
    --master spark://master:7077 \
    --executor-memory 512m \
    WordCount.jar \
    hdfs://master:9000/input/input.txt \
    hdfs://master:9000/output
"
