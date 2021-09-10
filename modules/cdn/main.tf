# CDN Profile
resource "azurerm_cdn_profile" "cdn_profile" {
  name                = local.cdn_profile_name
  location            = var.region
  resource_group_name = var.resource_group_name
  sku                 = local.cdn_profile_sku

  tags = var.tags
}

# CDN Enpoint for the Storage Account
resource "azurerm_cdn_endpoint" "cdn_endpoint_sa" {
  name                      = local.cdn_endpoint_storage_account_name
  profile_name              = azurerm_cdn_profile.cdn_profile.name
  location                  = var.region
  resource_group_name       = var.resource_group_name
  is_http_allowed           = var.cdn_is_http_allowed
  is_compression_enabled    = var.cdn_is_compression
  content_types_to_compress = local.content_types
  origin_host_header        = var.blob_host

  origin {
    name      = var.cdn_blob_host_name
    host_name = var.blob_host
  }

  tags = var.tags
}
