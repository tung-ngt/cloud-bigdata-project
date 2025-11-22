#!/bin/bash
cd ~

# make sure clear
sudo rm -rf spark-3.5.7-bin-hadoop3.tgz
sudo rm -rf spark
sudo rm -rf spark-3.5.7-bin-hadoop3

wget https://dlcdn.apache.org/spark/spark-3.5.7/spark-3.5.7-bin-hadoop3.tgz
tar -xzf spark-3.5.7-bin-hadoop3.tgz
mv spark-3.5.7-bin-hadoop3 spark

sudo rm -rf spark-3.5.7-bin-hadoop3.tgz


sed -i "/export JAVA_HOME=/d" ~/.bashrc
sed -i "/export SPARK_HOME=/d" ~/.bashrc

echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc
echo "export SPARK_HOME=\$HOME/spark" >> ~/.bashrc

echo "export SPARK_MASTER_HOST=master" >> ~/spark/conf/spark-env.sh
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/spark/conf/spark-env.sh
