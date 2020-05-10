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
  cidr_block = "10.0.0.0/17"
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
