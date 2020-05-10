variable "vpc_id" {}
variable "cidr_block" {}
variable "availability_zone" {}


resource "aws_subnet" "default" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "Custom Subnet"
  }
}

output "id" {
  value = aws_subnet.default.id
}
output "arn" {
  value = aws_subnet.default.arn
}