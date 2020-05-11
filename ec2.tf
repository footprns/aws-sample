module "imank-sshkey" {
  source = "./modules/key-pair"
  key_name = "imank-sshkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAoeoVycrIC60QoiHk9Sy59Z6iI8HAM3i+CZoPlUy5xucTq2DaJ6AuPV9rIiC9QV4xdPmBm/UnNTjWhdRl1Cg382y/ar5rLr3cc76Rzkj+rxLWick1CP1oFvmhaaEaxZEAtnO3HHcKGTWYc6+VBg1c8CUl3p4hCuRz8XYZI/Jzu0oYfp0jymoW9zbYvxjsxUceuHcx7m4gFEu9S5iZotRMc0eUwk9sOOw+pwr5o/Ynkcgo4XvdFzOwHcbSAFxRsbSC+4zlzFJYwVukFpQbrz27B8xWic0y4YsenCiFh+qkRmwRQI2Kfx34bhFYtG4kiZgXZcsBJ8eTrSyETd16SHcknw=="
}

output "key_pair_id" {
  value = module.imank-sshkey.key_pair_id
}

output "key_name" {
  value = module.imank-sshkey.key_name
}

module "security-group" {
  source = "./modules/security-group"
}


module "ec2" {
  source = "./modules/ec2"
  name = "amazon-linux"
  ami = "ami-0ec225b5e01ccb706" # amazon linux
  instance_type = "t2.micro"
  key_name = module.imank-sshkey.key_name
  security_groups = ["${module.security-group.name}"]
  get_password_data = false
  volume_type = "standard" # magnetic 
}

output "public_ip" {
  value = module.ec2.public_ip
}

module "ec2_win" {
  source = "./modules/ec2"
  name = "amazon-win"
  ami = "ami-0fdb514b22fa2aed1" # Microsoft Windows Server 2019 Base
  instance_type = "t2.micro"
  key_name = module.imank-sshkey.key_name
  security_groups = ["${module.security-group.name}"]
  get_password_data = true
  volume_type = "gp2" # SSD 
}

output "public_ip_win" {
  value = module.ec2_win.public_ip
}
output "password_data_win" {
  value = rsadecrypt(module.ec2_win.password_data,var.ssh-private-key)
}


