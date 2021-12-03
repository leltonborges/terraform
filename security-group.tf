
resource "aws_security_group" "acess-ssh" {
  name        = "acess-ssh"
  description = "Acesso ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["191.220.49.20/32"]
  }
  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acess-ssh-us-east-2" {
  provider    = "aws.us-east-2"
  name        = "acess-ssh"
  description = "Acesso ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["191.220.49.20/32"]
  }
  tags = {
    Name = "ssh"
  }

}
