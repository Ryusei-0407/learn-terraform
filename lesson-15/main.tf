resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_block

  tags = {
    Name = "main-subnet"
  }
}

resource "aws_instance" "example" {
  ami           = lookup(var.amis, var.aws_region)
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main.id

  tags = {
    Name      = "tf-demo"
    terraform = "true"
  }
}
