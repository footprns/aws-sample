module "tomcat-elb" {
  source = "./modules/elb"
  name = "tomcat-alb"
  security_groups = ["${module.security-group.id}"]
}
