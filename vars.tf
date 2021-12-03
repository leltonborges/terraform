variable "amis" {
  type = map(string)

  default = {
      "us-east-1" = "ami-083654bd07b5da81d"
      "us-east-2" = "ami-002068ed284fb165b"
  }
}

variable "cdir_acesso_ssh" {
  type = list(string)
  default = [ "191.220.49.20/32" ]
}

variable "instance_type" {
    type = map(string)

    default = {
      "t2" = "t2.micro"
    }
  
}

variable "key_pairs" {
    type = map(string)
    default = {
      "aws-us-1" = "terraform-aws"
      "aws-us-2" = "terraform"
    }
  
}