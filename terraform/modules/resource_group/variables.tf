variable "rg_name" {
  type        = string
  description = "リソースグループ名"
}

variable "rg_location" {
  type        = string
  description = "リージョン"
}

variable "tags" {
  type        = map(string)
  description = "RGのタグ"
  default     = {}
}