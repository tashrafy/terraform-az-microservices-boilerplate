resource "azurerm_postgresql_server" "main" {
  name                = "${var.application_short_name}-${var.tags.environment}"
  location            = var.region
  resource_group_name = var.resource_group_name
  tags                = var.tags

  sku_name                     = var.sku_name
  storage_mb                   = var.postgres_storage
  backup_retention_days        = var.postgres_backup_retention
  geo_redundant_backup_enabled = var.postgres_is_grs
  auto_grow_enabled            = var.auto_grow
  administrator_login          = var.postgres_admin_username
  administrator_login_password = var.postgres_admin_password
  version                      = var.postgres_version
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "main" {
  name                = var.database_service_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.main.name
  charset             = var.postgres_charset
  collation           = var.postgres_collation
}

resource "azurerm_postgresql_firewall_rule" "main" {
  name                = var.firewall_service_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.main.name
  start_ip_address    = var.postgres_firewall_start_ip_address
  end_ip_address      = var.postgres_firewall_end_ip_address
}

resource "azurerm_postgresql_configuration" "main" {
  name                = "log_retention_days"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.main.name
  value               = "7"

  depends_on = [
    azurerm_postgresql_server.main,
  ]
}