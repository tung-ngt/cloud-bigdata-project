output "master_public_ip" {
  value = module.ec2_instances.master_public_ip
}

output "master_private_ip" {
  value = module.ec2_instances.master_private_ip
}

output "edge_public_ip" {
  value = module.ec2_instances.edge_public_ip
}

output "edge_private_ip" {
  value = module.ec2_instances.edge_private_ip
}


output "worker_public_ip" {
  value = module.ec2_instances.worker_public_ip
}

output "worker_private_ip" {
  value = module.ec2_instances.worker_private_ip
}

