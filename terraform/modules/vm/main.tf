resource "random_id" "random_id" {
    keepers = {
      resource_group = azurerm_resource_group.rg_dev.name
    }

    byte_length = 8
}

resource "azurerm_storage_account" "storage_account_dev" {
  name = "diag${random_id.random_id.hex}"
  location = azurerm_resource_group.rg_dev.location
  resource_group_name = azurerm_resource_group.rg_dev.name
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_linux_virtual_machine" "vm_dev" {
  name = var.vm_net
  location = azurerm_resource_group.rg_dev.location
  resource_group_name = azurerm_resource_group.rg_dev.name
  network_interface_ids = [azurerm_network_interface.nic_dev.id]
  size = "Standard_DS1_v2"

  os_disk {
    name = "dev-osdisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }

  computer_name = "host-dev-name"
  admin_username = var.username

  admin_ssh_key {
    username = var.username
    public_key = ""
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storage_account_dev.primary_blob_endpoint
  }
}