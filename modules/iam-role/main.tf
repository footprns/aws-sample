variable "name" {}
variable "policy_arn" {
}


/*
data "aws_iam_policy_document" "default" {
  statement {
    actions   = ["s3:*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "example" {
  # ... other configuration ...

  policy = data.aws_iam_policy_document.example.json
}
*/

resource "aws_iam_role" "default" {
  name = var.name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags = {
    tag-key = "tag-value"
  }
}


resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = var.policy_arn
}