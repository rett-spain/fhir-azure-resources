variable "basename" {
  type = string
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{0,87}", var.basename)) && can(regex("[\\w]+$", var.basename))
    error_message = "Resource group names must be between 0 and 87 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
  description = "Basename of the module."
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

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}
