variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-0-9a-zA-Z]{1,21}$", var.basename)) && can(regex("[0-9a-zA-Z]+$", var.basename))
    error_message = "The name must be between 1 and 21 characters, can contain only letters, numbers, and hyphens. Must end with a letter or number. Cannot contain consecutive hyphens."
  }
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

variable "fhir_kind" {
  type        = string
  description = "Specifies the kind of the Healthcare FHIR Service. Possible values are: fhir-Stu3 and fhir-R4. Defaults to fhir-R4. Changing this forces a new Healthcare FHIR Service to be created."
  default     = "fhir-R4"
}