terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {}

variable "amis" {
  type = map(any)
  default = {
    us-east-1      = "ami-13be557e"
    us-west-2      = "ami-06b94666"
    ap-northeast-1 = "ami-09ebacdc178ae23b7"
  }
}

resource "aws_instance" "example" {
  ami           = lookup(var.amis, var.aws_region)
  instance_type = "t2.micro"

  tags = {
    terraform = "true"
  }
}
