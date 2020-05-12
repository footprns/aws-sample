variable "name" {}
variable "s3_bucket_name" {}


resource "aws_cloudtrail" "default" {
  name                          = var.name
  s3_bucket_name                = var.s3_bucket_name
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
}