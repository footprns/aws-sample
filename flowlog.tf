module "bucket-for-flowlog" {
  source = "./modules/private_s3"
  bucket = "imank-flowlog"
}

module "flowlog" {
  source = "./modules/flowlog"
  _count = 1
  vpc_id = "vpc-4cc2dd2b"
  log_destination_type = "s3"
  log_destination      = module.bucket-for-flowlog.arn
}
