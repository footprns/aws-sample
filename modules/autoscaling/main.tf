variable "name" {}
variable "image_id" {}
variable "instance_type" {}
variable "min_size" {}
variable "max_size" {}
variable "vpc_zone_identifier" {
  type = list
}
variable "key_name" {}
variable "security_groups" {
  type = list
}
variable "_count" {}




resource "aws_launch_configuration" "default" {
  count = var._count
#   name          = var.name
  name_prefix     = var.name
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = var.security_groups
  user_data = <<EOM
sudo yum -y install https://repo.saltstack.com/py3/amazon/salt-py3-amzn2-repo-latest.amzn2.noarch.rpm
sudo yum -y clean expire-cache
sudo yum -y install salt-minion
  EOM
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "default" {
  count = var._count
  name                 = aws_launch_configuration.default[count.index].name
  launch_configuration = aws_launch_configuration.default[count.index].name
  min_size             = var.min_size
  max_size             = var.max_size
  vpc_zone_identifier = var.vpc_zone_identifier 

  lifecycle {
    create_before_destroy = true
  }
}