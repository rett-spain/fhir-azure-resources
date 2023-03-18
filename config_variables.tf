
variable "enable_resource_group" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}


variable "enable_keyvault" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "enable_service_plan" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "enable_function_app" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "enable_redis_cache" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "enable_app_insight" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "enable_log_analytics" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "enable_private_endpoints" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "enable_storage_account" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "owner" {
  type        = string
  description = "Owner tag value"
  default     = ""
}

variable "project" {
  type        = string
  description = "project tag value"
  default     = ""
}

variable "environment" {
  type        = string
  description = "environment tag value"
  default     = ""
}

variable "toolkit" {
  type        = string
  description = "toolkit tag value"
  default     = ""
}

variable "rg_resource" {
  default = null
}

variable "akv_resource" {
  default = null
}

variable "sta_resource" {
  default = null
}


