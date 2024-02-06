module "SSH_KEY_PAIR" {
  source     = "./module/SSH_KEY"
  M_key_name = var.P_key_name
  M_public   = file(var.P_public)
}
module "SECURITY_GROUP" {
  source        = "./module/SEC_GROUP"
  M_sg_name     = var.P_sg_name
  M_sg_desc     = var.P_sg_desc
  M_sg_ports    = var.P_sg_ports
  M_sg_protocol = var.P_sg_protocol
  M_sg_cidr     = var.P_sg_cidr
}
module "EC2_INSTANCE" {
  source          = "./module/EC2_INSTANCE"
  M_ami_id        = var.P_ami_id
  M_instance_type = var.P_instance_type
  M_key_name      = module.SSH_KEY_PAIR.out_key_pair 
  M_sg_name       = module.SECURITY_GROUP.out_sg_name
}

####### FOR WEB SERVER
module "WEB_SSH_KEY_PAIR" {
  source     = "./module/SSH_KEY"
  M_key_name = var.W_key_name
  M_public   = file(var.W_public)
}
module "WEB_SECURITY_GROUP" {
  source        = "./module/SEC_GROUP"
  M_sg_name     = var.W_sg_name
  M_sg_desc     = var.W_sg_desc
  M_sg_ports    = var.W_sg_ports
  M_sg_protocol = var.W_sg_protocol
  M_sg_cidr     = var.W_sg_cidr
}
module "WEB_EC2_INSTANCE" {
  source          = "./module/EC2_INSTANCE"
  M_ami_id        = var.W_ami_id
  M_instance_type = var.W_instance_type
  M_key_name      = module.WEB_SSH_KEY_PAIR.out_key_pair 
  M_sg_name       = module.WEB_SECURITY_GROUP.out_sg_name
}

####### FOR APP SERVER
module "APP_SSH_KEY_PAIR" {
  source     = "./module/SSH_KEY"
  M_key_name = var.A_key_name
  M_public   = file(var.A_public)
}
module "APP_SECURITY_GROUP" {
  source        = "./module/SEC_GROUP"
  M_sg_name     = var.A_sg_name
  M_sg_desc     = var.A_sg_desc
  M_sg_ports    = var.A_sg_ports
  M_sg_protocol = var.A_sg_protocol
  M_sg_cidr     = var.A_sg_cidr
}
module "APP_EC2_INSTANCE" {
  source          = "./module/EC2_INSTANCE"
  M_ami_id        = var.A_ami_id
  M_instance_type = var.A_instance_type
  M_key_name      = module.APP_SSH_KEY_PAIR.out_key_pair 
  M_sg_name       = module.APP_SECURITY_GROUP.out_sg_name
}
