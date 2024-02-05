P_key_name      = "module_key"
P_public        = "/root/.ssh/id_rsa.pub"
P_sg_name       = "module_sec_sg"
P_sg_desc       = "MODULE_SEC_GR"
P_sg_ports      = "80"
P_sg_protocol   = "tcp"
P_sg_cidr       = "0.0.0.0/0"
P_ami_id        = "ami-0277155c3f0ab2930"
P_instance_type = "t2.micro"

####### FOR WEB SERVER

W_key_name      = "web_key"
W_public        = "/root/.ssh/id_rsa.pub"
W_sg_name       = "web_sec_sg"
W_sg_desc       = "WEB_SEC_GR"
W_sg_ports      = "443"
W_sg_protocol   = "tcp"
W_sg_cidr       = "0.0.0.0/0"
W_ami_id        = "ami-0277155c3f0ab2930"
W_instance_type = "t2.micro"

####### FOR APP SERVER

A_key_name      = "app_key"
A_public        = "/root/.ssh/id_rsa.pub"
A_sg_name       = "app_sec_sg"
A_sg_desc       = "APP_SEC_GR"
A_sg_ports      = "22"
A_sg_protocol   = "tcp"
A_sg_cidr       = "0.0.0.0/0"
A_ami_id        = "ami-0277155c3f0ab2930"
A_instance_type = "t2.micro"
