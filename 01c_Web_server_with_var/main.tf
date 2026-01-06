provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-015627ae848dee040"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "Terraform01WebServer"
  }
}


resource "aws_security_group" "instance" {

  name = "var.security_group_name"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}