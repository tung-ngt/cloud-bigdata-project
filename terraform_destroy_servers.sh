#!/bin/bash
cd terraform

# Destroy the module vpc first because terraform has bug of deleting the iam user
# will delete the permission first so cannot delete other resources


# If an argument is provided, use it as an extra variable
if [ -z "$1" ]; then
    echo "No argument provided. Running default terraform destroy with 2 workers..."
    terraform destroy -target=module.vpc -auto-approve
    terraform destroy -auto-approve
else
    WORKER_COUNT="$1"
    echo "Destroy servers with $WORKER_COUNT workers..."
    terraform destroy -target=module.vpc -auto-approve -var="worker_count=$WORKER_COUNT"
    terraform destroy -auto-approve -var="worker_count=$WORKER_COUNT"
fi
