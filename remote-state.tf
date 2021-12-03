terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "lelton-dev"

    workspaces {
      name = "dev-aws"
    }
  }
}