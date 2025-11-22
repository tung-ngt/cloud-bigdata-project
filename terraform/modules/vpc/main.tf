provider "aws" {
  region     = "us-east-1"
  access_key = var.spark_admin_key_id
  secret_key = var.spark_admin_key_secret
}

resource "aws_vpc" "spark_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "spark_vpc"
  }
}


resource "aws_subnet" "spark_subnet" {
  vpc_id            = aws_vpc.spark_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "spark_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.spark_vpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.spark_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rt_assoc" {
  subnet_id      = aws_subnet.spark_subnet.id
  route_table_id = aws_route_table.rt.id
}

