# cloud-bigdata-project

- Name: Nguyen Thanh Tung
- Student ID: 2440047


### Usage
To use the repository, the sh scripts are provided. the scripts are divided intofour groups:
- install*.sh: these are script to install the ansible, terraform and aws cli on fedora
- terraform_*.sh: these are script to manage the terraform provisioning
- ansible_*.sh these are script to install, start and stopspark and hadoop using ansible
- edge_*.sh these are script to use compile WordCount, upload file to hdfs, and submit spark app on the edge node
- gen_input.py, get_public_ips.sh: utils script for generating test input and getting server public ips


### Install ansible, terraform and aws cli

./install_ansible.sh
./install_aws_cli.sh
./terraform.sh

before running the terraform provision, remember to add the AWS access key to the path like in example-env.sh

### Provisioning the infrastruture
./terraform_provision_servers.sh <number-worker>

### Destroy the infrastruture
./terraform_destroy_servers.sh <number-worker>


### Update the ansible nodes.ini
./get_public_ips.sh


### Install spark, hadoop with ansible
./ansible_install_spark_hadoop.sh <number-worker>

### Start the cluster
./ansible_start_spark_hadoop.sh

### Stop the cluster
./ansible_stop_spark_hadoop.sh


### Gen the input file
./gen_input.py <number-of-words>


### Compile WordCount
./edge_compile_word_count.sh <edge-node-ip>

### Upload input file
./edge_upload_input_to_hdfs.sh <edge-node-ip>

### Submit the application to spark
./edge_spark_submit.sh <edge-node-ip>

### Clear hdfs spark output 
./edge_clear_hdfs_output.sh <edge-node-ip
