output "docker_credentials" {
  value = digitalocean_container_registry_docker_credentials.cr_credentials.docker_credentials
}