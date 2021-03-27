variable "resource_name" {
  type        = string
  description = "default name for resources to be created"
  default     = "learning"
}

variable "subscription_tier_slug" {
  type        = string
  description = "DO's subscription_tier_slug"
  default     = "professional"
}