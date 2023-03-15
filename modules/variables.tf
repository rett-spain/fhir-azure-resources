variable "location" {
  type        = string
  description = "Location of the resource group and modules"
  default     = "North Europe"
}

variable "prefix" {
  type        = string
  description = "Prefix for module names"
  default     = "adl"
}

variable "postfix" {
  type        = string
  description = "Postfix for module names"
  default     = "101"
}

variable "aad_login" {
  description = "AAD login"
  type = object({
    name      = string
    object_id = string
    tenant_id = string
  })
  default = {
    name      = "AzureAD Admin"
    object_id = "00000000-0000-0000-0000-000000000000"
    tenant_id = "00000000-0000-0000-0000-000000000000"
  }
}

# Feature flags

variable "enable_private_endpoints" {
  type        = bool
  description = "Is secure enabled?"
  default     = false
}

variable "enable_jumphost" {
  type        = bool
  description = "Is jumphost required?"
  default     = false
}