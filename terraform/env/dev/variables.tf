variable "tenant_id" {
    type = string
    description = "AzureのテナントID"
}

variable "subscription_id" {
    type = string
    description = "AzureのサブスクリプションID"
}

variable "rg_name" {
    type = string
    description = "リソースグループ名"
}

variable "rg_location" {
    type = string
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
  description = "サブネットのプレフィックス"
}
