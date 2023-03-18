
variable "resource_group" {
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

