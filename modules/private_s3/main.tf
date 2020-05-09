resource "aws_s3_bucket" "default" {
  bucket = "imank-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

output "bucket_domain_name" {
  value = aws_s3_bucket.default.bucket_domain_name
}

output "policy" {
  value = aws_s3_bucket.default.policy
}
