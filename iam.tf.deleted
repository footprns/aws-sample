module "administrator-group" {
  source = "./modules/iam-group"
  name = "Administrators"
}

output "administrator-group-id" {
  value = module.administrator-group.id
}

output "administrator-group-arn" {
  value = module.administrator-group.arn
}
output "administrator_group_unique_id" {
  value = module.administrator-group.unique_id
}

module "aws-admin" {
  source = "./modules/iam-user"
  name = "aws-admin"
  groups = ["${module.administrator-group.name}"]
}
