variable "_count" {}
variable "log_destination" {}
variable "log_destination_type" {}
variable "vpc_id" {}



resource "aws_flow_log" "default" {
  count = var._count
#   iam_role_arn    = "${aws_iam_role.example.arn}"
  log_destination = var.log_destination
  log_destination_type = var.log_destination_type
  traffic_type    = "ALL"
  vpc_id          = var.vpc_id
}
