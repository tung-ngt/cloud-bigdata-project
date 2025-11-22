#!/bin/bash



# Check if the first argument (remote host) is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <edge-node-ip-or-dns>"
    exit 1
fi

REMOTE=$1

echo "scp the input.txt to edge node"
scp -i keys/spark_admin_ssh_key input.txt ubuntu@$REMOTE:~/

echo "upload the input.txt to hdfs through edge node"
ssh -i keys/spark_admin_ssh_key ubuntu@$REMOTE "
    hadoop/bin/hdfs dfs -mkdir -p /input
    hadoop/bin/hdfs dfs -put -f ~/input.txt /input
    hadoop/bin/hdfs dfs -ls -h /
    hadoop/bin/hdfs dfs -ls -h /input
"
