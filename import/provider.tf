
# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "ap-southeast-1"
#   shared_credentials_file = "~/.aws/rootkey.csv"
}

# resource "aws_s3_bucket" "bucket" {
#   # (resource arguments)
# }

resource "aws_lambda_function" "test_lambda" {
  # (resource arguments)
}