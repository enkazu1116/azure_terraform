resource "azurerm_virtual_network" "vnet_dev" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet_dev" {
  name                 = "${var.vnet_name}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_dev.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_public_ip" "pip_dev" {
  name                = "${var.vnet_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "nic_dev" {
  name                = "${var.vnet_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.resource_group_name}-nic-conf"
    subnet_id                     = azurerm_subnet.subnet_dev.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_dev.id
  }
}