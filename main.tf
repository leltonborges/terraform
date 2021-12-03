provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_instance" "dev" {
  count         = 3
  ami           = "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acess-ssh.id}"]
}

resource "aws_instance" "dev4" {
  ami           = "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acess-ssh.id}"]
  depends_on = [
    aws_s3_bucket.bucket-dev4
  ]
}

resource "aws_instance" "dev5" {
  ami           = "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  key_name      = "terraform-aws"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acess-ssh.id}"]
}

