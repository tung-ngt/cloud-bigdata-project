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
  public_key = file("${var.spark_admin_ssh_key_path}.pub")
}


// Run the instance
resource "aws_instance" "master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "master"
  }

  vpc_security_group_ids = [var.security_group_id]
  subnet_id = var.spark_subnet_id
  private_ip =  "10.0.1.10"


  key_name = aws_key_pair.spark_admin_ssh_key.key_name

  provisioner "remote-exec" {
    inline = [
      "sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config",
      "sudo systemctl restart ssh"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file(var.spark_admin_ssh_key_path)
    }
  }
}


// Run the instance
resource "aws_instance" "edge" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "edge"
  }

  vpc_security_group_ids = [var.security_group_id]
  subnet_id = var.spark_subnet_id
  private_ip =  "10.0.1.11"


  key_name = aws_key_pair.spark_admin_ssh_key.key_name

  provisioner "remote-exec" {
    inline = [
      "sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config",
      "sudo systemctl restart ssh"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file(var.spark_admin_ssh_key_path)
    }
  }
}


resource "aws_instance" "worker" {
  count = var.worker_count

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = lookup(var.hostnames, count.index)
  }

  vpc_security_group_ids = [var.security_group_id]
  subnet_id = var.spark_subnet_id
  private_ip = lookup(var.ips, count.index)

  key_name = aws_key_pair.spark_admin_ssh_key.key_name

  provisioner "remote-exec" {
    inline = [
      "sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config",
      "sudo systemctl restart ssh"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file(var.spark_admin_ssh_key_path)
    }
  }
}
