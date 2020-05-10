variable "route_table_id" {}
variable "destination_cidr_block" {}
variable "vpc_peering_connection_id" {}


resource "aws_route" "default" {
  route_table_id            = var.route_table_id
  destination_cidr_block    = var.destination_cidr_block
  vpc_peering_connection_id = var.vpc_peering_connection_id
#   depends_on                = ["aws_route_table.testing"]
}