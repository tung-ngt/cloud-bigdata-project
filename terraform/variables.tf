
variable "spark_admin_ssh_key_name" {
  type = string
  default = "spark_admin_ssh_key"
}


variable "spark_admin_ssh_key_path" {
  type = string
  default = "./spark_admin_ssh_key.pub"
}


variable "instance_type" {
    type = string
    default = "t3.micro"               # change instance type if needed
}

variable "namenode_ip" {
  type = string
  default = "172.31.0.101"
}

variable "datanode_count" {
    type = number
    default = 3                         # count = 3 = 3 aws EC2
}

variable "ips" {
    default = {
        "0" = "172.31.0.102"
        "1" = "172.31.0.103"
        "2" = "172.31.0.104"
        "3" = "172.31.0.105"
        "4" = "172.31.0.106"
        "5" = "172.31.0.107"
    }
}

variable "hostnames" {
    default = {
        "0" = "s02"
        "1" = "s03"
        "2" = "s04"
        "3" = "s05"
        "4" = "s06"
        "5" = "s07"
    }
}
