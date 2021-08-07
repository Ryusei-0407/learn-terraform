terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = ">= 0.12.28"

  # backend "s3" {
  #   bucket         = "terraform-backend-remote-state-aws-demo-23"
  #   key            = "infra/ap-northeast-1/prod/terraform.tfstate"
  #   region         = "ap-northeast-1"
  #   dynamodb_table = "terraform-backend-state-lock"
  #   encrypt        = true
  # }
}
