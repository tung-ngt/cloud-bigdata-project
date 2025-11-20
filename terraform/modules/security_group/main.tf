provider "aws" {
  region     = "us-east-1"
  access_key = var.spark_admin_key_id
  secret_key = var.spark_admin_key_secret
}

// Create security group
resource "aws_security_group" "spark_sc" {
    name = "spark_sc"

    # inbound internet access
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # outbound internet access
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    lifecycle {
        create_before_destroy = true
    }
}
