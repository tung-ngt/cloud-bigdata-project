output "namenode_public_ip" {
  value = module.ec2_instances.namenode_public_ip
}

output "namenode_private_ip" {
  value = module.ec2_instances.namenode_private_ip
}

output "datanode_public_ip" {
  value = module.ec2_instances.datanode_public_ip
}

output "datanode_private_ip" {
  value = module.ec2_instances.datanode_private_ip
}
