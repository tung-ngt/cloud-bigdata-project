#!/bin/bash
cd ansible

PLAYBOOK="playbooks/installSparkHadoop/main.yml"
INVENTORY="nodes.ini"
KEY="../keys/spark_admin_ssh_key"

if [ -z "$1" ]; then
  echo "No worker_count provided. Running default playbook (2 workers)..."
    ansible-playbook "$PLAYBOOK" -i "$INVENTORY" --private-key "$KEY"
else
    WORKER_COUNT="$1"
    echo "Running with worker_count=$WORKER_COUNT"
    ansible-playbook "$PLAYBOOK" -i "$INVENTORY" --private-key "$KEY" \
        --extra-vars "{\"worker_count\": $WORKER_COUNT}"
fi

