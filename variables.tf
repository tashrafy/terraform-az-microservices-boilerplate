variable "vnet_address_space" {
  type        = list(any)
  description = "The list of address spaces used by the virtual network."
}

variable "subscription_id" {
  type        = string
  description = "(Required) Specifies the ID of the subscription. If this argument is omitted, the subscription ID of the current Azure Resource Manager provider is used."
}

variable "tenant_id" {
  type        = string
  description = "(Required) The Tenant ID should be used."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
  default     = "microservices-boilerplate-rg"
}

variable "region" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = "East US 2"
}

# KeyVault variables
variable "sku_name" {
  type        = string
  description = "Select Standard or Premium SKU"
  default     = "premium"
}

variable "enabled_for_deployment" {
  type        = string
  description = "Allow Azure Virtual Machines to retrieve certificates stored as secrets from the Azure Key Vault"
  default     = "true"
}

variable "enabled_for_disk_encryption" {
  type        = string
  description = "Allow Azure Disk Encryption to retrieve secrets from the Azure Key Vault and unwrap keys"
  default     = "true"
}

variable "enabled_for_template_deployment" {
  type        = string
  description = "Allow Azure Resource Manager to retrieve secrets from the Azure Key Vault"
  default     = "true"
}

variable "pod_replicas" {
  description = "Number of replicas desired for microservice deployment"
  default     = 1
}

variable "vnet_source_address_prefix" {
  description = "Source Address Prefix for vnet_inbound_default"
  default     = "100.66.56.0/24"
}

variable "vnet_destination_address_prefix" {
  description = "Destination Address Prefix for vnet_inbound_default"
  default     = "100.66.56.0/24"
}

variable "postgres_source_address_prefix" {
  description = "Source Address Prefix for postgres_inbound_default"
  default     = ["100.66.56.0/24"]
}