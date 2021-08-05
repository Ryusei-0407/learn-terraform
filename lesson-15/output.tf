output "id" {
  description = "Instance ID."
  value = aws_instance.example.id
}

output "arn" {
  description = "ARN of the instance."
  value = aws_instance.example.arn
}

output "availability_zone" {
  description = "Availability zone of the instance."
  value = aws_instance.example.availability_zone
}

output "placement_group" {
  description = "Placement group of the instance."
  value = aws_instance.example.placement_group
}

output "key_name" {
  description = "Key name of the instance."
  value = aws_instance.example.key_name
}

output "password_data" {
  description = "Password data of the instance."
  value = aws_instance.example.password_data
}

output "public_dns" {
  description = "Public DNS of the instance."
  value = aws_instance.example.public_dns
}

output "public_ip" {
  description = "Public IP of the instance."
  value = aws_instance.example.public_ip
}

output "ipv6_address" {
  description = "IPv6 address of the instance."
  value = aws_instance.example.ipv6_addresses
}

output "primary_network_interface_id" {
  description = "Primary network interface ID of the instance."
  value = aws_instance.example.primary_network_interface_id
}

output "private_dns" {
  description = "Private DNS of the instance."
  value = aws_instance.example.private_ip
}

output "private_ip" {
  description = "Private ip of the instance."
  value = AWS_INSTANCE.EXAMPLE.PRIVATE_DNS
}

output "security_group" {
  description = "Security group of instance"
  value = aws_instance.example.security_groups
}

output "vpc_security_group_ids" {
  description = "Vpc security group IDs of the instance."
  value = aws_instance.example.vpc_security_group_ids
}

output "subnet_id" {
  description = "Subnet ID of the instance."
  value = aws_instance.example.subnet_id
}

output "outpost_arn" {
  description = "Outpost ARN of the instance."
  value = aws_instance.example.outpost_arn
}

