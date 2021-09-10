resource "azurerm_storage_account" "static" {
  name                      = "${var.name}${lower(random_id.storage.id)}${var.tags.environment}"
  resource_group_name       = var.resource_group_name
  location                  = var.region
  account_tier              = var.storage_account_tier
  account_replication_type  = var.storage_replication_type
  tags                      = var.tags
  enable_https_traffic_only = true

  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"
  }
}

resource "azurerm_advanced_threat_protection" "threat_protection" {
  target_resource_id = azurerm_storage_account.static.id
  enabled            = true
}

resource "random_id" "storage" {
  byte_length = 4
}