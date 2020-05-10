variable "cidr_block" {}

resource "aws_vpc" "default" {
    cidr_block = var.cidr_block
    enable_dns_hostnames = true
    tags = {
    Name = "custom vpc"
    }
}

output "arn" {
  value = aws_vpc.default.arn
}

output "id" {
  value = aws_vpc.default.id
}