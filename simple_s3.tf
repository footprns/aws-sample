resource "aws_s3_bucket" "default" {
  bucket = "imank-bucket-test"
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
  bucket = aws_s3_bucket.default.id
  policy = <<POLICY
{
  "Id": "Policy1589045302849",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1589045298191",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.default.arn}",
      "Principal": {
        "AWS": [
          "${module.test-user.unique_id}"
        ]
      }
    }
  ]
}
POLICY
}