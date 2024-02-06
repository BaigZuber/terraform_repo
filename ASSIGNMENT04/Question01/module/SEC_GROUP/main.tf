resource "aws_security_group" "this_sg" {
  name = var.M_sg_name

  ingress {
    from_port   = var.M_sg_ports
    to_port     = var.M_sg_ports
    protocol    = var.M_sg_protocol
    cidr_blocks = [var.M_sg_cidr]
  }

  ingress {
    from_port   = var.M_sg_ports
    to_port     = var.M_sg_ports
    protocol    = var.M_sg_protocol
    cidr_blocks = [var.M_sg_cidr]
  }

}
