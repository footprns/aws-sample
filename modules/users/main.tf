variable "name" {}

resource "aws_iam_user" "default" {
  name = var.name
#   path = "/system/"

  tags = {
    user_type = "testing"
  }
}

output "arn" {
  value = aws_iam_user.default.arn
}
output "unique_id" {
  value = aws_iam_user.default.unique_id
}