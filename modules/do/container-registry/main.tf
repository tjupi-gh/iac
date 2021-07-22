terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.5.1"
    }
  }
}

resource "digitalocean_container_registry" "cr" {
  name                   = var.resource_name
  subscription_tier_slug = var.subscription_tier_slug
}

resource "digitalocean_container_registry_docker_credentials" "cr_credentials_readonly" {
  registry_name = digitalocean_container_registry.cr.name
}

resource "digitalocean_container_registry_docker_credentials" "cr_credentials_readwrite" {
  registry_name = digitalocean_container_registry.cr.name
  write = true
}
