
resource "aws_security_group" "acess-ssh" {
  name        = "acess-ssh"
  description = "Acesso ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ssh"
  }

}