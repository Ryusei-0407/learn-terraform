output "ec2_private_ip" {
  value = aws_instance.web.private_ip
  description = "The private IP address of the main server instance."
}

