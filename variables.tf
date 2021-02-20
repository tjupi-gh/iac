variable "do_token" {
  type        = string
  description = "Account's token"
  sensitive   = true
}

variable "resource_name" {
  type        = string
  description = "default name for resources to be created"
  default     = "learning"
}
