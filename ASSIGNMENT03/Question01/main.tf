terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  # Configuration options
}


#this is for ec2 instance

resource "aws_instance" "web" {
  ami           = "ami-0a3c3a20c09d6f377"
  instance_type = "t2.micro"

  tags = {
    Name = "31jan-instance"
  }
}

 resource "aws_ami_from_instance" "my_ami" {
 name                      = "ami_id"
 source_instance_id        = aws_instance.web.id
 }

data "aws_instances" "test" {
  instance_tags = {
    Role = "Hardy"
  }

  filter {
    name   = "image-id"
    values = [aws_ami_from_instance.my_ami.id]
  }
}
