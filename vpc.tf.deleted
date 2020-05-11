module "custom_vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

output "custom_vpc_arn" {
  value = module.custom_vpc.arn
}

output "custom_vpc_id" {
  value = module.custom_vpc.id
}

module "custom_subnet" {
  source = "./modules/subnet"
  vpc_id = module.custom_vpc.id
  cidr_block = "10.0.0.0/26"
  availability_zone = "ap-southeast-1a"
}

output "custom_subnet_id" {
  value = module.custom_subnet.id
}

output "custom_subnet_arn" {
  value = module.custom_subnet.arn
}

module "eip" {
  source = "./modules/eip"
}

output "eip_id" {
  value = module.eip.id
}
output "eip_public_ip" {
  value = module.eip.public_ip
}

module "s3_endpoint" {
  source = "./modules/endpoint"
  vpc_id = module.custom_vpc.id
  service_name = "com.amazonaws.ap-southeast-1.s3"
  route_table_ids = ["rtb-020dcac7b7ce13c90"]
}

module "vpc_peering" {
  source = "./modules/vpc_peering"
  vpc_id = module.custom_vpc.id
  peer_vpc_id = "vpc-4cc2dd2b"
}

module "custom-default" {
  source = "./modules/route"
  route_table_id = "rtb-020dcac7b7ce13c90"
  destination_cidr_block = "172.31.0.0/16"
  vpc_peering_connection_id = module.vpc_peering.id
}

module "default-custom" {
  source = "./modules/route"
  route_table_id = "rtb-57ef8c31"
  destination_cidr_block = "10.0.0.0/16"
  vpc_peering_connection_id = module.vpc_peering.id
}

module "custom_nat_gateway" {
  source = "./modules/nat-gateway"
  allocation_id = module.eip.id
  subnet_id = module.custom_subnet.id
}
/*
module "custom-internet" {
  source = "./modules/route"
  route_table_id = "rtb-020dcac7b7ce13c90"
  destination_cidr_block = "0.0.0.0/0"
  vpc_peering_connection_id = module.custom_nat_gateway.id
}
*/
