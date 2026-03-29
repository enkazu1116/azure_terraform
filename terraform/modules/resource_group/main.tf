resource "azurerm_resource_group" "rg_dev" {
  name     = "${var.rg_name}-rg"
  location = var.rg_location
  tags     = var.tags
}