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
    default = "t3.micro"
}

variable "datanode_count" {
    type = number
    default = 2
}

variable "hostnames" {
    default = {
        "0" = "d1"
        "1" = "d2"
        "2" = "d3"
        "3" = "d4"
        "4" = "d5"
        "5" = "d6"
    }
}
