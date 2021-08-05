variable "aws_region" {
  default = "ap-northeast-1"
}

variable "amis" {
  type = map(any)
  default = {
    us-east-1      = "ami-13be557e"
    us-west-2      = "ami-06b94666"
    ap-northeast-1 = "ami-09ebacdc178ae23b7"
  }
}

