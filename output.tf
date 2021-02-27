output "kube_config" {
  value = module.do_k8s.kube_config
  sensitive = true
}

output "docker_credentials" {
  value = module.do_container_registry.docker_credentials_readwrite
  sensitive = true
}