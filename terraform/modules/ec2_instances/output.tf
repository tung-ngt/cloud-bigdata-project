output "master_public_ip" {
  value = aws_instance.master.public_ip
}

output "master_private_ip" {
  value = aws_instance.master.private_ip
}

output "edge_public_ip" {
  value = aws_instance.edge.public_ip
}

output "edge_private_ip" {
  value = aws_instance.edge.private_ip
}

output "worker_public_ip" {
  value = aws_instance.worker[*].public_ip
}

output "worker_private_ip" {
  value = aws_instance.worker[*].private_ip
}
