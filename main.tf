terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.5.1"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

module "do_container_registry" {
  source = "./modules/do/container-registry"

  resource_name = var.resource_name
}

module "do_k8s" {
  source = "./modules/do/k8s-cluster"

  resource_name      = var.resource_name
  docker_credentials = module.do_container_registry.docker_credentials
  nodes_count = var.nodes_count
}
