variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "security_groups" {
  type = list
}


resource "aws_instance" "default" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = var.security_groups
  root_block_device  {
      volume_type = "standard" # magnetic 
  }
  tags = {
    Name = "HelloWorld"
  }
}

output "public_ip" {
  value = aws_instance.default.public_ip
}
