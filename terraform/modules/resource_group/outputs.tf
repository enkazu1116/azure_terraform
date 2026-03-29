output "resource_group_name" {
  value       = azurerm_resource_group.rg_dev.name
  description = "リソースグループ名"
}

output "location" {
  value       = azurerm_resource_group.rg_dev.location
  description = "リージョン"
}

output "tags" {
  value       = azurerm_resource_group.rg_dev.tags
  description = "タグ"
}