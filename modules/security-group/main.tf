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
    cidr_blocks = ["182.70.42.83/32", "223.229.208.230/32"]
  }

  ingress {
    description = "RDP from Intenet"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["182.70.42.83/32", "223.229.208.230/32"]
  }

  ingress {
    description = "Tomcat from Intenet"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ALB from Intenet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow_ssh_rdp"
  }
}

output "name" {
  value = aws_security_group.default.name
}
output "id" {
  value = aws_security_group.default.id
}
