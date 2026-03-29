variable "resource_group_name" {
  type        = string
  description = "リソースグループ名"
}

variable "location" {
  type        = string
  description = "リージョン"
}

variable "vnet_name" {
  type        = string
  description = "VNet名"
}

variable "address_space" {
  type        = list(string)
  description = "VNetのアドレス空間"
}

variable "address_prefixes" {
  type        = list(string)
  description = "サブネット"
}