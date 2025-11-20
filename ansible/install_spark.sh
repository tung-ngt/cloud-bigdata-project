#!/bin/bash
cd ~

wget https://dlcdn.apache.org/spark/spark-3.5.7/spark-3.5.7-bin-hadoop3.tgz
tar -xzf spark-3.5.7-bin-hadoop3.tgz
mv spark-3.5.7-bin-hadoop3.tgz spark

echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc
echo "export SPARK_HOME=\$HOME/spark" >> ~/.bashrc
echo "export PATH=\$PATH:\$SPARK_HOME/bin:\$SPARK_HOME/sbin" >> ~/.bashrc
