#This is provider block

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  # Configuration options
}


#This is for iam user

resource "aws_iam_user" "user1" {
  name = var.username
  path = var.path

  tags = {
    tag-key = var.tags
  }
}

resource "aws_iam_access_key" "user1" {
  user = aws_iam_user.user1.name
}

data "aws_iam_policy_document" "user_policy" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}


#This is for iam group

resource "aws_iam_group" "terra" {
  name = var.groupname
}