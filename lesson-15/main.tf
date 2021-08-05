resource "aws_instance" "example" {
  ami           = lookup(var.amis, var.aws_region)
  instance_type = var.instance_type

  tags = {
    Name      = "tf-demo"
    terraform = "true"
  }
}
