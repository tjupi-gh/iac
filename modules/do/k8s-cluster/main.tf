terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.5.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.0.2"
    }
  }
}

data "digitalocean_kubernetes_versions" "k8s_versions" {
  version_prefix = "1.20."
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = var.resource_name
  region  = var.k8s_region
  version = data.digitalocean_kubernetes_versions.k8s_versions.latest_version

  node_pool {
    name       = var.resource_name
    size       = var.node_size
    node_count = var.nodes_count
  }
}

provider "kubernetes" {
  host  = digitalocean_kubernetes_cluster.k8s.endpoint
  token = digitalocean_kubernetes_cluster.k8s.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
  )
}

resource "kubernetes_secret" "k8s_secrets" {
  metadata {
    name = "docker-cfg"
  }

  data = {
    ".dockerconfigjson" = var.docker_credentials
  }

  type = "kubernetes.io/dockerconfigjson"
}