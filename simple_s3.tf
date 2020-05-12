/*
resource "aws_s3_bucket" "default" {
  bucket = "imank-bucket-test"
}
*/
module "simple-bucket" {
  source = "./modules/private_s3"
  bucket = "imank-bucket-test"
}
data "aws_caller_identity" "current" {}
module "cloudtrail" {
  source = "./modules/cloudtrail"
  name = "imank-cloudtrail-test"
  s3_bucket_name = module.simple-bucket.bucket
}

module "test-user" {
  source = "./modules/users"
  name = "test-user"
}

output "user-arn" {
  value = module.test-user.arn
}

output "user-unique_id" {
  value = module.test-user.unique_id
}

resource "aws_s3_bucket_policy" "b" {
  # bucket = "${aws_s3_bucket.b.id}"
  bucket = module.simple-bucket.id
policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${module.simple-bucket.bucket}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${module.simple-bucket.bucket}/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
#   policy = <<POLICY
# {
#   "Id": "Policy1589045302849",
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "Stmt1589045298191",
#       "Action": "s3:*",
#       "Effect": "Allow",
#       "Resource": "${module.simple-bucket.arn}",
#       "Principal": {
#         "AWS": [
#           "${module.test-user.unique_id}"
#         ]
#       }
#     }
#   ]
# }
# POLICY
}