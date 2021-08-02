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
    us-east-1      = "ami-13be557e"
    us-west-2      = "ami-06b94666"
    ap-northeast-1 = "ami-09ebacdc178ae23b7"
  }
}

resource "aws_instance" "web" {
  ami           = lookup(var.amis, var.aws_region)
  instance_type = "t2.micro"
}

output "instance_id_addr" {
  value       = aws_instance.web.private_ip
  description = "The private IP address of the main server instance."
}

variable "aws_region" {
  default = "ap-northeast-1"
}

