#!/bin/bash

# Check if the first argument (remote host) is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <remote-host>"
    exit 1
fi

REMOTE=$1

echo "clear hdfs /output* folders through edge node"
ssh -i keys/spark_admin_ssh_key ubuntu@$REMOTE "
    hadoop/bin/hdfs dfs -rm -r /output
"
