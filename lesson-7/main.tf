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

variable "aws_region" {
  default = "ap-northeast-1"
}

locals {
  # String
  string_var = "Matt Damon"

  # Stdout
  greeting = "Hello ${local.string_var}"

  # Number
  timeout_seconds = 60

  # Bool
  should_create_vpc = true

  # List
  aws_regions = ["us-west-1a", "us-west-1c"]

  # Map
  map = {
    name = "Demo"
    age  = 53
  }
}

variable "number_of_vpc" {
  default = 3
  type    = number
}

output "string_var" {
  value = local.string_var
}

output "greeting" {
  value = local.greeting
}

output "timeout_seconds" {
  value = local.timeout_seconds
}

output "should_create_vpc" {
  value = local.should_create_vpc
}

output "aws_region_list" {
  value = local.aws_regions
}

output "aws_region_list_1st_item" {
  value = local.aws_regions[0]
}

output "person_map" {
  value = local.map
}

output "person_map_name" {
  value = local.map["name"]
}
