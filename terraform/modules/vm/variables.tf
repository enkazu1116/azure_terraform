variable "vnet_name" {
    type = string
    description = "VNet名"
}

variable "vnet_address_space" {
    type = list(string)
    description = "VNetのアドレス空間"
}

variable "subnet_name" {
    type = string
    description = "サブネット名"
}

variable "subnet_address_prefix" {
    type = list(string)
    description = "サブネットのアドレス空間"
}