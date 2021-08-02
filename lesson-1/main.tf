terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
}

resource "aws_instance" "web" {
  ami           = "ami-09ebacdc178ae23b7"
  instance_type = "t2.micro"

  tags = {
    Name = "web-demo"
  }
}

resource "aws_instance" "app" {
  ami           = "ami-09ebacdc178ae23b7"
  instance_type = "t2.micro"

  tags = {
    Name = "app-demo"
  }
}

variable "aws_region" {
  default = "ap-northeast-1"
}

