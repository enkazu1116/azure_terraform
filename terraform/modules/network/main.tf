# VNet
resource "azurerm_virtual_network" "vnet_dev" {
  name                = "${var.vnet_name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Subnet
resource "azurerm_subnet" "subnet_dev" {
  name                 = "${var.vnet_name}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_dev.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Public IP
resource "azurerm_public_ip" "pip_ip_dev" {
  name                = "${var.vnet_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# NSG and NSG Rures
resource "azurerm_network_security_group" "nsg_dev" {
  name                = "${var.vnet_name}-rsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  # リモートデスクトッププロトコル
  security_rule {
    name                        = "RDP"
    priority                    = 1000
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "*"
    source_port_range           = "3389"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }
  # Web
  security_rule {
    name                        = "web"
    priority                    = 1001
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "80"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }
}

# Network Interface
resource "azurerm_network_interface" "nic_dev" {
  name                = "${var.vnet_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  # 設定したサブネットIDとPublic IPを紐づける
  ip_configuration {
    name                          = "${var.vnet_name}-nic-config"
    subnet_id                     = azurerm_subnet.subnet_dev.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_ip_dev.id
  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_association_dev" {
  network_interface_id      = azurerm_network_interface.nic_dev.id
  network_security_group_id = azurerm_network_security_group.nsg_dev.id
}