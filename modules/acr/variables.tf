variable "resource_group_name" {
  description = "Microsoft Azure Resource Group Name"
}

variable "region" {
  description = "Microsoft Azure Region"
}

variable "acr_service_name" {
  description = "Microsoft Azure Container Registry Service Name"
}

variable "acr_sku" {
  description = "Microsoft Azure Container Registry SKU"
  default     = "Basic"
}

variable "acr_admin_enabled" {
  description = "Microsoft Azure Container Registry Admin Enabled"
  default     = false
}