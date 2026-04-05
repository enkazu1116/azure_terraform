output "public_ip_address" {
  value = azurerm_public_ip.pip_ip_dev.ip_address
}

output "network_interface" {
  value = azurerm_network_interface.nic_dev.id
}