resource "azurerm_virtual_network" "vnet_dev" {
  name = var.vnet_name
  address_space = var.vnet_address_space
  location = azurerm_resource_group.rg_dev.location
  resource_group_name = azurerm_resource_group.rg_dev.name
}

resource "azurerm_subnet" "subnet_dev" {
  name = var.subnet_name
  resource_group_name = azurerm_resource_group.rg_dev.name
  virtual_network_name = var.vnet_name
  address_prefixes = var.subnet_address_prefix
} 