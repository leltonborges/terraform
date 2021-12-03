provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

resource "aws_instance" "dev"{
    count = 3
    ami = "ami-083654bd07b5da81d"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev${count.index}" 
    }
    vpc_security_group_ids = ["${aws_security_group.acess-ssh.id}"]
}

resource "aws_security_group" "acess-ssh" {
    name = "acess-ssh"
    description = "Acesso ssh"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name ="ssh"
    }
  
}