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

variable "aws_region" {
  default = "ap-northeast-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

variable "ingress_ports" {
  type = list(number)
  description = "list of ingress ports"
  default = [ 8200, 8201 ]
}

resource "aws_security_group" "vault" {
  name = "vault"
  description = "Ingress for Vault"
  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_ports

    iterator = port

    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "settings" {
  type = list(map(string))
  default = [
    {
      namespace = "aws:ec2:vpc"
      name = "VPCId"
      value = "vpc-XXXXXXXXXXXX"
    },
    {
      namespace = "aws:ec2:vpc"
      name = "Subnets"
      value = "vpc-XXXXXXXXXXXX"
    }
  ]
}

resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name = "tf_test-name"
  application = "test"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.11.4 running Go 1.12.6"

  dynamic "setting" {
    for_each = var.settings

    content {
      namespace = setting.value["namespace"]
      name = setting.value["name"]
      value = setting.value["value"]
    }
  }
}
