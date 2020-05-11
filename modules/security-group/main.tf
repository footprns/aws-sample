# variable "name" {}
# variable "description" {}
# variable "vpc_id" {}


resource "aws_security_group" "default" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
#   vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "SSH from Intenet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["182.70.42.83/32"]
  }

  ingress {
    description = "RDP from Intenet"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["182.70.42.83/32"]
  }

  tags = {
    Name = "allow_ssh_rdp"
  }
}

output "name" {
  value = aws_security_group.default.name
}
