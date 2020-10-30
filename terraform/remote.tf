terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = var.backend_organization

    workspaces {
      name = var.backend_workspace
    }
  }
}

variable "backend_organization" {
  default = "TF_BACKEND_ORGANIZATION"
  description = "Terraform Cloud organization"
}

variable "backend_workspace" {
  default = "TF_BACKEND_WORKSPACE"
  description = "Terraform Cloud workspace"
}
