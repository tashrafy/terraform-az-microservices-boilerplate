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

variable "blob_host" {
  description = "A string that determines the hostname/IP address of the origin server. This string can be a domain name, Storage Account endpoint, Web App endpoint, IPv4 address or IPv6 address."
}

variable "cdn_is_compression" {
  description = "Indicates whether compression is to be enabled."
  default     = true
}

variable "cdn_is_http_allowed" {
  description = "Indicates whether http protocol is allowed."
  default     = false
}

variable "cdn_blob_host_name" {
  description = "The name of the origin. This is an arbitrary value. However, this value needs to be unique under the endpoint."
  default     = "blob-origin"
}