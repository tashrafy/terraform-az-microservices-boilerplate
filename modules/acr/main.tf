resource "azurerm_container_registry" "main" {
  name                = var.acr_service_name
  resource_group_name = var.resource_group_name
  location            = var.region
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}

resource "azurerm_management_lock" "registry-lock" {
  name       = "resource-lock"
  scope      = azurerm_container_registry.main.id
  lock_level = "CanNotDelete"
}
