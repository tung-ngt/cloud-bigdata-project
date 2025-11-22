#!/bin/bash

cd terraform

# Apply the module iam first to create user first for managing other resources.
# terraform and aws has bug if we apply in one go, the access key of the created user
# will not be registered yet.

# If an argument is provided, use it as an extra variable
if [ -z "$1" ]; then
    echo "No argument provided. Running default terraform apply with 2 workers..."
    terraform apply -target=module.iam -auto-approve

    echo "Sleep for 5 seconds to wait aws iam user access key get populateed"
    sleep 5
    terraform apply -auto-approve
else
    WORKER_COUNT="$1"
    echo "Running terraform apply with $WORKER_COUNT workers..."
    terraform apply -target=module.iam -auto-approve -var="worker_count=$WORKER_COUNT"

    echo "Sleep for 5 seconds to wait aws iam user access key get populateed"
    sleep 5
    terraform apply -auto-approve -var="worker_count=$WORKER_COUNT"
fi

