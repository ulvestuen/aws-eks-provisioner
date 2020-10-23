terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "ulvestuen"

    workspaces {
      name = "aws-eks-test"
    }
  }
}
