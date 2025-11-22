#!/bin/bash

cd terraform

# Output inventory file relative to terraform folder
inventory_file="../ansible/nodes.ini"
> "$inventory_file"   # empty the file

# Master
master_ip=$(terraform output -raw master_public_ip)
echo "[master]" >> "$inventory_file"
echo "$master_ip" >> "$inventory_file"
echo >> "$inventory_file"

# Edge
edge_ip=$(terraform output -raw edge_public_ip)
echo "[edge]" >> "$inventory_file"
echo "$edge_ip" >> "$inventory_file"
echo >> "$inventory_file"

# Workers
echo "[workers]" >> "$inventory_file"
i=1
for ip in $(terraform output -json worker_public_ip | jq -r '.[]'); do
    echo "$ip" >> "$inventory_file"
    i=$((i+1))
done
