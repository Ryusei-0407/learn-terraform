module "webserver" {
  source = "./modules/ec2"

  module_instance_type = var.root_level_instance_type
}
