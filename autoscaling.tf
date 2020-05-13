module "custom-autoscaling" {
  source = "./modules/autoscaling"
  _count = 1
  name = "cust01"
  image_id = "ami-0ec225b5e01ccb706" # amazon linux
  instance_type = "t2.micro"
  key_name = module.imank-sshkey.key_name
  security_groups = ["${module.security-group.id}"]
  min_size = 2
  max_size = 3
  vpc_zone_identifier = ["subnet-445cac0c", "subnet-6b07b832", "subnet-cab073ac"] 
}
/*
module "az-a" {
  source = "./modules/eip"
  name = "az-a"
}
module "az-a_nat_gateway" {
  source = "./modules/nat-gateway"
  name = "az-a-gateway"
  allocation_id = module.az-a.id
  subnet_id = "subnet-cab073ac"
}

module "az-b" {
  source = "./modules/eip"
  name = "az-b"
}
module "az-b_nat_gateway" {
  source = "./modules/nat-gateway"
  name = "az-b-gateway"
  allocation_id = module.az-b.id
  subnet_id = "subnet-445cac0c"
}

module "az-c" {
  source = "./modules/eip"
  name = "az-c"
}
module "az-c_nat_gateway" {
  source = "./modules/nat-gateway"
  name = "az-c-gateway"
  allocation_id = module.az-c.id
  subnet_id = "subnet-6b07b832"
}
*/