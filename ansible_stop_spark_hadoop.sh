#!/bin/bash
cd ansible

PLAYBOOK="playbooks/stopSparkHadoop/main.yml"
INVENTORY="nodes.ini"
KEY="../keys/spark_admin_ssh_key"

ansible-playbook "$PLAYBOOK" -i "$INVENTORY" --private-key "$KEY"
