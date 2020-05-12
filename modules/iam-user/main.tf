variable "name" {}
variable "groups" {
  type = list
}


resource "aws_iam_user" "default" {
  name = var.name
#   path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

output "name" {
  value = aws_iam_user.default.name
}
output "unique_id" {
  value = aws_iam_user.default.unique_id
}
output "arn" {
  value = aws_iam_user.default.arn
}

resource "aws_iam_user_group_membership" "default" {
  user = aws_iam_user.default.name

  groups = var.groups
}