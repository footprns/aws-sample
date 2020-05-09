resource "aws_s3_bucket" "default" {
  bucket = var.bucket
#   acl    = "public-read"
#   grant {
#                 id = ""
#                 permissions = ["READ"]
#                 type = "Group"
#                 uri = "http://acs.amazonaws.com/groups/global/AllUsers"
#               }
#   grant {
#                 id = "dc35113224e25fc28ede860ef4a52556d5a27aa5fcdece6bbc818228273e0c42"
#                 permissions = ["FULL_CONTROL"]
#                 type = "CanonicalUser"
#                 uri = ""
#               }
#   policy = var.policy

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}