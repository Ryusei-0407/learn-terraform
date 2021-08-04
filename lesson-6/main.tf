terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default     = "ami-abc123"
}

variable "amis" {
  type = map(any)
  default = {
    us-east-1      = "ami-oasdjgashgdlas"
    us-west-2      = "ami-oasdjgashgdlas"
    ap-northeast-1 = "ami-09ebacdc178ae23b7"
  }
}

locals {
  image_id = "ami-09ebacdc178ae23b7"
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.amazon_linux_2.id
}

data "aws_instance" "web" {
  filter {
    name   = "image-id"
    values = [data.aws_ami.amazon_linux_2.id]
  }
}

output "ec2_from_fetched_ami" {
  value = data.aws_instance.web.id
}

output "ec2_from_aws_instance_resource" {
  value = aws_instance.web.id
}

output "instance_ip_address" {
  value       = aws_instance.web.private_ip
  description = "The private IP address of the main server instance."
}

variable "aws_region" {
  default = "ap-northeast-1"
}
