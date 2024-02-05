resource "aws_key_pair" "this_key" {
  key_name   = var.M_key_name
  public_key = var.M_public
}
