terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.5.1"
    }
  }
  required_version = "~> 0.14"
}

provider "digitalocean" {
  token = var.token
}

resource "digitalocean_container_registry" "cr" {
  name                   = var.resource_name
  subscription_tier_slug = var.subscription_tier_slug
}

resource "digitalocean_container_registry_docker_credentials" "cr_credentials" {
  registry_name = digitalocean_container_registry.cr.name
}