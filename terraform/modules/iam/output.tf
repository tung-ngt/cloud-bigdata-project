output "spark_admin_key_id" {
  value     = aws_iam_access_key.spark_admin_key.id
  sensitive = true
}

output "spark_admin_key_secret" {
  value     = aws_iam_access_key.spark_admin_key.secret
  sensitive = true
}
