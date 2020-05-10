variable "vpc_id" {}
variable "service_name" {}
variable "route_table_ids" {
  type = list
}


resource "aws_vpc_endpoint" "default" {
  vpc_id       = var.vpc_id
  service_name = var.service_name
  route_table_ids = var.route_table_ids

  tags = {
    Environment = "Custom ENV"
  }
}

output "id" {
  value = aws_vpc_endpoint.default.id
}
