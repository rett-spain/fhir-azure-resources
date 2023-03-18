locals {
  # Load the config-fhir.yml file into a variable
  config = yamldecode(file("${path.module}/config-fhir.yml"))

  # Tags for all resources
  tags = {
    Owner       = local.config.variables.owner != null ? local.config.variables.owner : var.owner
    Project     = local.config.variables.project != null ? local.config.variables.project : var.project
    Environment = local.config.variables.environment != null ? local.config.variables.environment : var.environment
    Toolkit     = local.config.variables.toolkit != null ? local.config.variables.toolkit : var.toolkit
    Name        = "${var.prefix}"
  }
  # Variables for all resources
  safe_prefix   = replace(local.prefix, "-", "")
  safe_postfix  = replace(local.postfix, "-", "")
  basename      = "${local.prefix}-${local.postfix}"
  safe_basename = "${local.safe_prefix}${local.safe_postfix}"

  # Location, prefix and postfix for the resources
  location = local.config.variables.location != null ? local.config.variables.location : var.location
  prefix   = local.config.variables.prefix != null ? local.config.variables.prefix : var.prefix
  postfix  = local.config.variables.postfix != null ? local.config.variables.postfix : var.postfix

  #Feature Flags
  enable_keyvault      = local.config.variables.enable_keyvault != null ? local.config.variables.enable_keyvault : var.enable_keyvault
  enable_service_plan  = local.config.variables.enable_service_plan != null ? local.config.variables.enable_service_plan : var.enable_service_plan
  enable_function_app  = local.config.variables.enable_function_app != null ? local.config.variables.function_app : var.function_app
  enable_redis_cache   = local.config.variables.enable_redis_cache != null ? local.config.variables.redis_cache : var.redis_cache
  enable_app_insight   = local.config.variables.enable_app_insight != null ? local.config.variables.app_insight : var.app_insight
  enable_log_analytics = local.config.variables.enable_log_analytics != null ? local.config.variables.log_analytics : var.enable_log_analytics

}