#!/bin/bash

# Create / overwrite the file
> public_ips.txt

# Datanodes
i=1
for ip in $(terraform output -json datanode_public_ip | jq -r '.[]'); do
    echo "$ip d$i" >> public_ips.txt
    i=$((i+1))
done

# Namenode
namenode_ip=$(terraform output -raw namenode_public_ip)
echo "$namenode_ip namenode" >> public_ips.txt



> private_ips.txt

# Datanodes
i=1
for ip in $(terraform output -json datanode_private_ip | jq -r '.[]'); do
    echo "$ip d$i" >> private_ips.txt
    i=$((i+1))
done

# Namenode
namenode_ip=$(terraform output -raw namenode_private_ip)
echo "$namenode_ip namenode" >> private_ips.txt

