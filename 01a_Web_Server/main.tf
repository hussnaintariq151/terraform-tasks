
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-015627ae848dee040"
  availability_zone = "us-east-2a"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform01WebServer"
  }
}