variable "name" {
  description = "(Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
  default     = "storage"
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for this storage account"
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Defines the type of replication to use for this storage account"
  default     = "ZRS"
}

variable "resource_group_name" {
  description = "Microsoft Azure Resource Group Name"
}

variable "tags" {
  description = "Map of attributes for this particular project/workspace."
  type        = map(string)
}

variable "region" {
  description = "Microsoft Azure Region"
}

variable "present" {
  description = "If true, enables all module resources"
  type        = string
  default     = "true"
}

variable "storage_is_enable_https_only" {
  description = "Boolean flag which forces HTTPS if enabled."
  default     = false
}