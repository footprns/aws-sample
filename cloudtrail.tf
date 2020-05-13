/*
module "simple-bucket" {
  source = "./modules/private_s3"
  bucket = "imank-bucket-test"
}
*/
module "cloudtrail" {
  source = "./modules/cloudtrail"
  name = "imank-cloudtrail-test"
  bucket = "imank-test-cloudtrail"
}