provider "aws" {
  region     = "us-east-1"
  access_key = var.spark_admin_key_id
  secret_key = var.spark_admin_key_secret
}

// Get the ubuntu aws image ami
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "spark_admin_ssh_key" {
  key_name   = var.spark_admin_ssh_key_name
  public_key = file("${var.spark_admin_ssh_key_path}")
}


// Run the instance
resource "aws_instance" "namenode" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "namenode"
  }

  vpc_security_group_ids = [var.security_group_id]


  key_name = aws_key_pair.spark_admin_ssh_key.key_name

  user_data = <<EOF
#!/bin/bash
# Disable password login
sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd
EOF

}

resource "aws_instance" "datanode" {
  count = var.datanode_count

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = lookup(var.hostnames, count.index)
  }

  vpc_security_group_ids = [var.security_group_id]


  key_name = aws_key_pair.spark_admin_ssh_key.key_name

  user_data = <<EOF
#!/bin/bash
# Disable password login
sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd
EOF

}
