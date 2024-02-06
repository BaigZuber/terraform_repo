terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  
}

resource "aws_instance" "this_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_pair
  subnet_id     = aws_subnet.public_subnet01.id

  tags = {
    Name = "instance"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr

  tags = {
    Name = var.resource_name
  }
}


resource "aws_subnet" "public_subnet01" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnets.cidr-pub01
  availability_zone = "us-east-1a"
  tags = {
    Name = "pub_subnet01"
  }
}
resource "aws_subnet" "public_subnet02" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnets.cidr-pub02
  availability_zone = "us-east-1b"
  tags = {
    Name = "pub_subnet02"
  }
}

resource "aws_subnet" "private_subnet01" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnets.cidr-pvt01

}

resource "aws_subnet" "private_subnet02" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnets.cidr-pvt02

}

resource "aws_internet_gateway" "this_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id

}
resource "aws_eip" "loadbalancer" {
  domain = "vpc"
}

resource "aws_nat_gateway" "this_nat_gateway" {
  allocation_id = aws_eip.loadbalancer.id
  subnet_id     = aws_subnet.private_subnet01.id

  tags = {
    Name = var.nat_gateway
  }
}

resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = var.route_cidr01
    gateway_id = aws_nat_gateway.this_nat_gateway.id
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block     = var.route_cidr02
    nat_gateway_id = aws_nat_gateway.this_nat_gateway.id
  }
}