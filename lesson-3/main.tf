terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "image_id" {
  type = string
  description = "The id of the number image (AMI) to use for the server."
  default = "ami-abc123"

  # sensitive = true
}

resource "aws_instance" "web" {
  ami = var.image_id
  instance_type = "t2.micro"
}

variable "aws_region" {
  default = "ap-northeast-1"
}

