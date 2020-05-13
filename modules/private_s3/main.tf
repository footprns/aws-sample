variable "bucket" {}

resource "aws_s3_bucket" "default" {
  bucket = var.bucket
  # acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

output "id" {
  value = aws_s3_bucket.default.id
}

output "bucket" {
  value = aws_s3_bucket.default.bucket
}

output "arn" {
  value = aws_s3_bucket.default.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.default.bucket_domain_name
}

output "policy" {
  value = aws_s3_bucket.default.policy
}
