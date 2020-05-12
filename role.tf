module "custom-role" {
  source = "./modules/iam-role"
  name = "custom-role"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
