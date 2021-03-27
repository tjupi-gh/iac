variable "resource_name" {
  type        = string
  description = "default name for resources to be created"
  default     = "learning"
}

variable "node_size" {
  type        = string
  description = "Machine type for k8s worker"
  default     = "s-2vcpu-2gb"
}

variable "nodes_count" {
  type        = number
  description = "Workers number"
  default     = 1
}

variable "k8s_region" {
  type        = string
  description = "default region to provision nodes at"
  default     = "fra1"
}

variable "docker_credentials" {
  type        = string
  description = "Credentials to access containers registry"
}
