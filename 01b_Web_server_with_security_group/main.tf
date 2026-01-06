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

  name = "Allow web traffic"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}