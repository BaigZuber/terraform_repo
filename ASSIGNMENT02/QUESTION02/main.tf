terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "AWS" {
  ami               = var.ami_id
  availability_zone = var.availability_zone
  instance_type     = var.instance_type
  #subnet_id         = var.subnet_id

  tags = {
    Name = "Instance_create"
  }
}

resource "aws_eip" "this_eip" {
  instance = var.instance_id
  domain   = "vpc"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id    = var.instance_id
  allocation_id  = var.allocation_id
}
