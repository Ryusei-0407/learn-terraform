output "ec2_private_ip" {
  value = module.webserver.ec2_private_ip
  description = "The private IP address of the main server instance."
}

