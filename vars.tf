variable "amis" {
  type = map(string)

  default = {
      "us-east-1" = "ami-083654bd07b5da81d"
      "us-east-2" = "ami-002068ed284fb165b"
  }
}