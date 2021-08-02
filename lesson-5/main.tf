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
  description = "The image (AMI) to use for the server."
  default     = "ami-abc123"
}

variable "amis" {
  type = map(any)
  default = {
    us-east-1      = "ami-abc123"
    us-west-2      = "ami-abc123"
    ap-northeast-1 = "ami-09ebacdc178ae23b7"
  }
}

locals {
  image_id = "ami-09ebacdc178ae23b7"
  ami_id   = "abcdefghijklmnopqrstuv"
}

resource "aws_instance" "web" {
  ami           = local.image_id
  instance_type = "t2.micro"
}

output "instance_ip_add" {
  value       = aws_instance.web.private_ip
  description = "The private IP address of the main server instance."
}

variable "aws_region" {
  default = "ap-northeast-1"
}
