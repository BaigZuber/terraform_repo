variable "aws_region" {
  type = string
}

variable "cidr" {
  type = string
}

variable "resource_name" {
  type = string
}

variable "subnets" {
  type = object({
    cidr-pub01 = string,
    cidr-pub02 = string,
    cidr-pvt01 = string,
    cidr-pvt02 = string
  })
}

variable "nat_allocation" {
  type = string
}

variable "nat_gateway" {
  type = string

}

variable "route_cidr01" {
  type = string
}

variable "route_cidr02" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair" {
  type = string
}
