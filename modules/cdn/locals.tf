locals {
  cdn_profile_name                  = "${local.application_short_name}-${local.environment}-cdn"
  cdn_profile_sku                   = "Standard_Microsoft"
  cdn_endpoint_storage_account_name = "${local.application_short_name}-${local.environment}-cdn-sa"

  content_types = [
    "application/pdf",
    "image/svg+xml",
    "application/json",
    "application/javascript",
  ]

  application_short_name = var.tags.application_short_name
  environment            = var.tags.environment
}