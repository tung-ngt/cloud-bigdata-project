output "namenode_public_ip" {
  value = aws_instance.namenode.public_ip
}

output "namenode_private_ip" {
  value = aws_instance.namenode.private_ip
}

output "datanode_public_ip" {
  value = aws_instance.datanode[*].public_ip
}

output "datanode_private_ip" {
  value = aws_instance.datanode[*].private_ip
}
