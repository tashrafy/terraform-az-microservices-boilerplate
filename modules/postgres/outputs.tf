output "postgres_fqdn" {
  value = azurerm_postgresql_server.main.fqdn
}

output "postgres_id" {
  value = azurerm_postgresql_server.main.id
}
