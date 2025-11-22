output "spark_vpc_id" {
  value = aws_vpc.spark_vpc.id
}

output "spark_subnet_id" {
  value = aws_subnet.spark_subnet.id
}
