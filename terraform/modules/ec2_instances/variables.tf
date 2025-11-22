variable "spark_subnet_id" {
  type = string
}


variable "spark_admin_key_id" {
  type = string
}

variable "spark_admin_key_secret" {
  type = string
}


variable "spark_admin_ssh_key_name" {
  type = string
}

variable "spark_admin_ssh_key_path" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "worker_count" {
    type = number
    default = 2
}

variable "hostnames" {
    default = {
        "0" = "worker1"
        "1" = "worker2"
        "2" = "worker3"
        "3" = "worker4"
        "4" = "worker5"
        "5" = "worker6"
    }
}


variable "ips" {
    default = {
        "0" = "10.0.1.12"
        "1" = "10.0.1.13"
        "2" = "10.0.1.14"
        "3" = "10.0.1.15"
        "4" = "10.0.1.16"
        "5" = "10.0.1.17"
    }
}
