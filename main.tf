terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

provider "aws" {
  alias   = "us-east-2"
  region  = "us-east-2"
}

resource "aws_instance" "dev" {
  count         = 3
  ami           = var.amis["us-east-1"]
  instance_type = var.instance_type["t2"]
  key_name      = var.key_pairs["aws-us-1"]
  tags = {
    Name = "dev-${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acess-ssh.id}"]
}

# resource "aws_instance" "dev4" {
#   ami           = var.amis["us-east-1"]
#   instance_type = var.instance_type["t2"]
#   key_name      = var.key_pairs["aws-us-1"]
#   tags = {
#     Name = "dev-4"
#   }
#   vpc_security_group_ids = ["${aws_security_group.acess-ssh.id}"]
#   depends_on = [
#     aws_s3_bucket.bucket-dev4
#   ]
# }

resource "aws_instance" "dev5" {
  ami           = var.amis["us-east-1"]
  instance_type = var.instance_type["t2"]
  key_name      = var.key_pairs["aws-us-1"]
  tags = {
    Name = "dev-5"
  }
  vpc_security_group_ids = ["${aws_security_group.acess-ssh.id}"]
}

resource "aws_instance" "dev6" {
  provider      = aws.us-east-2
  ami           = var.amis["us-east-2"]
  instance_type = var.instance_type["t2"]
  key_name      = var.key_pairs["aws-us-2"]
  tags = {
    Name = "dev-6"
  }
  vpc_security_group_ids = ["${aws_security_group.acess-ssh-us-east-2.id}"]
  depends_on = [
    aws_dynamodb_table.dynamodb-dev
  ]
}
