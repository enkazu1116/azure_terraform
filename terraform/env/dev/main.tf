module "resource_group" {
  source = "../../modules/resource_group"

  rg_name = var.rg_name
  rg_location = var.rg_location
  tags = {
    environment = "dev"
  }
}

module "network" {
  source = "../../modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location              = module.resource_group.location
  vnet_name             = var.vnet_name
  address_space         = var.address_space
  address_prefixes      = var.address_prefixes
}