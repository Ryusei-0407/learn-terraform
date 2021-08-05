resource "aws_instance" "web" { 

  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.module_instance_type
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "vault" {
  name        = "webserver-security-group"
  description = "Ingress for HTTP and HTTPS traffic"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.security_group_ingress_ports

    iterator = port 

    content { 
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
