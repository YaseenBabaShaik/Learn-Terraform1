provider "aws" {
    region = "us-east-1"
}

data "aws_ami" "centos8" {
 most_recent = true
 name_regex   = "Cenos-8-DevOps-Practice"
 owners = ["259930424993"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "test-centos8"
  }
}