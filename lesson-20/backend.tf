resource "random_integer" "digits" {
  min = 1
  max = 100

  keepers = {
    listener_arn = var.s3_bucket_name
  }
}

variable "s3_bucket_name" {
  default = "terraform-backend-remote-state-aws-demo"
}

# S3 bucket
resource "aws_s3_bucket" "terraform-backend-remote-state" {
  bucket = "${var.s3_bucket_name}-${random_integer.digits.result}"

  # lifecycle {
  #   prevent_destroy = true
  # }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Environment = "prod"
    Terraform   = "true"
    Name        = var.s3_bucket_name
  }
}

resource "aws_dynamodb_table" "terraform-backend-state-lock" {
  name         = "terraform-backend-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = "prod"
    Terraform   = "true"
  }
}

