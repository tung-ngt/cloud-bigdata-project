variable "spark_admin_ssh_key_name" {
  type = string
  default = "spark_admin_ssh_key"
}


variable "spark_admin_ssh_key_path" {
  type = string
  default = "../keys/spark_admin_ssh_key"
}


variable "worker_count" {
    type = number
    default = 2
}
