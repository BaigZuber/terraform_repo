#This is for providers

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


#This is for EC2 instance

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "TerraWorld"
  }
}


#This is for SSH Key

resource "aws_iam_user" "user" {
  name = "test-user"
  path = "/"
}

resource "aws_key_pair" "user" {
  key_name   = var.access_key
  public_key = file(var.secret_key)

}



#This is for security group
resource "aws_security_group" "example" {
  name           = "sg1"

dynamic "ingress" {
    for_each = [80,22,443]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

