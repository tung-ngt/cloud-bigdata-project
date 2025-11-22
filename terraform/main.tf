// module for creating a spark admin user
module "iam" {
  source = "./modules/iam"
}

// module for provisioning a vpc
module "vpc" {
  source = "./modules/vpc"
  spark_admin_key_id = module.iam.spark_admin_key_id  
  spark_admin_key_secret = module.iam.spark_admin_key_secret  
}

// module for creating the security_group
module "security_group" {
  source = "./modules/security_group"
  spark_admin_key_id = module.iam.spark_admin_key_id  
  spark_admin_key_secret = module.iam.spark_admin_key_secret  
  spark_vpc_id = module.vpc.spark_vpc_id
}

// module for creating the server instances
module "ec2_instances" {
  source = "./modules/ec2_instances"
  spark_admin_key_id = module.iam.spark_admin_key_id  
  spark_admin_key_secret = module.iam.spark_admin_key_secret  

  security_group_id = module.security_group.security_group_id  

  spark_admin_ssh_key_name = var.spark_admin_ssh_key_name
  spark_admin_ssh_key_path = var.spark_admin_ssh_key_path

  spark_subnet_id = module.vpc.spark_subnet_id

  worker_count = var.worker_count
}

