variable "name" {}

resource "aws_iam_group" "default" {
  name = var.name
  # path = "/"
}

output "id" {
  value = aws_iam_group.default.id
}

output "name" {
  value = aws_iam_group.default.name
}

output "arn" {
  value = aws_iam_group.default.arn
}

output "unique_id" {
  value = aws_iam_group.default.unique_id
}


resource "aws_iam_group_policy_attachment" "default" {
  group      = aws_iam_group.default.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# https://console.aws.amazon.com/iam/home?region=ap-southeast-1#policies/arn:aws:iam::aws:policy/AdministratorAccess