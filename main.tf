module "do_container_registry" {
  source = "./modules/do/container-registry"
  
  token = var.do_token
  resource_name = var.resource_name
}

module "do_k8s" {
  source = "./modules/do/k8s-cluster"
  
  token = var.do_token
  resource_name = var.resource_name
  docker_credentials = module.do_container_registry.docker_credentials
}
