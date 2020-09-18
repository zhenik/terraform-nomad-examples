terraform {
  required_providers {
    nomad = {
      source  = "hashicorp/nomad"
      version = ">= 1.4.9"
    }
    template = {
      source  = "hashicorp/template"
      version = ">= 2.1.2"
    }
    vault = {
      version = ">= 1.5.3"
    }
  }
  required_version = ">= 0.13"
}

module "example" {
  source = "./../.."

  # nomad
  nomad_datacenters               = ["dc1"]
  nomad_namespace                 = var.nomad_namespace
}
