#!/bin/bash

# Check if the first argument (remote host) is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <edge-node-ip-or-dns>"
    exit 1
fi

REMOTE=$1

echo "scp WordCount.java to edge node"
scp -i keys/spark_admin_ssh_key WordCount.java ubuntu@$REMOTE:~/

echo "compile WordCount.java on edge node"
ssh -i keys/spark_admin_ssh_key ubuntu@$REMOTE "
  mkdir -p classes
  javac -cp \"spark/jars/*\" -d classes WordCount.java
  jar cvf WordCount.jar -C classes .
"
