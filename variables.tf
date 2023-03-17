variable "basename" {
  type = string
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{0,87}", var.basename)) && can(regex("[\\w]+$", var.basename))
    error_message = "Resource group names must be between 0 and 87 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
  description = "Basename of the module."
  default     = "fhir-001"
}

variable "location" {
  type        = string
  description = "Location of the resource group."
  default     = "North Europe"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the Resource Group."
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "prefix" {
  type        = string
  description = "Prefix for module names"
  default     = "fhir-prefix"
}

variable "postfix" {
  type        = string
  description = "Postfix for module names"
  default     = "101"
}

variable "sku_name" {
  type        = string
  description = "The Name of the SKU used for this Key Vault."
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "Valid values for sku_name are \"standard\" or \"premium\"."
  }
  default = "standard"
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Is Purge Protection enabled for this Key Vault?"
  default     = true
}