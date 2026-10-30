output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "app_subnet_id" {
  value = azurerm_subnet.app.id
}

output "acr_login_server" {
  value = azurerm_container_registry.main.login_server
}
