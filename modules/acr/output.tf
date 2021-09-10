output "azurerm_container_registry_login_server" {
  value = azurerm_container_registry.main.login_server
}

output "resource_name" {
  value = azurerm_container_registry.main.name
}