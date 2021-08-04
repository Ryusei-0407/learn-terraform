locals {
  should_create_vpc = true

  num_of_subnets = local.should_create_vpc == true ? 3 : 0
}

output "num_of_subnets" {
  value = local.num_of_subnets
}
