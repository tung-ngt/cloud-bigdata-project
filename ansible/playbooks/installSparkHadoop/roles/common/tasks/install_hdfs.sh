#!/bin/bash
cd ~

# Make sure clear
sudo rm -rf hadoop-3.3.6.tar.gz
sudo rm -rf hadoop-3.3.6
sudo rm -rf hadoop

wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz
tar -xzf hadoop-3.3.6.tar.gz
mv hadoop-3.3.6 hadoop

sudo rm -rf hadoop-3.3.6.tar.gz


sed -i "/export HADOOP_HOME=/d" ~/.bashrc
echo "export HADOOP_HOME=\$HOME/hadoop" >> ~/.bashrc

echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/hadoop/etc/hadoop/hadoop-env.sh

mkdir -p /home/ubuntu/hadoop/data/datanode
mkdir -p /home/ubuntu/hadoop/data/namenode

sudo chown -R ubuntu /home/ubuntu/hadoop
