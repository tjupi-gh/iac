output "docker_credentials" {
  value = digitalocean_container_registry_docker_credentials.cr_credentials_readonly.docker_credentials
}

output "docker_credentials_readwrite" {
  value = digitalocean_container_registry_docker_credentials.cr_credentials_readwrite.docker_credentials
}